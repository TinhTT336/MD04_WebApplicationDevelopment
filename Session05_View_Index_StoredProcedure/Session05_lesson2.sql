create database ticket_film;
use ticket_film;

create table phim(
phim_id int primary key auto_increment,
ten_phim varchar(100),
loai_phim varchar(100),
thoi_gian int
);
create table phong(
phong_id int primary key auto_increment,
ten_phong int,
trang_thai bit default 1
);
create table ghe(
ghe_id int primary key auto_increment,
phong_id int,
foreign key(phong_id) references phong(phong_id),
so_ghe varchar(3)
);

create table ve(
phim_id int,
foreign key(phim_id) references phim(phim_id),
ghe_id int,
foreign key(ghe_id) references ghe(ghe_id),
ngay_chieu date,
trang_thai bit default 1
);
-- alter table ve add constraint fk_v_phim_id foreign key(phim_id) references phim(phim_id);
-- alter table ve add primary key (phim_id,ghe_id);

insert into phim(ten_phim,loai_phim,thoi_gian)
values('Em be Ha Noi','Tam ly',90),
('Nhiem vu bat kha thi','Hanh dong',100),
('Di nhan','Vien tuong',90),
('Cuon theo chieu gio','Tinh cam',120);

insert into phong(ten_phong,trang_thai)
values(01,1),(02,1),(03,0);

insert into ghe(phong_id,so_ghe)
values(1,'A3'),(1,'B5'),(2,'A7'),(2,'D1'),(3,'T2');

insert into ve(phim_id,ghe_id,ngay_chieu,trang_thai)
values(1,1,'2008-10-20',1),
(1,3,'2008-11-20',1),
(1,4,'2008-11-23',1),
(2,1,'2009-02-14',1),
(3,1,'2009-02-14',1),
(2,5,'2009-03-08',0),
(2,3,'2009-03-08',0);

-- Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian)
select * from phim ORDER BY thoi_gian;

-- Hiển thị Ten_phim có thời gian chiếu dài nhất
select ten_phim from phim where thoi_gian>=all(select max(thoi_gian)from phim);

-- Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select ten_phim from phim where thoi_gian<=all(select min(thoi_gian)from phim);

-- Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select so_ghe from ghe where so_ghe like 'A%';

-- Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)
alter table phong modify trang_thai varchar(25);

-- Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật sau:
-- Nếu Trang_thai=0 thì gán Trang_thai=’Đang sửa’
-- Nếu Trang_thai=1 thì gán Trang_thai=’Đang sử dụng’
-- Sau đó hiển thị bảng tblPhong
select ten_phong, 
case 
when Trang_thai=0 then 'Đang sửa' 
when Trang_thai=1 then 'Đang sử dụng'
end as trang_thai
from phong;
-- Hiển thị danh sách tên phim mà có độ dài >15 và < 25 ký tự
select ten_phim from phim where length(ten_phim)>15 and (ten_phim)<25;

-- Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
select concat(ten_phong,' - ', case 
when trang_thai=0 then 'Đang sửa' 
when trang_thai=1 then 'Đang sử dụng'
end) as 'Trạng thái phòng chiếu' from phong;

-- Tạo bảng mới có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
create view vw_rank as
select RANK()OVER(ORDER BY ten_phim) as STT,ten_phim,thoi_gian  from phim;

drop view vw_rank;
select*from vw_rank;

-- Trong bảng tblPhim :
-- a. Thêm trường Mo_ta kiểu nvarchar(max)
alter table phim add column mo_ta varchar(255);

-- b. Cập nhật trường Mo_ta: thêm chuỗi “Đây là bộ phim thể loại ” + nội dung trường LoaiPhim
update phim set mo_ta=concat('Đây là bộ phim thể loại ',loai_phim);

-- c. Hiển thị bảng tblPhim sau khi cập nhậtzs
select*from phim;
-- d. Cập nhật trường Mo_ta: thay chuỗi “bộ phim” thành chuỗi “film”
update phim set mo_ta=replace(mo_ta,'bộ phim', 'film');

-- e. Hiển thị bảng tblPhim sau khi cập nhật
select*from phim;
-- Xóa tất cả các khóa ngoại trong các bảng trên.
alter table ghe drop constraint ghe_ibfk_1;
alter table ve drop constraint ve_ibfk_1;
alter table ve drop constraint ve_ibfk_2;
-- Xóa dữ liệu ở bảng tblGhe
delete from ghe;
-- Hiển thị ngày giờ hiện tại và ngày giờ hiện tại cộng thêm 5000 phút
SELECT 
    NOW() AS 'Ngày giờ hiện tại',
    DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 5000 MINUTE), '%Y-%m-%d %H:%i:%s') AS 'Ngày giờ hiện tại + 5000 phút'