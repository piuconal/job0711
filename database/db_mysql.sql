CREATE DATABASE job0711;

USE job0711;

CREATE TABLE SINHVIEN (
    id_sv INT AUTO_INCREMENT PRIMARY KEY,
    Ten_sinh_vien VARCHAR(255),
    Ma_sinh_vien VARCHAR(255) UNIQUE,
    Ngay_sinh DATE,
    Gioi_tinh VARCHAR(255),
    Dia_chi VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    So_dien_thoai VARCHAR(255) UNIQUE,
    CCCD VARCHAR(255) UNIQUE
);

ALTER TABLE SINHVIEN ADD INDEX (Ten_sinh_vien);

CREATE TABLE LOPHOC (
    id_lop INT AUTO_INCREMENT PRIMARY KEY,
    Ma_lop VARCHAR(255) UNIQUE,
    Ten_lop VARCHAR(255)
);

CREATE TABLE HOSO (
    id_hoso INT AUTO_INCREMENT PRIMARY KEY,
    Ma_hoso VARCHAR(255) UNIQUE,
    Ten_sinh_vien VARCHAR(255),
    Dan_toc VARCHAR(255),
    Ton_giao VARCHAR(255),
    Noi_sinh VARCHAR(255),
    FOREIGN KEY (Ten_sinh_vien) REFERENCES SINHVIEN(Ten_sinh_vien)
);

ALTER TABLE HOSO ADD INDEX (Ten_sinh_vien);

CREATE TABLE GIANGVIEN (
    id_gv INT AUTO_INCREMENT PRIMARY KEY,
    Ma_giao_vien VARCHAR(255) UNIQUE,
    Ten_giao_vien VARCHAR(255),
    Dia_chi VARCHAR(255),
    So_dien_thoai VARCHAR(255) UNIQUE,
    CCCD VARCHAR(255) UNIQUE,
    Gioi_tinh VARCHAR(255),
    Ngay_sinh DATE,
    Email VARCHAR(255) UNIQUE
);

CREATE TABLE KHOA (
    id_khoa INT AUTO_INCREMENT PRIMARY KEY,
    Ma_khoa VARCHAR(255) UNIQUE,
    Ten_khoa VARCHAR(255)
);

CREATE TABLE NGUOIDUNG (
    id_u INT AUTO_INCREMENT PRIMARY KEY,
    Tai_khoan VARCHAR(255),
    Mat_khau VARCHAR(255),
    Phan_quyen VARCHAR(255)
);

ALTER TABLE SINHVIEN ADD COLUMN id_khoa INT;
ALTER TABLE SINHVIEN ADD FOREIGN KEY (id_khoa) REFERENCES KHOA(id_khoa);

ALTER TABLE SINHVIEN ADD COLUMN id_lop INT;
ALTER TABLE SINHVIEN ADD FOREIGN KEY (id_lop) REFERENCES LOPHOC(id_lop);

-- Thêm dữ liệu Nguoidung
INSERT INTO NGUOIDUNG (Tai_khoan, Mat_khau, Phan_quyen)
VALUES 
	('admin', '123123', '1'),
	('client', '123123', '0');

