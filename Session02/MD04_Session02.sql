create database session02;
use session02;

create table category(
id int primary key auto_increment,
category_name varchar(50) not null
);
drop table category;

-- chinh sua bang
ALTER TABLE category ADD column descriptions text NOT NULL  after category_name;
ALTER TABLE category MODIFY descriptions varchar(255);
ALTER TABLE category MODIFY descriptions int NOT NULL;
ALTER TABLE category ADD constraint check(descriptions>100);

-- UNSIGNED : so duong
drop table category;
create table category(
category_id int primary key auto_increment,
category_name varchar(50) unique,
status tinyint default 1
);

create table product(
id int primary key auto_increment,
product_name varchar(200),
category_id int,
foreign key(category_id) references category(category_id),
price float check(price>0),
sale_price float 
-- check(sale_price<price)
);
create table customer(
id int primary key auto_increment,
name varchar(100),
mail varchar(100),
birthday date,
gender tinyint(1)
);
create table orders(
id int primary key auto_increment,
customer_id int,
foreign key(customer_id) references customer(id),
created date default(current_date()),
status tinyint default 1
);

create table order_detail(
order_id int,
foreign key(order_id) references orders(id),
product_id int,
foreign key(product_id) references product(id),
quantity int,
price float,
primary key(order_id,product_id)
);

ALTER TABLE orders ADD column note text;
INSERT INTO category(category_name)values('son duong'),('son kem'),('son li'),('son gio'),('son nhu');
INSERT INTO product(product_name,category_id,price,sale_price)values('son DHC',1,159000,139000),('son Cocoon',1,39000,null),('son MAC',3,559000,489000),('son 3CE',2,259000,239000),('son Maybeline',5,239000,null);
INSERT INTO customer(name,mail,birthday,gender)values('Tinh','tinh@gmail.com','2000-01-01',1),('Tung','tung@gmail.com','2000-02-02',0),('Duc','duc@gmail.com','2000-03-03',0),('Anh','anh@gmail.com','2000-03-03',1),('Son','son@gmail.com','2000-04-04',1);
INSERT INTO orders(customer_id)values(1),(2),(3),(4),(1);
INSERT INTO order_detail(order_id,product_id,quantity,price)values(1,1,1,159000),(1,2,2,39000),(2,3,1,489000),(3,4,1,239000),(4,5,1,239000);	
UPDATE orders SET note='Giao hang trong gio hanh chinh' where id=1;
UPDATE orders SET note='Giao hang nhanh' where id=2;
UPDATE orders SET note='Goi truoc khi giao hang' where id=5;