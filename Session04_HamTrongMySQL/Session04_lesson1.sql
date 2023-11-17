 create database session04_lesson1_QuanLySinhVien;
use session04_lesson1_QuanLySinhVien;

create table Classes(
class_id int primary key auto_increment,
class_name varchar(50) not null 
);

create table Subjects(
sub_id int primary key auto_increment,
sub_name varchar(50)
);
create table Students(
student_id int primary key auto_increment,
student_name varchar(50) not null,
age int,
email varchar(100)
);
create table ClassStudent(
student_id int,
constraint fk_studentt_id foreign key  (student_id)  references Students(student_id),
class_id int,
constraint fk_classs_id foreign key (class_id) references Classes(class_id)
);
create table Marks(
sub_id int,
constraint fk_sub_id foreign key (sub_id) references Subjects(sub_id),
student_id int,
constraint fk_student_id foreign key (student_id) references Students(student_id),
mark int
);

insert into Students(student_name,age,email) values ('Nguyen Quang An',18,'an@yahoo.com'),
('Nguyen Cong Vinh',20,'vinh@yahoo.com'),
('Nguyen Van Quyen',19,'Quyen@yahoo.com'),
('Pham Thanh Binh',25,'binh@yahoo.com'),
('Nguyen Van Tai Em',30,'tai@yahoo.com');

insert into Classes(class_name)values('C0706L'),('C0708G');
insert into Subjects(sub_name)values ('SQL'),('Java'),('C'),('Visual Basic');
insert into ClassStudent (student_id,class_id)values (1,1),(2,1),(3,2),(4,2),(5,2);
insert into Marks (mark,sub_id,student_id)values(8,1,1),(4,2,1),(9,1,1),(7,1,3),(3,1,4),(5,2,5),(8,3,3);

-- Hien thi danh sach tat ca cac hoc vien
select * from Students;

-- Hien thi danh sach tat ca cac mon hoc
select * from Subjects;

-- Tinh diem trung binh cua tung mon hoc
select s.sub_id,s.sub_name, AVG(mark) as DiemTrungBinh from Marks m 
join Subjects s ON s.sub_id=m.sub_id
group by sub_id;

-- Tinh diem trung binh cua tung hoc vien
select s.student_id,s.student_name,sj.sub_name, AVG(mark) as DiemTrungBinh from Marks m
JOIN Subjects sj ON sj.sub_id=m.sub_id
JOIN Students s ON s.student_id=m.student_id
group by s.student_id,s.student_name,sj.sub_name;

-- Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select sj.sub_id,sj.sub_name, m.mark from Subjects sj
JOIN Marks m ON sj.sub_id=m.sub_id WHERE mark>=ALL(select MAX(mark)FROM Marks GROUP BY m.student_id) GROUP BY sj.sub_id,sj.sub_name, m.mark ;

-- Danh so thu tu cua diem theo chieu giam
select distinct Marks.* from Marks ORDER BY mark DESC;

-- Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table Subjects modify sub_name nvarchar(255);

-- Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
update Subjects set sub_name=concat('Day la mon hoc ', sub_name) where sub_id IN(1,2,3,4);

-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table Students add constraint check_age check(age >15 and age < 50);

-- Loai bo tat ca quan he giua cac bang
SET SQL_SAFE_UPDATES = 0;

alter table ClassStudent drop constraint fk_studentt_id;
alter table ClassStudent drop constraint fk_classs_id;
alter table Marks drop constraint fk_student_id;
alter table Marks drop constraint fk_sub_id;

-- Xoa hoc vien co StudentID la 1
delete  from Students where student_id=1;

-- Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table Students add column status bit default 1;

-- Cap nhap gia tri Status trong bang Student thanh 0
update Students set status=0;