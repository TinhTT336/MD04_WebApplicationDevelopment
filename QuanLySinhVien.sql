Create Database QuanLyDiemSV CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30)not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float
);
/*===================MON HOC========================*/
create table DMMH(
MaMH char (2) not null,
TenMH nvarchar (25)not null,
SoTiet tinyint,
Constraint DMMH_MaMH_pk primary key(MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV,MaMH,LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
References DMKhoa (MaKhoa);
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01','Cơ Sở Dữ Liệu',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02','Trí Tuệ Nhân Tạo',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03','Truyền Tin',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04','Đồ Họa',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05','Văn Phạm',60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV','Anh Văn');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH','Tin Học');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR','Triết');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL','Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values('A01','Nguyễn Thị','Hải','Nữ','1990-03-20','Hà Nội','TH',130000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02','Trần Văn','Chính','Nam','1992-12-24','Bình Định','VL',150000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03','Lê Thu Bạch','Yến','Nữ','1990-02-21','TP Hồ Chí Minh','TH',170000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04','Trần Anh','Tuấn','Nam','1990-12-20','Hà Nội','AV',80000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01','Trần Thanh','Mai','Nữ','1991-08-12','Hải Phòng','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02','Trần Thị Thu','Thủy','Nữ','1991-01-02','TP Hồ Chí Minh','AV',0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10);

/*Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh 
viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã 
sinh viên tăng dần*/
select MaSV,HoSV,TenSV,HocBong from DMSV;

/*Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, 
Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.*/
select MaSV,HoSV,Phai,NgaySinh from DMSV ORDER BY CASE WHEN Phai = 'Nam' THEN 1 ELSE 2 END, MaSV;

/*Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông 
tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.*/
select masv,ngaysinh,hocbong from DMSV ORDER BY ngaysinh ASC,HocBong DESC;

/*Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã 
môn, Tên môn, Số tiết.*/
select MaMH,TenMH,SoTiet from DMMH where TenMH LIKE 'T%';

/*Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm 
các thông tin: Họ tên sinh viên, Ngày sinh, Phái.*/
select MaSV,HoSV,TenSV,Phai from DMSV where TenSV LIKE '%I';

/* Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm 
các thông tin: Mã khoa, Tên khoa.*/
select TenKhoa from DMKhoa where TenKhoa LIKE'_N%';

/*Liệt kê những sinh viên mà họ có chứa chữ Thị.*/
select MaSV,HoSV,TenSV from DMSV where HoSV LIKE '%Thị%';
 
 /*Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các 
thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
được sắp xếp theo thứ tự Mã khoa giảm dần*/
select MaSV,HoSV,TenSV,MaKhoa,HocBong from DMSV where HocBong>100000 ORDER BY MaKhoa DESC;

/*Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm 
các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.*/
select MaSV,HoSV,TenSV,MaKhoa,HocBong,NoiSinh from DMSV where HocBong>=150000 and NoiSinh = 'Hà Nội';

/*Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông 
tin: Mã sinh viên, Mã khoa, Phái.*/
select MaSV,HoSV,TenSV,DMSV.MaKhoa,Phai from DMSV join DMKhoa ON DMSV.MaKhoa=DMKhoa.MaKhoa
where DMKhoa.TenKhoa IN ('Anh văn','Vật lý');

/*Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 
05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học 
bổng.*/
select MaSV,HoSV,TenSV,NgaySinh,NoiSinh,HocBong from DMSV where NgaySinh between '1991-01-01'and'01992-05-06';

/*12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các 
thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.*/
select MaSV,HoSV,TenSV,NgaySinh,Phai,MaKhoa from DMSV where HocBong between '80000'and'150000';

/*Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông 
tin: Mã môn học, Tên môn học, Số tiết.*/
select MaMH,TenMH,SoTiet from  DMMH where SoTiet between 30 and 45;

/*Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các 
thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.*/
select MaSV,HoSV,TenSV,DMKhoa.TenKhoa,Phai from DMSV join DMKhoa ON DMSV.MaKhoa=DMKhoa.MaKhoa where DMKhoa.TenKhoa IN ('Anh văn','tin học') and phai='nam';

/*Liệt kê những sinh viên nữ, tên có chứa chữ N*/
select MaSV,HoSV,TenSV,Phai from DMSV WHERE Phai = 'nữ' AND TenSV LIKE '%N%';
