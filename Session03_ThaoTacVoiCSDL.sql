create database session03_practice01;
use session03_practice01;
-- drop database session03_practice01;
create table Class(
class_id int primary key auto_increment,
class_name varchar(50) not null ,
start_date date,
status boolean
);
create table Student(
student_id int primary key auto_increment,
student_name varchar(50) not null ,
address varchar(255),
phone varchar(50),
status boolean,
class_id int,
foreign key (class_id) references Class(class_id)
);
create table Subject(
sub_id int primary key auto_increment,
sub_name varchar(50),
credit tinyint,
status boolean default 1
);

create table Mark(
mark_id int primary key auto_increment,
sub_id int,
foreign key (sub_id) references Subject(sub_id),
student_id int,
foreign key (student_id) references Student(student_id),
mark int not null check (mark between 1 and 100),
exam_times tinyint
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (student_name, Address, Phone, Status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (student_name, Address, Status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, Address, Phone, Status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (sub_id, student_id, Mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
 /*Hiển thị danh sách tất cả các học viên*/      
select * from Student;    

/* Hiển thị danh sách các học viên đang theo học.*/
select * from Student where status=1;

/*Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.*/
select * from Subject where credit<10;

/*Hiển thị danh sách học viên lớp A1*/
select * from Student JOIN  Class ON Student.class_id=Class.class_id WHERE class_name='A1';

/*Hiển thị điểm môn CF của các học viên.*/
select Student.student_id,Student.student_name,Mark.mark from Student JOIN Mark ON Mark.student_id=Student.student_id 
JOIN Subject ON Subject.sub_id= Mark.sub_id WHERE Subject.sub_name='CF';

/* Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’*/
select * from Student where student_name LIKE 'h%';

/*• Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.*/
select * from Class where start_date LIKE '%%%%-12-%%';
select * from Class where Month(start_date) LIKE 12;

/*• Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.*/
select * from Subject where credit between 3 and 5;

/*• Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.*/
UPDATE  Student SET class_id=2 where student_name='Hung';

/*• Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.*/
   select DISTINCT Student.student_name,Subject.sub_name,Mark.mark from Student JOIN Mark ON Student.student_id=Mark.student_id
   JOIN Subject ON Subject.sub_id=Mark.sub_id ORDER BY Mark.mark DESC, Student.student_name ASC;
   
create database QLBH;
use QLBH; 

create table customer(
c_id int primary key auto_increment,
c_name varchar(25) not null,
c_age tinyint
);
create table orders(
o_id int primary key auto_increment,
c_id int,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price int
);
create table product(
p_id int primary key auto_increment,
p_name varchar(50),
p_price int check (p_price>0)
);

create table order_detail(
o_id int,
foreign key (o_id) references orders(o_id),
p_id int,
foreign key (p_id) references product(p_id),
o_quantity int
);

INSERT INTO customer(c_name,c_age)
VALUES ( 'A', 10),
       ( 'B', 20),
       ( 'C', 50);
    
INSERT INTO orders(c_id,o_date)
VALUES ( '1', '2006-03-21'),
       ( '2', '2006-03-23'),
       ( '1', '2006-03-16');    
       
INSERT INTO product(p_name,p_price)
VALUES ( 'May giat', 3),
       ( 'Tu lanh', 5),
       ( 'Dieu hoa', 7), 
       ( 'Quat', 7), 
       ( 'Bep dien', 7);

INSERT INTO order_detail(o_id,p_id,o_quantity)
VALUES ( 1,'1', 3),
       ( 1,'3', 7),
       ( 1,'4', 2),
       ( 2,'1', 1),
       ( 3,'1', 8),
       ( 2,'5', 4),
       ( 2,'3', 3);
       -- select order_detail.o_id,sum(order_detail.o_quantity*product.p_price) as total from order_detail JOIN product ON product.p_id=order_detail.p_id GROUP BY order_detail.o_id;
       
/*Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order*/
select orders.o_id,orders.o_date,product.p_price from orders JOIN order_detail ON orders.o_id=order_detail.o_id 
JOIN product ON order_detail.p_id=product.p_id;

/*• Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách*/
select customer.c_id,customer.c_name,product.p_name from customer JOIN orders ON customer.c_id=orders.c_id
JOIN order_detail ON order_detail.o_id=orders.o_id JOIN product ON product.p_id=order_detail.p_id;

/*• Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào*/
select * from customer WHERE c_id NOT IN(select c_id from orders);

/*• Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)       */	
select orders.o_id, orders.o_date,sum(order_detail.o_quantity*product.p_price) as o_total_price from orders 
JOIN order_detail ON order_detail.o_id=orders.o_id
JOIN product ON product.p_id=order_detail.p_id GROUP BY order_detail.o_id;
 
select o.o_id,c.c_name,o.o_date from orders o
JOIN customer c ON o.c_id=c.c_id;

select od.o_id,p.p_name,od.o_quantity,p.p_price ,(od.o_quantity*p.p_price) as total from order_detail od 
JOIN product p ON p.p_id=od.p_id ;

select od.o_id,o.o_date,sum(od.o_quantity*p.p_price) as total,count(*) as tong_sp from order_detail od 
 JOIN orders o ON od.o_id=o.o_id
JOIN product p ON p.p_id=od.p_id GROUP BY od.o_id;


