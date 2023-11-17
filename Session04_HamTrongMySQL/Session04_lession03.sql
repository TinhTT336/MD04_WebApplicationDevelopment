create database StudenTest;
use StudenTest;

create table test(
test_id int auto_increment primary key,
name varchar(50)
);
create table student(
student_id int auto_increment primary key,
name varchar(50),
age int,
status bit default 1
);
create table student_test(
student_id int,
foreign key (student_id) references student(student_id),
test_id int,
foreign key (test_id) references test(test_id),
date date,
mark float
);
insert into test(name)values('EPC'),('DWMX'),('SQL1'),('SQL2');
insert into student(name,age)values('Nguyen Hong Ha',20),('Truong Ngoc Anh',30),('Tuan Minh',25),('Dan Truong',22);
insert into student_test(student_id,test_id,date,mark)values(1,1,'2006-07-17',8),(1,2,'2006-07-18',5),(1,3,'2006-07-19',7),(2,1,'2006-07-17',7),(2,2,'2006-07-18',4),(2,3,'2006-07-19',2),(3,1,'2006-07-17',10),(3,3,'2006-07-18',1);
-- Sử dụng alter để sửa đổi
-- a. Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
alter table student add constraint check_age check(age between 15 and 55);

-- b. Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
alter table student_test modify mark float default 0;

-- c. Thêm khóa chính cho bảng studenttest là (RN,TestID)
alter table student_test add primary key pk_st (student_id,test_id);

-- d. Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
alter table test add constraint u_name  unique(name);

-- e. Xóa ràng buộc duy nhất (unique) trên bảng Test
alter table test drop constraint u_name;

-- Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi giống như hình sau:
select s.name,t.name,st.mark,st.date from student 
JOIN student_test st ON st.student_id=s.student_id
JOIN test t ON t.test_id=st.test_id;

-- Hiển thị danh sách các bạn học viên chưa thi môn nào như hình sau:
select s.student_id,s.name,s.age from student s
LEFT JOIN student_test t ON t.student_id=s.student_id
WHERE t.student_id is null;

/*Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5) như sau:*/
select s.name, t.name as test_name,st.mark,st.date from student s 
JOIN student_test st ON st.student_id=s.student_id
JOIN test t ON t.test_id=st.test_id where mark<5;

/*Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp xếp thì chỉ được ½ số điểm) như sau:*/
select s.name,avg(st.mark) as AVGMark from student s
JOIN student_test st ON s.student_id=st.student_id
GROUP BY name
ORDER BY AVGMark DESC;

/*Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất như sau:*/
select s.name,avg(st.mark) as AVGMark from student s
JOIN student_test st ON s.student_id=st.student_id
GROUP BY name
ORDER BY AVGMark DESC LIMIT 1;
-- cach 2
select s.name,avg(st.mark) as AVGMark from student s
JOIN student_test st ON s.student_id=st.student_id
GROUP BY name HAVING AVGMark>=ALL(select avg(mark) from student_test GROUP BY student_id);

/*Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học như sau:*/
select t.name, max(st.mark) from test t
JOIN student_test st ON t.test_id=st.test_id
GROUP BY name
ORDER BY name;

/*Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null như sau:*/
select s.name,t.name as test_name from student s
LEFT JOIN student_test st ON st.student_id=s.student_id
LEFT JOIN test t ON t.test_id=st.test_id 
GROUP BY s.name,t.name
ORDER BY name;

/*Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.
11.Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.*/
update student set age=(age+1);
alter table student modify status varchar(10);

/*Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student lên như sau:*/
update student set status=(CASE WHEN age<30 THEN 'Young' ELSE 'Old' END);
-- delete from student where student_id IN(5,6,7,8); 
select * from student;

/*Hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi như sau:*/
select s.name, t.name as test_name,st.mark,st.date from student s 
JOIN student_test st ON st.student_id=s.student_id
JOIN test t ON t.test_id=st.test_id;

/*Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’ và điểm thi trung bình >4.5. Thông tin bao gồm Tên sinh viên, tuổi, điểm trung bình*/
select s.name,avg(st.mark) as AVGMark from student s
JOIN student_test st ON s.student_id=st.student_id
GROUP BY name
HAVING name LIKE 'T%' and AVGMark>4.5;
-- Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng). Trong đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì xếp hạng 1.
SELECT
    s.student_id AS Ma,
    s.name AS Ten,
    s.age AS Tuoi,
    avg(st.mark) AS DiemTrungBinh ,
    DENSE_RANK() OVER (ORDER BY avg(st.mark) DESC) AS XepHang
    from student s
    JOIN student_test st ON s.student_id=st.student_id
    GROUP BY s.student_id,s.name;
    

-- Sủa đổi kiểu dữ liệu cột name trong bảng student thành nvarchar(max)
alter table student modify name nvarchar(255);
-- Cập nhật (sử dụng phương thức write) cột name trong bảng student với yêu cầu sau:
-- a. Nếu tuổi >20 -> thêm ‘Old’ vào trước tên (cột name)
-- b. Nếu tuổi <=20 thì thêm ‘Young’ vào trước tên (cột name)
update student set name=concat(IF (age >20,'Old','Young'),name);
-- Xóa tất cả các môn học chưa có bất kỳ sinh viên nào thi
delete from test where test_id NOT IN(select test_id from student_test);
-- Xóa thông tin điểm thi của sinh viên có điểm <5.
delete from student_test where mark<5;

