create database session04_lesson_QuanLySinhVien;
use session04_lesson_QuanLySinhVien;

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
       
/*• Hiển thị số lượng sinh viên ở từng nơi*/
select address, COUNT(*) from Student GROUP BY address;

-- • Tính điểm trung bình các môn học của mỗi học viên
select Student.student_id, Student.student_name, Subject.sub_name,AVG(Mark.mark) as DiemTrungBinh from Student 
JOIN Mark ON Mark.student_id=Student.student_id
JOIN Subject ON Mark.sub_id=Subject.sub_id
GROUP BY Student.student_id, Student.student_name, Subject.sub_name;

-- • Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select Student.student_id, Student.student_name, Subject.sub_name,AVG(Mark.mark) as DiemTrungBinh from Student 
JOIN Mark ON Mark.student_id=Student.student_id
JOIN Subject ON Mark.sub_id=Subject.sub_id
GROUP BY Student.student_id, Student.student_name, Subject.sub_name HAVING DiemTrungBinh>15;

-- • Hiển thị thông tin các học viên có điểm trung bình lớn nhất.*/   
WITH DiemTrungBinh AS (
  SELECT Student.student_id, Student.student_name, AVG(Mark.mark) AS DiemTrungBinh
  FROM Student
  JOIN Mark ON Mark.student_id = Student.student_id
  JOIN Subject ON Mark.sub_id = Subject.sub_id
  GROUP BY Student.student_id, Student.student_name
)
SELECT student_id, student_name, DiemTrungBinh
FROM DiemTrungBinh
WHERE DiemTrungBinh = (SELECT MAX(DiemTrungBinh) FROM DiemTrungBinh);

-- cach 2
SELECT S.student_id, S.student_name, AVG(Mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.student_id);
    
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select sub_id,sub_name, credit from Subject WHERE credit=(select MAX(credit)from Subject);

-- • Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_id,s.sub_name,m.mark from Subject s JOIN Mark m ON s.sub_id=m.sub_id WHERE mark=(select MAX(mark)from Mark);

-- • Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần    
SELECT Student.student_id, Student.student_name, AVG(Mark.mark) AS DiemTrungBinh FROM Student
JOIN MARK ON Mark.student_id=Student.student_id
JOIN Subject ON Subject.sub_id=Mark.sub_id
GROUP BY Student.student_id
ORDER BY DiemTrungBinh DESC;

-- group_concat
select group_concat(student_name separator '-') from Student;
select upper(student_name) from Student;
select format(10000,0);


