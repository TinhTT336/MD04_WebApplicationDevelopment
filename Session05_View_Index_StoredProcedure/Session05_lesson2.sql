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
so_ghe int
);

create table ve(
phim_id int,
foreign key(phim_id) references phim(phim_id),
ghe_id int,
foreign key(ghe_id) references ghe(ghe_id),
ngay_chieu date,
trang_thai bit default 1
);