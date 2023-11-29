create database session10_th1;
use session10_th1;

create table user
(
    id      int primary key auto_increment,
    name    varchar(255) not null,
    email   varchar(255) not null,
    country varchar(255) not null
);
create table permision
(
    id   int(11) primary key,
    name varchar(50)
);
create table user_permision
(
    permision_id int(11),
    user_id      int(11)
);
insert into permision(id, name)
values (1, 'add');
insert into permision(id, name)
values (2, 'edit');
insert into permision(id, name)
values (3, 'delete');
insert into permision(id, name)
values (4, 'view');