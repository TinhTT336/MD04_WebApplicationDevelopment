CREATE TABLE class
(
    id     int primary key AUTO_INCREMENT,
    name   varchar(50),
    status bit(1)
);
use session09;
alter table class
    modify status bit(1) not null;

DELIMITER //
CREATE PROCEDURE PROC_GET_CLASSES()
begin
SELECT*FROM class;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_FIND_CLASS_BY_ID(IN id_in int)
begin
SELECT*FROM class WHERE id=id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_ADD_CLASS(IN class_name varchar(50),IN status_in bit)
begin
INSERT INTO class(name,status)VALUES (class_name,status_in);
end;
//

DELIMITER //
CREATE PROCEDURE PROC_EDIT_CLASS(IN name_in varchar(50),status_in bit,id_in int)
begin
UPDATE class SET name=name_in,status=status_in WHERE id=id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_DELETE_CLASS(IN id_in int)
begin
DELETE FROM class WHERE id=id_in;
end;
//

DELIMITER //
CREATE PROCEDURE PROC_FIND_CLASS_BY_NAME(IN name_in varchar(50))
begin
SELECT*FROM class WHERE LCASE(name) LIKE concat('%',LCASE(name_in),'%');
end;
//


DELIMITER //
CREATE PROCEDURE PROC_SORT_CLASS_BY_NAME()
begin
  SELECT * FROM class ORDER BY name;
end;
//

