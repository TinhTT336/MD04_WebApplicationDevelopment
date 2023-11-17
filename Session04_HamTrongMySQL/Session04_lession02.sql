create database session04_QLBH;
use session04_QLBH;

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
       
/*Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order, danh sách phải sắp xếp theo thứ tự ngày tháng, hóa đơn mới hơn nằm trên như hình sau:*/
select od.o_id,o.o_date,sum(od.o_quantity*p.price)as  o_total_price from order_detail od
JOIN  orders o ON  o.o_id=od.o_id
JOIN product p ON p.p_id=od.p_id    
GROUP BY od.o_id,o.o_date;

-- Hiển thị tên và giá của các sản phẩm có giá cao nhất như sau:
select distinct p_name, price from product where price =(select max(price) from product);

/* Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó như sau:*/
select customer.c_id,customer.c_name,GROUP_CONCAT(product.p_name SEPARATOR " - ") AS pro_name from customer JOIN orders ON customer.c_id=orders.c_id
JOIN order_detail ON order_detail.o_id=orders.o_id JOIN product ON product.p_id=order_detail.p_id GROUP BY c_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào như sau:
select c_id,c_name from customer where c_id NOT IN(select c_id from orders);

-- cach 2: 
select c.c_id,c.c_name from customer c
where not exists (select * from orders o where o.cID=c.cID);

-- cach 3: 
SELECT c.c_name AS CustomerName
FROM customer c
LEFT JOIN orders o ON c.c_id = o.c_id
WHERE o.c_id IS NULL;

-- Hiển thị chi tiết của từng hóa đơn như sau :
select od.o_id,o.o_date,od.o_quantity,p.p_name,p.price from order_detail od
JOIN  orders o ON  o.o_id=od.o_id
JOIN product p ON p.p_id=od.p_id 
GROUP BY o_id,o_date,o_quantity,p_name,price;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
select od.o_id,o.o_date, sum(od.o_quantity*p.price)as  o_total_price from order_detail od
JOIN orders o ON  o.o_id=od.o_id
JOIN product p ON p.p_id=od.p_id 
GROUP BY od.o_id,o.o_date;