create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;
create table STUDENT(
	studentId varchar(4) primary key,
    studentName varchar(50) not null,
    birthday date not null,
    gender bit(1) not null,
    address text not null,
    phoneNumber varchar(45) unique
);
create table `SUBJECT`(
	subjectId varchar(4) primary key,
    subjectName varchar(45) not null,
    priority int(1) not null
);
create table MARK(
	subjectId varchar(4) not null,
    studentId varchar(4) not null,
    point int(11) not null,
    foreign key (subjectId) references SUBJECT(subjectId),
    foreign key (studentId) references STUDENT(studentId)
);
insert into STUDENT values
	('S001','Nguyễn Thế Anh','1999/1/11',1,'Hà Nội','984678082'),
    ('S002','Đặng Bảo Trâm','1998/12/22',0,'Lào Cai','904982654'),
    ('S003','Trần Hà Phương','2000/5/5',0,'Nghệ An','947645363'),
    ('S004','Đỗ Tiến Mạnh','1999/3/26',1,'Hà Nội','983665353'),
    ('S005','Phạm Duy Nhất','1998/10/4',1,'Tuyên Quang','987242678'),
    ('S006','Mai Văn Thái','2002/6/22',1,'Nam Định','982654268'),
    ('S007','Giang Gia Hân','1996/11/10',0,'Phú Thọ','982364753'),
    ('S008','Nguyễn Ngọc Bảo My','1999/1/22',0,'Hà Nam','927867453'),
    ('S009','Nguyễn Tiến Đạt','1998/8/7',1,'Tuyên Quang','989274673'),
    ('S010','Nguyễn Thiều Quang','2000/9/18',1,'Hà Nội','984378291');
insert into `SUBJECT` values
	('MH01','Toán',2),
    ('MH02','Vật Lý',2),
    ('MH03','Hoá Học',1),
    ('MH04','Ngữ Văn',1),
    ('MH05','Tiếng Anh',2);
insert into MARK values
	("MH01", "S001",8.5),
	("MH02", "S001",7),
	("MH03", "S001",9),
	("MH04", "S001",9),
	("MH05", "S001",5),
    
	("MH01", "S002",9),
	("MH02", "S002",8),
	("MH03", "S002",6.5),
	("MH04", "S002",8),
	("MH05", "S002",6),
    
	("MH01", "S003",7.5),
	("MH02", "S003",6.5),
	("MH03", "S003",8),
	("MH04", "S003",7),
	("MH05", "S003",7),
    
	("MH01", "S004",6),
	("MH02", "S004",7),
	("MH03", "S004",5),
	("MH04", "S004",6.5),
	("MH05", "S004",8),
    
	("MH01", "S005",5.5),
	("MH02", "S005",8),
	("MH03", "S005",7.5),
	("MH04", "S005",8.5),
	("MH05", "S005",9),
    
	("MH01", "S006",8),
	("MH02", "S006",10),
	("MH03", "S006",9),
	("MH04", "S006",7.5),
	("MH05", "S006",6.5),
    
	("MH01", "S007",9.5),
	("MH02", "S007",9),
	("MH03", "S007",6),
	("MH04", "S007",9),
	("MH05", "S007",4),
    
	("MH01", "S008",10),
	("MH02", "S008",8.5),
	("MH03", "S008",8.5),
	("MH04", "S008",6),
	("MH05", "S008",9.5),
    
	("MH01", "S009",7.5),
	("MH02", "S009",7),
	("MH03", "S009",9),
	("MH04", "S009",5),
	("MH05", "S009",10),
    
	("MH01", "S010",6.5),
	("MH02", "S010",8),
	("MH03", "S010",5.5),
	("MH04", "S010",4),
	("MH05", "S010",7);

alter table MARK modify column point float not null;
-- 2.Cập nhật dữ liệu:
	-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
		update STUDENT set studentName='Đỗ Đức Mạnh' where studentId='S004';
	-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
		update `SUBJECT` set subjectName='Ngoại Ngữ', priority=1 where subjectId='MH05';
	-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9). 
		update MARK set point=8.5 where studentId='S009' and subjectId='MH01';
        update MARK set point=7 where studentId='S009' and subjectId='MH02';
        update MARK set point=5.5 where studentId='S009' and subjectId='MH03';
        update MARK set point=6 where studentId='S009' and subjectId='MH04';
        update MARK set point=9 where studentId='S009' and subjectId='MH05';
 -- 3. Xoá dữ liệu:
	-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT.
		delete from MARK where studentId='S010';
        delete from STUDENT where studentId='S010';
-- Bài 3.Truy vấn dữ liệu :
	-- 1.Lấy ra tất cả thông tin của sinh viên trong bảng Student. 
		select * from STUDENT;
	-- 2.Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
		select subjectId, subjectName from SUBJECT where priority=1;
	-- 3.Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. 
		select studentId,studentName,(year(now())-year(birthday)) as age, if(gender=1,'Nam','Nữ') as gender from STUDENT;
	-- 4.Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần.
		select STUDENT.studentName, SUBJECT.subjectName, MARK.point from STUDENT 
			join MARK on STUDENT.studentId=MARK.studentId 
			join SUBJECT on MARK.subjectId=SUBJECT.subjectId
		where subjectName='Toán'
        order by point desc;
	-- 5.Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
		select if(gender=1,'Nam','Nữ') as gender, count(*) as count
        from STUDENT group by gender;
	-- 6.Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. 
        select STUDENT.studentId as studentID, STUDENT.studentName as studentName, sum(MARK.point) as Total, avg(MARK.point) as Avegare
		from STUDENT STUDENT
		join MARK on STUDENT.studentId = MARK.studentId group by STUDENT.studentId; 
-- Bài4: Tạo View, Index, Procedure : 
	-- Bai 4-1
		create view STUDENT_VIEW 
        as select STUDENT.studentId, STUDENT.studentName, STUDENT.gender, STUDENT.address from STUDENT STUDENT;
		SELECT * FROM STUDENT_VIEW;
	

        
		

