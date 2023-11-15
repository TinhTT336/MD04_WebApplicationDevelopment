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

/*Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các 
thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.*/
select MaSV,HoSV,TenSV,NoiSinh,NgaySinh from DMSV WHERE NgaySinh LIKE '%%%%%-02-%%';

/*Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh 
viên, Tuổi,Học bổng.*/
select MaSV,HoSV,TenSV,(year(current_date())-year(NgaySinh))as Tuoi,HocBong from DMSV WHERE (year(current_date())-year(NgaySinh))>20;

/*Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh 
viên, Tuổi, Tên khoa.*/
select MaSV,HoSV,TenSV,(year(current_date())-year(NgaySinh))as Tuoi,DMKhoa.TenKhoa from DMSV JOIN DMKhoa ON DMSV.MaKhoa=DMKhoa.MaKhoa 
WHERE (year(current_date())-year(NgaySinh))>=20 and (year(current_date())-year(NgaySinh))<=25;

/*Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
tên sinh viên,Phái, Ngày sinh.*/
select MaSV,HoSV,TenSV,NoiSinh,NgaySinh from DMSV where Month(NgaySinh) IN(1,2,3) and Year(NgaySinh) =1990;

/*Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, 
Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học 
bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển 
thị là “Mức trung bình”*/
select MaSV,HoSV,TenSV,Phai,MaKhoa,
CASE 
WHEN HocBong>500000 THEN 'Học bổng cao' 
ELSE 'Mức trung bình' END AS MucHocBong
from DMSV ;

/*Cho biết tổng số sinh viên của toàn trường*/
select count(*) as TongSinhVienToanTruong from DMSV;

/*.Cho biết tổng sinh viên và tổng sinh viên nữ.*/
select count(*) as TongSinhVienToanTruong,
count(CASE WHEN Phai='Nữ' THEN 1 END) as TongSinhVienNu from DMSV;

/*Cho biết tổng số sinh viên của từng khoa.*/
select DMKhoa.TenKhoa, count(*) as TongSinhVien from  DMSV JOIN DMKhoa ON DMSV.MaKHoa=DMKhoa.MaKhoa GROUP BY DMKhoa.TenKhoa;

/*Cho biết số lượng sinh viên học từng môn.*/
select  DMMH.TenMH, count(*) as TongSinhVien from  KetQua JOIN DMMH ON DMMH.MaMH= KetQua.MaMH WHERE LanThi=1
GROUP BY DMMH.TenMH;

/*Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có 
trong bảng kq)*/
select  DMSV.TenSV, count(*) as TongMonHoc from  KetQua JOIN DMSV ON DMSV.MaSV= KetQua.MaSV WHERE LanThi=1
GROUP BY DMSV.MaSV;

/*Cho biết tổng số học bổng của mỗi khoa.*/
select DMKhoa.TenKhoa, sum(DMSV.HocBong) as TongHocBong from DMSV JOIN DMKhoa ON DMSV.MaKhoa=DMKhoa.MaKhoa GROUP BY DMSV.MaKhoa;

/*27.Cho biết học bổng cao nhất của mỗi khoa.*/
select DMKhoa.TenKhoa, max(DMSV.HocBong) as TongHocBong from DMSV JOIN DMKhoa ON DMSV.MaKhoa=DMKhoa.MaKhoa GROUP BY DMSV.MaKhoa;

/*Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.*/
select DMKhoa.TenKhoa,
count(CASE WHEN Phai='nữ' THEN 1 END) as TongSinhVienNu ,count(CASE WHEN Phai='nam' THEN 1 END) as TongSinhVienNam from DMSV JOIN DMKhoa ON DMKhoa.MaKhoa=DMSV.MaKhoa GROUP BY DMKhoa.TenKhoa;

/*29.Cho biết số lượng sinh viên theo từng độ tuổi.*/
select (Year(current_date)-Year(NgaySinh))as Tuoi,
count(*) as TongSinhVien from DMSV GROUP BY Tuoi;

/*30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.*/
select Year(NgaySinh) as Nam, count(*)as TongSinhVien from DMSV GROUP BY Nam HAVING TongSinhVien=2;

-- Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select NoiSinh, count(*)as TongSinhVien from DMSV GROUP BY NoiSinh HAVING  TongSinhVien=2;

-- 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
select DMMH.TenMH , count(*)as TongSinhVien from DMMH RIGHT JOIN KetQua ON DMMH.MaMH=KetQua.MaMH where LanThi=1 GROUP BY TenMH HAVING TongSinhVien>=3;

-- 33.Cho biết những sinh viên thi lại trên 2 lần.
select DMSV.MaSV,DMSV.HoSV,DMSV.TenSV,COUNT(*)SoLanThi from DMSV JOIN KetQua ON KetQua.MaSV=DMSV.MaSV GROUP BY MaSV HAVING SoLanThi>=2;

-- 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select DMSV.MaSV,DMSV.HoSV,DMSV.TenSV from DMSV 
JOIN KetQua ON KetQua.MaSV=DMSV.MaSV WHERE DMSV.Phai='nam' and Diem>=7 and KetQua.LanThi=1 GROUP BY MaSV; 

-- 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
select DMSV.MaSV,DMSV.HoSV,DMSV.TenSV,COUNT(*) as SoMon from DMSV 
JOIN KetQua ON KetQua.MaSV=DMSV.MaSV WHERE KetQua.LanThi=1 and Diem<5 GROUP BY MaSV HAVING SoMon>=2; 

-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select DMKhoa.MaKhoa,DMKhoa.TenKhoa , COUNT(CASE WHEN Phai='nam' THEN 1 END) SoSVNam from DMSV
JOIN DMKhoa ON DMKhoa.MaKhoa=DMSV.MaKhoa GROUP BY MaKhoa HAVING SoSVNam>=2;

-- 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
select DMKhoa.MaKhoa,DMKhoa.TenKhoa, COUNT(*) as TongSV from DMSV 
JOIN DMKhoa ON DMKhoa.MaKhoa=DMSV.MaKhoa WHERE DMSV.HocBong between 200000 and 300000  GROUP BY MaKhoa HAVING TongSV>=2;

/*38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn 
trong lần thi 1.*/


-- 39.Cho biết sinh viên nào có học bổng cao nhất.
-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.