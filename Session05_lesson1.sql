create database Session05_lesson1_QLBH;
use Session05_lesson1_QLBH;

create table customer(
c_id int primary key auto_increment,
c_name varchar(50),
age tinyint
);
insert into customer(c_name,age)values('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);

create table orders(
o_id int primary key auto_increment,
c_id int,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price int
);
insert into orders(o_id,c_id,o_date)values(1,1,'2006-03-21'),(2,2,'2006-03-23'),(3,1,'2006-03-16');

create table product(
p_id int primary key auto_increment,
p_name varchar(50),
price int
);
INSERT INTO product(p_name,price)
VALUES ( 'May giat', 3),
       ( 'Tu lanh', 5),
       ( 'Dieu hoa', 7), 
       ( 'Quat', 1), 
       ( 'Bep dien', 2);
       
create table order_detail(
o_id int,
foreign key (o_id) references orders(o_id),
p_id int,
foreign key (p_id) references product(p_id),
o_quantity int
);
INSERT INTO order_detail(o_id,p_id,o_quantity)
VALUES ( 1,1, 3),
       ( 1,3, 7),
       ( 1,4, 2),
       ( 2,1, 1),
       ( 3,1, 8),
       ( 2,5, 4),
       ( 2,3, 3);  
-- Thực hiện đánh chỉ mục trên trường name, bảng customer 
create index id_name on customer(c_name);

/*- Tạo view hiển thị danh sách đơn hàng (case when )
    id , userName , status 
    status = 0 thì hiển thị đang chờ xử lý
    status = 1 thì hiện thị dang giao hàng
    status = 2 thì hiển thị đã hoàn tất */
    
    alter table orders add column status bit default 1;
    update orders set status=2 where o_id=3;
    
    create view vw_orders as
    select o.o_id,c.c_name,
    case when status=0 then 'đang chờ xử lý'
    when status=1 then 'dang giao hàng'
    else 'đã hoàn tất'
    end as status
    from orders o JOIN customer c ON o.c_id=c.c_id;
    
    select * from vw_orders;
    
    -- Tạo thủ tục thêm mới sản phẩm
  DELIMITER //
    create procedure proc_add_product(IN name varchar(50),price int)
    begin
    insert into product(p_name,price)values(name,price);
    end;
    //
    
    call proc_add_product('AAA',139000);
    
-- Tạo thủ tục lấy ra 5 sản phẩm có giá cao nhất 
DELIMITER //
    create procedure proc_get_5_max_product()
    begin
    select p_id,p_name from product ORDER BY price DESC LIMIT 5;
    end;
    //
    
    call proc_get_5_max_product();

-- Tạo thủ tục cập nhật
DELIMITER //
    create procedure proc_get_update_product(IN name varchar(50), price_in int)
    begin
    update product set p_name=name,price=price_in;
    end;
    //
    
    call proc_get_update_product('BBB',169000);

-- Tạo thủ tục xóa sản phẩm : 
DELIMITER //
    create procedure proc_delete_product(IN id int)
    begin
    delete from product where p_id=id;
    end;
    //
    
    call proc_delete_product(2);
    
    -- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order, danh sách phải sắp xếp theo thứ tự ngày tháng, hóa đơn mới hơn nằm trên như hình sau: [1.5]
create view orders_order_detail_product_view as
select o.o_id, od.o_quantity, o.c_id, o.o_date, o.o_total_price, p.*
from orders o
         join order_detail od on o.o_id = od.o_id
         join product p on od.p_id = p.p_id;

select o_id, o_date, price
from orders_order_detail_product_view;

-- Hiển thị tên và giá của các sản phẩm có giá cao nhất như sau: [2.0]
create view vw_product_with_max_price as
select p_name, price as p_price
from product
where price >= all (select max(price) from product);

select *
from vw_product_with_max_price;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó như sau: [2.0]
create view vw_orders as
select c.c_name, p.p_name
from customer c
         JOIN orders o ON c.c_id = o.c_id
         JOIN order_detail od ON o.o_id = od.o_id
         JOIN product p ON p.p_id = od.p_id;
select*
from vw_orders;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào như sau: [2.0]
select c_name
from customer
where c_id NOT IN (select c_id from orders);

-- Hiển thị chi tiết của từng hóa đơn như sau
create view vw_order_detail as
select od.o_id, o.o_date, od.o_quantity, p.p_name, p.price
from order_detail od
         JOIN orders o ON o.o_id = od.o_id
         JOIN product p ON p.p_id = od.p_id
GROUP BY o_id, o_date, o_quantity, p_name, price;
select*
from vw_order_detail;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) như sau
create view vw_order_detail_total as
select od.o_id, o.o_date, sum(od.o_quantity * p.price) as o_total_price
from order_detail od
         JOIN orders o ON o.o_id = od.o_id
         JOIN product p ON p.p_id = od.p_id
GROUP BY od.o_id, o.o_date;
select*
from vw_order_detail_total;

-- Tạo một view tên là Sales để hiển thị tổng doanh thu của siêu thị như sau:
create view vw_sales as
select sum(od.o_quantity * p.price) as sales
from order_detail od
         JOIN product p ON p.p_id = od.p_id;
select*
from vw_sales;

DELIMITER //
create procedure proc_get_sales(OUT sales int)
begin
    select sum(od.o_quantity * p.price) as sales
    from order_detail od
             JOIN product p ON p.p_id = od.p_id;
end;
//

call proc_get_sales(@sales);

-- Xóa tất cả các ràng buộc khóa ngoại, khóa chính của tất cả các bảng
alter table orders
    drop constraint orders_ibfk_1;
alter table order_detail
    drop constraint Session05_lesson1_QLBH.order_detail.order_detail_ibfk_1;
alter table order_detail
    drop constraint Session05_lesson1_QLBH.order_detail.order_detail_ibfk_2;

-- Tạo một stored procedure tên là delProduct nhận vào 1 tham số là tên của một sản phẩm, strored procedure này sẽ xóa sản phẩm có tên được truyên vào thông qua tham số, và các thông tin liên quan đến sản phẩm đó ở trong bảng OrderDetail:
DELIMITER //
create procedure del_product(IN pro_name varchar(50))
begin
    DECLARE p_id INT;
    SELECT od.p_id INTO p_id
    FROM order_detail od
             JOIN product p ON p.p_id = od.p_id
    WHERE p.p_name = pro_name;
    DELETE FROM order_detail WHERE p_id = p_id;
    delete from product p where p_name = pro_name;
end;
//

call del_product('Quat');