-- Thêm dữ liệu Giangvien
-- Thêm 20 dòng dữ liệu giảng viên với các giá trị khác nhau
INSERT INTO GIANGVIEN (Ma_giao_vien, Ten_giao_vien, Dia_chi, So_dien_thoai, CCCD, Gioi_tinh, Ngay_sinh, Email)
VALUES
    ('GV001', 'Nguyen Van A', '123 Đường ABC, Thành phố XYZ', '0123456789', '1234567890', 'Nam', '1980-01-15', 'nguyenvana@email.com'),
    ('GV002', 'Tran Thi B', '456 Đường XYZ, Thành phố ABC', '0987654321', '0987654322', 'Nữ', '1985-03-20', 'tranthib@email.com'),
    ('GV003', 'Le Van C', '789 Đường DEF, Thành phố LMN', '0123123456', '0987654323', 'Nam', '1990-05-25', 'levanc@email.com'),
    ('GV004', 'Pham Thi D', '101 Đường GHI, Thành phố OPQ', '0909090909', '0987654324', 'Nữ', '1988-09-10', 'phamthid@email.com'),
    ('GV005', 'Nguyen Van E', '222 Đường UVW, Thành phố XYZ', '0123456788', '0987654325', 'Nam', '1982-04-18', 'nguyenvane@email.com'),
    ('GV006', 'Tran Van F', '333 Đường XYZ, Thành phố ABC', '0987654327', '0987654326', 'Nam', '1995-06-30', 'tranvanf@email.com'),
    ('GV007', 'Le Van G', '444 Đường DEF, Thành phố LMN', '0123123455', '0987654327', 'Nam', '1987-11-08', 'levang@email.com'),
    ('GV008', 'Pham Thi H', '555 Đường GHI, Thành phố OPQ', '0909090906', '0987654328', 'Nữ', '1983-08-25', 'phamthih@email.com'),
    ('GV009', 'Nguyen Van I', '666 Đường UVW, Thành phố XYZ', '0123456787', '0987654329', 'Nam', '1989-02-12', 'nguyenvani@email.com'),
    ('GV010', 'Tran Van J', '777 Đường XYZ, Thành phố ABC', '0987654320', '0987654330', 'Nam', '1984-07-15', 'tranvanj@email.com'),
    ('GV011', 'Le Van K', '888 Đường DEF, Thành phố LMN', '0123123454', '0987654331', 'Nam', '1991-09-30', 'levank@email.com'),
    ('GV012', 'Pham Thi L', '999 Đường GHI, Thành phố OPQ', '0909090905', '0987654332', 'Nữ', '1986-12-03', 'phamthil@email.com'),
    ('GV013', 'Nguyen Van M', '111 Đường UVW, Thành phố XYZ', '0123456786', '0987654333', 'Nam', '1981-03-22', 'nguyenvanm@email.com'),
    ('GV014', 'Tran Van N', '222 Đường XYZ, Thành phố ABC', '0987654335', '0987654334', 'Nam', '1994-10-05', 'tranvann@email.com'),
    ('GV015', 'Le Van O', '333 Đường DEF, Thành phố LMN', '0123123453', '0987654335', 'Nam', '1989-06-15', 'levano@email.com'),
    ('GV016', 'Pham Thi P', '444 Đường GHI, Thành phố OPQ', '0909090904', '0987654336', 'Nữ', '1980-07-28', 'phamthip@email.com'),
    ('GV017', 'Nguyen Van Q', '555 Đường UVW, Thành phố XYZ', '0123456785', '0987654337', 'Nam', '1993-08-12', 'nguyenvanq@email.com'),
    ('GV018', 'Tran Van R', '666 Đường XYZ, Thành phố ABC', '0987654339', '0987654338', 'Nam', '1987-12-15', 'tranvanr@email.com'),
    ('GV019', 'Le Van S', '777 Đường DEF, Thành phố LMN', '0123123452', '0987654339', 'Nam', '1982-04-10', 'levans@email.com'),
    ('GV020', 'Pham Thi T', '888 Đường GHI, Thành phố OPQ', '0909090903', '0987654340', 'Nữ', '1985-01-20', 'phamthit@email.com');

INSERT INTO SINHVIEN (Ten_sinh_vien, Ma_sinh_vien, Ngay_sinh, Gioi_tinh, Dia_chi, Email, So_dien_thoai, CCCD) 
VALUES
	('Nguyễn Văn A', 'SV0001', '2004-01-01', 'Nam', 'Hà Nội', 'a@gmail.com', '0912345678', '1234567890'),
	('Trần Thị B', 'SV0002', '2005-02-02', 'Nữ', 'Hồ Chí Minh', 'b@gmail.com', '0923456789', '2345678901'),
	('Lê Quang C', 'SV0003', '2006-03-03', 'Nam', 'Đà Nẵng', 'c@gmail.com', '0934567890', '3456789012'),
	('Hoàng Thị D', 'SV0004', '2007-04-04', 'Nữ', 'Cần Thơ', 'd@gmail.com', '0945678900', '4567890123'),
	('Phan Văn E', 'SV0005', '2008-05-05', 'Nam', 'Bắc Ninh', 'e@gmail.com', '0956789001', '5678901234'),
	('Nguyễn Thị F', 'SV0006', '2009-06-06', 'Nữ', 'Hải Phòng', 'f@gmail.com', '0967890012', '6789012345'),
	('Đào Minh G', 'SV0007', '2010-07-07', 'Nam', 'Nam Định', 'g@gmail.com', '0978900123', '7890123456'),
	('Hồ Thị H', 'SV0008', '2011-08-08', 'Nữ', 'Thái Bình', 'h@gmail.com', '0989001234', '8901234567'),
	('Lương Văn I', 'SV0009', '2012-09-09', 'Nam', 'Hà Nam', 'i@gmail.com', '0990012345', '9012345678'),
	('Trương Thị J', 'SV0010', '2013-10-10', 'Nữ', 'Ninh Bình', 'j@gmail.com', '0910012346', '1012345679'),
	('Nguyễn Văn K', 'SV0011', '2014-11-11', 'Nam', 'Thanh Hóa', 'k@gmail.com', '0920012347', '201234567A'),
	('Nguyễn Thị L', 'SV0012', '2015-12-12', 'Nữ', 'Hà Tĩnh', 'l@gmail.com', '0930012348', '301234567B');

INSERT INTO LOPHOC (Ma_lop, Ten_lop) 
VALUES
	('LH0001', 'Toán cao cấp'),
	('LH0002', 'Phương pháp luận');
    
INSERT INTO KHOA (Ma_khoa, Ten_khoa) 
VALUES
	('K01', 'Công nghệ thông tin'),
	('K02', 'Điện tử viễn thông');
    
INSERT INTO HOSO (Ma_hoso, Ten_sinh_vien, Dan_toc, Ton_giao, Noi_sinh) 
VALUES
	('HS0001', 'Nguyễn Văn A', 'Kinh', 'Không', 'Việt Nam'),
	('HS0002', 'Trần Thị B', 'Kinh', 'Không', 'Mỹ')