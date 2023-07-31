create database qlsv_hackathon20230802;
use qlsv_hackathon20230802;

create table dmKhoa(
maKhoa varchar(20) primary key,
tenKhoa varchar(255));

insert into dmKhoa values
 ('CNTT','Công nghệ thông tin'),
 ('KT','Kế Toán'),
 ('SP','Sư Phạm');

create table nganh(
maNganh int primary key,
tenNganh varchar(255),
maKhoa varchar(20),
foreign key(maKhoa) references dmKhoa(maKhoa)
);

insert into nganh values 
(140902,'Sư phạm toán tin','SP'),
(480202,'Tin học ứng dụng', 'CNTT');

create table dmHocPhan(
maHP int primary key,
tenHocPhan varchar(255),
sodvht int,
maNganh int,
hocKy int,
foreign key (maNganh) references nganh(maNganh)
);
insert into dmHocPhan values
(1, 'Toán cao cấp A1', 4, 480202, 1),
(2, 'Tiếng Anh 1', 3, 480202, 1),
(3, 'Vật lý đại cương', 4, 480202, 1),
(4, 'Tiếng anh 2', 7, 480202, 1),
(5, 'Tiếng anh 1', 3, 140902,2),
(6, 'Xác suất thống kê',3,480202,2);


create table dmLop(
maLop varchar(255) primary key,
tenLop varchar(255),
maNganh int,
khoaHoc int,
heDT varchar(255),
namNhapHoc int,
foreign key(maNganh) references nganh(maNganh)
);
insert into dmLop values
('CT11', 'Cao đẳng tin học', 480202, 11, 'TC', 2013),
('CT12', 'Cao đẳng tin học', 480202, 12, 'CĐ', 2013),
('CT13', 'Cao đẳng tin học', 480202, 13, 'TC', 2014);


create table sinhvien(
maSV int primary key,
hoTen varchar(255),
maLop varchar(20),
gioiTinh tinyint(1),
ngaySinh date,
diaChi varchar(255),
foreign key (maLop) references dmLop(maLop)
);

insert into sinhvien values 
(1,'Phan Thanh', 'CT12', 0, '1990-09-12', 'Tuy Phước'),
(2,'Nguyễn Thị Cẩm', 'CT12', 1, '1994-01-12', 'Quy Nhơn'),
(3,'Võ Thị Hà', 'CT12', 1, '1995-07-02', 'An Nhơn'),
(4,'Trần Hoài Nam', 'CT12', 0, '1994-04-05', 'Tây Sơn'),
(5,'Trần Văn Hoàng', 'CT13', 0, '1995-08-04', 'Vĩnh Thạnh'),
(6,'Đặng Thị Thảo', 'CT13', 1, '1995-06-12', 'Quy Nhơn'),
(7,'Lê Thị Sen', 'CT13', 1, '1994-08-12', 'Phủ Mỹ'),
(8,'Nguyễn Văn Huy', 'CT11', 0, '1995-06-04', 'Tuy Phước'),
(9,'Trần Thị Thoa', 'CT11', 1, '1994-08-09', 'Hoài Nhơn');


