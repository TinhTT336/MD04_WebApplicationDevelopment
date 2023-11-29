create database session10_product;
use session10_product;

create table category
(
    id     int primary key auto_increment,
    name   varchar(50) not null unique,
    status bit(1) default 1,
    quantity_product int default 0
);
create table product
(
    id          int primary key auto_increment,
    name        varchar(50) not null,
    price       float       not null,
    category_id int         not null,
    foreign key (category_id) references category (id)
);

DELIMITER //
CREATE PROCEDURE PROC_GET_CATEGORY()
begin
  SELECT *FROM category;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_ADD_CATEGORY(IN name_in varchar(50))
begin
    INSERT INTO category(name)VALUES (name_in);
end;
//
DELIMITER //
CREATE PROCEDURE PROC_UPDATE_CATEGORY(IN name_in varchar(50),status_in bit,id_in int)
begin
    UPDATE category SET name=name_in,status=status_in WHERE id=id_in;
end;
//


DELIMITER //
CREATE PROCEDURE PROC_DELETE_CATEGORY(IN id_in int)
begin
    DELETE FROM category WHERE id=id_in;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_FIND_CATEGORY_BY_ID(IN id_in int)
begin
    SELECT *FROM category WHERE id=id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_GET_PRODUCT()
begin
    SELECT *FROM product;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_ADD_PRODUCT(IN name_in varchar(50),price_in float,category_id_in int)
begin
    INSERT INTO product(name,price,category_id)VALUES (name_in,price_in,category_id_in);
end;
//

call PROC_ADD_PRODUCT('abc',50,1);
DELIMITER //
CREATE PROCEDURE PROC_UPDATE_PRODUCT(IN name_in varchar(50),price_in float,category_in int,id_in int)
begin
    UPDATE product SET name=name_in,price=price_in,category_id=category_in WHERE id=id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_DELETE_PRODUCT(IN id_in int)
begin
    DELETE FROM product WHERE id=id_in;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_FIND_PRODUCT_BY_ID(IN id_in int)
begin
    SELECT *FROM product WHERE id=id_in;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_UPDATE_CATEGORY_QUANTITY(IN id_in int)
begin
    UPDATE category SET quantity_product=quantity_product+1 WHERE id=id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_UPDATE_CATEGORY_WHEN_PRODUCT_UPDATE(IN id_in int,IN id_update int)
begin
    UPDATE category SET quantity_product=quantity_product-1 WHERE id=id_in;
    UPDATE category SET quantity_product=quantity_product+1 WHERE id=id_update;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_UPDATE_CATEGORY_WHEN_PRODUCT_DELETE(IN id_in int)
begin
    UPDATE category SET quantity_product=quantity_product-1 WHERE id=id_in;
end;
//





