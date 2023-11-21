create database session05_protected_view;
use session05_protected_view;

create table Class(
class_id int primary key not null auto_increment,
class_name varchar(255) not null ,
start_date date not null,
status boolean
);
create table Student(
student_id int primary key auto_increment,
student_name varchar(30) not null ,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null
);
create table Subject(
sub_id int primary key auto_increment,
sub_name varchar(30),
credit tinyint default 1 check(credit>=1),
status bit default 1
);

create table Mark(
mark_id int primary key auto_increment,
sub_id int ,
student_id int ,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1
);

 -- Thêm ràng buộc khóa ngoại trên cột ClassID của bảng Student, tham chiếu đến cột ClassID trên bảng Class.
 alter table student add constraint foreign key (class_id) references class(class_id);
 
-- b. Thêm ràng buộc cho cột StartDate của bảng Class là ngày hiện hành.
alter table class modify start_date date default (current_date);

-- c. Thêm ràng buộc mặc định cho cột Status của bảng Student là 1.
alter table student modify status boolean default 1;

-- d. Thêm ràng buộc khóa ngoại cho bảng Mark trên cột:
alter table mark add constraint foreign key(sub_id) references subject(sub_id);
alter table mark add constraint foreign key(student_id) references student(student_id);

INSERT INTO Class(class_name,start_date,status)
VALUES ( 'A1', '2008-12-20', 1),
( 'A2', '2008-12-22', 1),
( 'B3',current_date(), 0);

INSERT INTO Student (student_name, Address, Phone, Status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (student_name, Address, Status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, Address, Phone, Status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject(sub_name,credit)
VALUES ( 'CF', 5),
       ( 'C', 6),
       ( 'HDJ', 5),
       ( 'RDBMS', 10);
       
INSERT INTO Mark (sub_id, student_id, Mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- a.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set class_id=2 where student_name='Hung';
-- b. Cập nhật cột phone trên bảng sinh viên là ‘No phone’ cho những sinh viên chưa có số điện thoại.
update student set phone='no phone' where phone is null;
-- c. Nếu trạng thái của lớp (Stutas) là 0 thì thêm từ ‘New’ vào trước tên lớp.
update class set class_name=concat('new ',class_name) where status=0;

-- d. Nếu trạng thái của status trên bảng Class là 1 và tên lớp bắt đầu là ‘New’ thì thay thế ‘New’ bằng ‘old’.
update class set class_name=replace(class_name,'new','old') where status =1 and class_name like 'new%';

-- e. Nếu lớp học chưa có sinh viên thì thay thế trạng thái là 0 (status=0).
update class set status =0 where class_id NOT IN (select class_id from student);

-- f. Cập nhật trạng thái của lớp học (bảng subject) là 0 nếu môn học đó chưa có sinh viên dự thi.
update subject set status=0 where sub_id NOT IN(select sub_id from mark);

-- .Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’.
select * from student where student_name like 'h%';

-- a. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_date)=12;

-- b. Hiển thị giá trị lớn nhất của credit trong bảng subject.
select max(credit) from subject;

-- c. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject where credit>=all(select max(credit) from subject);

-- d. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;

-- e. Hiển thị các thông tin bao gồm: classid, className, studentname, Address từ hai bảng Class, student
select class.class_id,class.class_name,student.student_name, student.address from class JOIN student ON class.class_id=student.class_id;

-- f. Hiển thị các thông tin môn học chưa có sinh viên dự thi.
select * from subject where sub_id not in(select sub_id from mark);

-- g. Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject JOIN mark ON subject.sub_id=mark.sub_id where mark.mark>=all(select max(mark)from mark);

-- h. Hiển thị các thông tin sinh viên và điểm trung bình tương ứng.
select s.*,avg(m.mark) as DTB from student s join mark m on s.student_id=m.student_id GROUP BY student_id;

-- i. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần (gợi ý: sử dụng hàm rank)
select s.*,avg(m.mark) as DTB,rank()over(order by avg(m.mark)) as XH from student s join mark m on s.student_id=m.student_id GROUP BY student_id;

-- j. Hiển thị các thông tin sinh viên và điểm trung bình, chỉ đưa ra các sinh viên có điểm trung bình lớn hơn 10.
select s.*,avg(m.mark) as DTB from student s join mark m on s.student_id=m.student_id GROUP BY student_id HAVING avg(m.mark)>10;

-- k. Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name,sj.sub_name,m.mark from student s join mark m on s.student_id=m.student_id
join subject sj on m.sub_id=sj.sub_id ORDER BY mark DESC,student_name;

-- .Xóa tất cả các lớp có trạng thái là 0.
delete from class where status =0;

-- a. Xóa tất cả các môn học chưa có sinh viên dự thi.
delete from subject where sub_id not in(select sub_id from mark);

-- .Xóa bỏ cột ExamTimes trên bảng Mark.
alter table mark drop exam_times;

-- a. Sửa đổi cột status trên bảng class thành tên ClassStatus.
alter table class change status class_status boolean;

-- b. Đổi tên bảng Mark thành SubjectTest.    
alter table mark rename subject_test;   