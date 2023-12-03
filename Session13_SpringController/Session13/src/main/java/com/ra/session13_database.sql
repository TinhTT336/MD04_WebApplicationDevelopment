create database session13_database;
use session13_database;

create table category
(
    id     int primary key auto_increment,
    name   varchar(100) not null unique,
    status bit(1) default 1
);
create table product
(
    id          int primary key auto_increment,
    name        varchar(255) not null unique,
    price       double       not null,
    category_id int          not null,
    foreign key (category_id) references category (id)
);
DELIMITER //
CREATE PROCEDURE PROC_GET_CATEGORIES()
begin
    SELECT *FROM category;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_ADD_CATEGORY(IN name_in varchar(100))
begin
    INSERT INTO category(name) VALUES (name_in);
end;
//
DELIMITER //
CREATE PROCEDURE PROC_UPDATE_CATEGORY(IN name_in varchar(100), status_in bit, id_in int)
begin
    UPDATE category SET name=name_in, status=status_in WHERE id = id_in;
end;
//


DELIMITER //
CREATE PROCEDURE PROC_DELETE_CATEGORY(IN id_in int)
begin
    DELETE FROM category WHERE id = id_in;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_FIND_CATEGORY_BY_ID(IN id_in int)
begin
    SELECT *FROM category WHERE id = id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_GET_PRODUCTS()
begin
    SELECT *FROM product;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_ADD_PRODUCT(IN name_in varchar(255), price_in double, category_id_in int)
begin
    INSERT INTO product(name, price, category_id) VALUES (name_in, price_in, category_id_in);
end;
//

DELIMITER //
CREATE PROCEDURE PROC_UPDATE_PRODUCT(IN name_in varchar(255), price_in double, category_in int, id_in int)
begin
    UPDATE product SET name=name_in, price=price_in, category_id=category_in WHERE id = id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_DELETE_PRODUCT(IN id_in int)
begin
    DELETE FROM product WHERE id = id_in;
end;
//
DELIMITER //
CREATE PROCEDURE PROC_FIND_PRODUCT_BY_ID(IN id_in int)
begin
    SELECT *FROM product WHERE id = id_in;
end;
//


DELIMITER //
CREATE PROCEDURE PROC_PAGINATION_CATEGORY(IN limit_page int, IN current_page int,OUT total_page int)
begin
    declare offset_page int;
    SET total_page=ceil((select count(*) from  category)/limit_page);
    SET offset_page = (current_page - 1) * limit_page;
    SELECT * FROM category LIMIT limit_page OFFSET offset_page;
end;
//

call PROC_PAGINATION_CATEGORY(2,1,@total);
select @total;
DELIMITER //
CREATE PROCEDURE PROC_PAGINATION_PRODUCT(IN limit_page int, IN current_page int,OUT total_page int)
begin
    declare offset_page int;
    SET total_page=ceil((select count(*) from  product)/limit_page);
    SET offset_page = (current_page - 1) * limit_page;
    SELECT * FROM product LIMIT limit_page OFFSET offset_page;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_SEARCH_CATEGORY_BY_NAME(IN search_name varchar(100))
begin
    SELECT * FROM category WHERE LCASE(name)LIKE concat('%',LCASE(search_name),'%');
end //

DELIMITER //
CREATE PROCEDURE PROC_SEARCH_PRODUCT_BY_NAME(IN search_name varchar(255))
begin
    SELECT * FROM product WHERE LCASE(name)LIKE concat('%',LCASE(search_name),'%');
end //