create table diemHP (
maSV int,
maHP int,
diemHP float,
foreign key (maSV) references sinhvien(maSV),
foreign key (maHP) references dmHocPhan(maHP),
primary key(maSV,maHP)
);
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('2', '2', '5.9');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('2', '3', '4.5');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('3', '1', '4.3');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('3', '2', '6.7');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('3', '3', '7.3');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('4', '1', '4');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('4', '2', '5.2');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('4', '3', '3.5');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('5', '1', '9.8');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('5', '2', '7.9');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('5', '3', '7.5');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('6', '1', '6.1');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('6', '2', '5.6');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('6', '3', '4');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`) VALUES ('7', '1');
UPDATE `qlsv_hackathon20230802`.`diemHP` SET `diemHP` = '6.2' WHERE (`maSV` = '7') and (`maHP` = '1');



-- 1.	 Cho biết họ tên sinh viên KHÔNG học học phần nào (5đ)
select maSV, hoTen
from sinhvien
where maSV not in (select maSV from diemHP);

-- 2.	Cho biết họ tên sinh viên CHƯA học học phần nào có mã 1 (5đ)
select maSV, hoTen
from sinhvien
where maSV not in (select maSV from diemHP
where maHP not in (select maHP from diemHP where maHP = 1));

-- 3. Cho biết Tên học phần KHÔNG có sinh viên điểm HP <5. (5đ)
select  maHP,tenHocPhan
from dmHocPhan 
where maHP not in (select maHP from diemHP where diemHP < 5);

-- 4. Cho biết Họ tên sinh viên KHÔNG có học phần điểm HP<5 (5đ)
select  maSV,hoTen
from sinhvien 
where maSV not in (select maSV from diemHP where diemHP < 5);


-- 5.	Cho biết Tên lớp có sinh viên tên Hoa (5đ)


select distinct dmLop.tenLop
from sinhvien
join dmLop on dmLop.maLop = sinhvien.maLop
where hoTen = ('%'+' '+'%'+' '+ 'Hoa');


-- 6.	Cho biết HoTen sinh viên có điểm học phần 1 là <5.

select distinct sinhvien.hoTen
from sinhvien 
join diemHP on diemHP.maSV = sinhvien.maSV
where diemHP.maHP =1 and diemHP.diemHP <5;


-- 7.Cho biết danh sách các học phần có số đơn vị học trình lớn hơn
--  hoặc bằng số đơn vị học trình của học phần mã 1.

	select maHP, tenHocPhan
    from dmHocPhan
    where sodvht >= (   select dmHocPhan.sodvht
    from dmHocPhan
    where dmHocPhan.maHP =1);
    
-- 8.	Cho biết HoTen sinh viên có DiemHP cao nhất. (ALL)

select sv.maSV, sv.hoTen
from sinhvien sv 
join diemHP dhp on dhp.maSV = sv.maSV
where dhp.diemHP >= all (
select diemHP
from diemHP
);

-- 9.	Cho biết MaSV, HoTen sinh viên có điểm học phần mã 1 cao nhất. (ALL)

select sinhvien.maSV, sinhvien.hoTen
from sinhvien
join diemHP on diemHP.maSV = sinhvien.maSV
where diemHP >= all(
select diemHP
from diemHP
where maHP =1
);


-- 10. Cho biết MaSV, MaHP 
-- có điểm HP lớn hơn bất kì các điểm HP của sinh viên mã 3 (ANY).



select distinct sinhvien.maSV,diemHP.maHP
from sinhvien
join diemHP on diemHP.maSV = sinhvien.maSV
where diemHP.diemHP >= any(
select diemHP
from diemHP 
where maSV =3
) ;

-- 11.	Cho biết MaSV, HoTen sinh viên ít nhất một lần học học phần nào đó.
--  (EXISTS)


select distinct sinhvien.maSV, sinhvien.hoTen
from sinhvien
join diemHP on diemHP.maSV = sinhvien.maSV
where exists(
select distinct maHP
from diemHP
);

-- 12.Cho biết MaSV, HoTen sinh viên đã không học học phần nào. (EXISTS)

select sv.maSV, sv.hoTen
from sinhvien sv
where not exists (select 1 from diemHP dhp where dhp.maSV = sv.maSV);


-- 15.	Tạo một trigger để kiểm tra tính hợp lệ của dữ liệu nhập vào bảng sinhvien
-- là MaSV không được rỗng  Nếu rỗng hiển thị thông báo ‘Mã sinh viên phải được nhập’.


delimiter // 
create trigger checkMasv
before insert on sinhvien for each row
begin
if new.maSV is null then
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ma sv ko dc la null';
        end if;
end//

insert into sinhvien(hoTen) values('Nhung');

-- 16.Tạo một TRIGGER khi thêm một sinh viên trong bảng sinhvien ở một lớp nào đó
-- thì cột SiSo của lớp đó trong bảng dmlop (các bạn tạo thêm một cột SiSo trong bảng dmlop) 
-- tự động tăng lên 1, đảm bảo tính toàn vẹn dữ liệu khi thêm một sinh viên mới trong bảng sinhvien
-- thì sinh viên đó phải có mã lớp trong bảng dmlop. 
-- Đảm bảo tính toàn vẹn dữ liệu khi thêm là mã lớp phải có trong bảng dmlop.
alter table dmLop add SiSo int;

delimiter //
create trigger addSvAutoAddSisoInDmLop
after insert on sinhvien for each row
begin
update dmLop
set SiSo = SiSo + 1
where maLop = new.maLop;
end//
insert into sinhvien(maSV,hoTen,maLop,gioiTinh,ngaySinh,diaChi) values (91,'Tra','CT13',1,'2000-09-03','Nam Dinh');

-- 18.	Tạo thủ tục: HIEN_THI_DIEM Hiển thị danh sách gồm 
-- MaSV, HoTen, MaLop, DiemHP, MaHP 
-- của những sinh viên có DiemHP nhỏ hơn số chỉ định, nếu không có thì hiển thị thông báo không có sinh viên nào.

delimiter //
create procedure HIEN_THI_DIEM(inputDiemHP float)
begin
    IF inputDiemHP > ( select diemHP from diemHP where inputDiemHP >  diemHP order by diemHP desc limit 1)THEN
       select sinhvien.maSV,sinhvien.hoTen,sinhvien.maLop,diemHP.maHP
       from sinhvien 
       join diemHP on diemHP.maSV = sinhvien.maSV
       where inputDiemHP > diemHP.diemHP;
 else
 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không có sinh viên nào';
  END IF;
end//
call HIEN_THI_DIEM(4)


-- 19.	Tạo thủ tục: HIEN_THI_MAHP hiển thị HoTen sinh viên CHƯA học học phần có mã chỉ định.
--  Kiểm tra mã học phần chỉ định có trong danh mục không. Nếu không có thì hiển thị thông báo không có học phần này.

delimiter //
create procedure HIEN_THI_MAHP(inputMaHP int)
begin
    IF inputMaHP not in ( select maHP from dmHocPhan)THEN
     SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Không có học phần này';
 else
select sinhvien.hoTen
from diemHP
join sinhvien on sinhvien.maSV = diemHP.maSV
 where sinhvien.maSV not in (
 select maSV
 from diemHP
 where maHP = inputMaHP
 );
  END IF;
end//

call HIEN_THI_MAHP(2)

-- 20.	Tạo thủ tục: HIEN_THI_TUOI  
-- Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, GioiTinh, Tuoi của sinh viên có tuổi trong khoảng chỉ định. 
-- Nếu không có thì hiển thị không có sinh viên nào.

DELIMITER //
CREATE PROCEDURE HIEN_THI_TUOI(IN minAge INT, IN maxAge INT)
BEGIN
    SELECT sv.maSV, sv.hoTen, sv.maLop, sv.ngaySinh, sv.gioiTinh, 
           TIMESTAMPDIFF(YEAR, sv.ngaySinh, CURDATE()) AS Tuoi
    FROM sinhvien sv
    WHERE TIMESTAMPDIFF(YEAR, sv.ngaySinh, CURDATE()) >= minAge
        AND TIMESTAMPDIFF(YEAR, sv.ngaySinh, CURDATE()) <= maxAge;
END;
//
DELIMITER ;
Call HIEN_THI_TUOI (20,30);
