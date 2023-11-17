create database ss05_lesson;
use ss05_lesson;

create table products(
    id int primary key auto_increment,
    product_code int,
    product_name varchar(50),
    product_price int,
    product_amount int,
    product_description text,
    product_status bit default 1
);

insert into products(product_code, product_name, product_price, product_amount, product_description)
values (01,'Son duong DHC',159000,20,'Son duong DHC'),(02,'Son duong Cocoon',39000,20,'Son duong Cocoon'),(03,'Son MAC',559000,20,'Son MAC'),(04,'Son 3CE',359000,20,'Son 3CE'),(05,'Son Maybeline',259000,20,'Son Maybeline');

DELIMITER //
CREATE PROCEDURE INSERT_PRODUCT( IN product_code_in int,IN product_name_in varchar(50),IN product_price_in int,IN product_amount_in int,IN product_description_in text)
begin
 INSERT INTO products(product_code, product_name, product_price, product_amount, product_description)values (product_code_in,product_name_in,product_price_in,product_amount_in,product_description_in);
end;
//
DELIMITER ;

call INSERT_PRODUCT(01,'Son duong DHC',159000,20,'Son duong DHC');
call INSERT_PRODUCT(02,'Son duong Cocoon',39000,20,'Son duong Cocoon');
call INSERT_PRODUCT(03,'Son MAC',559000,20,'Son MAC');
call INSERT_PRODUCT(04,'Son 3CE',359000,20,'Son 3CE');
call INSERT_PRODUCT(05,'Son Maybeline',259000,20,'Son Maybeline');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table Products add index unique_index (product_code);
alter table products drop index unique_index;
-- • Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table Products add index composite_index(product_name,product_price);
alter table products drop index composite_index;
-- • Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN select * from products;
-- • So sánh câu truy vấn trước và sau khi tạo index

-- Bước 4:
-- • Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- • Tiến hành sửa đổi view
-- • Tiến hành xoá view

create view product_view as
select product_code,product_name,product_price,product_status from products;

select * from product_view;
drop view product_view;

create or replace view product_view as
select product_code,product_name,product_price,product_description,product_status from products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure get_products()
begin
    select * from products;
end;
//DELIMITER ;

call get_products();

-- • Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure add_product(IN product_code_in int,IN product_name_in varchar(50),IN product_price_in int,IN product_amount_in int,IN product_description_in text)
begin
   insert into products(product_code, product_name, product_price, product_amount, product_description)
       values(product_code_in,product_name_in,product_price_in,product_amount_in,product_description_in);
end;
//DELIMITER ;
call add_product(06,'Son DHC',169000,20,'Son DHC');

-- • Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure edit_product
    (IN id_in int,
    IN product_code_io int,
    IN product_name_io varchar(50),
    IN product_price_io int,
    IN product_amount_io int,
    IN product_description_io text
    )
begin
    update products set product_code=product_code_io,product_name=product_name_io,product_price=product_price_io,product_amount=product_amount_io,product_description=product_description_io where id=id_in;
end;
//DELIMITER ;

call edit_product(1,07,'Son',169000,'18','Son');

-- • Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure delete_product
    (IN id_in int)
begin
    delete from products where id=id_in;
end;
//DELIMITER ;

call delete_product(1);

