CREATE DATABASE salesmanagement;

/* ============================================== CREATE TABLE IN DATABASE ============================================== */

/* Create table Customer: Store data of Customer */
CREATE TABLE `salesmanagement`.`customer`(
	customerID VARCHAR(4) PRIMARY KEY NOT NULL, 
	cusName VARCHAR(40) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phoneno VARCHAR(20) NOT NULL,
	dateofbirth DATE,
    	sales DECIMAL(10, 2) NOT NULL, 
	registrationdate DATE
);

/* Create table Employee: Store data of Employee */
CREATE TABLE `salesmanagement`.`employee`(
	employeeID VARCHAR(4) PRIMARY KEY NOT NULL,
	employeeName VARCHAR(40) NOT NULL,
	employeePhone VARCHAR(20) NOT NULL,
	dayofwork DATE
);

/* Create table Product: Store data of Product */
CREATE TABLE `salesmanagement`.`product`(
	productID VARCHAR(4) PRIMARY KEY NOT NULL,
	productName VARCHAR(40) NOT NULL,
	unit VARCHAR(20),
	country VARCHAR(40),
	price DECIMAL(10, 2) NOT NULL
);

/* Create table receipt: Store data of receipt */
CREATE TABLE `salesmanagement`.`receipt`(
	receiptID INT PRIMARY KEY NOT NULL,
	receiptDate DATE,
	customerID VARCHAR(4),
	employeeID VARCHAR(4),
	value_receipt DECIMAL(10, 2),
	FOREIGN KEY (customerID) REFERENCES customer(customerID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

/* Create table receiptdetail: Store data of receiptdetail */
CREATE TABLE `salesmanagement`.`receiptdetail`(
	receiptID INT NOT NULL,
	productID VARCHAR(4),
	quantity INT,
	PRIMARY KEY (receiptID, ProductID),
	FOREIGN KEY (receiptID) REFERENCES receipt(receiptID),
	FOREIGN KEY (productID) REFERENCES product(productID)
);

# ============================================== INSERT DATA INTO TABLE ==============================================

-------------------- Customer --------------------
INSERT INTO salesmanagement.customer VALUES
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', '13060000', '2006-07-22'),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', '280000', '2006-07-30'),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-06-12', '3860000', '2006-08-05'),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', '250000', '2006-10-02'),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-03-10', '21000', '2006-10-28'),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', '915000', '2006-11-24'),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-04-06', '12500', '2006-12-01'),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-01-10', '365000', '2006-12-13'),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', '70000', '2007-01-14'),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-02', '675000', '2007-01-16');

-------------------- Employee --------------------
INSERT INTO salesmanagement.employee VALUES
('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21'),
('NV03', 'Nguyen Van B', '0997047382', '2006-04-27'),
('NV04', 'Ngo Thanh Tuan', '0913758498', '2006-06-24'),
('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');

-------------------- Product --------------------
INSERT INTO salesmanagement.product VALUES
('BC01', 'But chi', 'cay', 'Singapore', '3000'),
('BC02', 'But chi', 'cay', 'Singapore', '5000'),
('BC03', 'But chi', 'cay', 'Viet Nam', '3500'),
('BC04', 'But chi', 'hop', 'Viet Nam', '30000'),
('BB01', 'But bi', 'cay', 'Viet Nam', '5000'),
('BB02', 'But bi', 'cay', 'Trung Quoc', '5000'),
('BB03', 'But bi', 'hop', 'Thai Lan', '100000'),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', '2500'),
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', '4500'),
('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', '3000'),
('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', '5500'),
('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', '23000'),
('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', '53000'),
('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', '34000'),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', '40000'),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', '55000'),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', '51000'),
('ST04', 'So tay', 'quyen', 'Thai Lan', '55000'),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', '20000'),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', '5000'),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', '7000'),
('ST08', 'Bong bang', 'cai', 'Viet Nam', '5000'),
('ST09', 'But long', 'cay', 'Viet Nam', '5000'),
('ST10', 'But long', 'cay', 'Trung Quoc', '7000');

-------------------- receipt --------------------
INSERT INTO salesmanagement.receipt VALUES
('1001', '2006-07-23', 'KH01', 'NV01', '320000'),
('1002', '2006-08-12', 'KH01', 'NV02', '840000'),
('1003', '2006-08-23', 'KH02', 'NV01', '100000'),
('1004', '2006-09-01', 'KH02', 'NV01', '180000'),
('1005', '2006-10-20', 'KH01', 'NV02', '3800000'),
('1006', '2006-10-16', 'KH01', 'NV03', '2430000'),
('1007', '2006-10-28', 'KH03', 'NV03', '510000'),
('1008', '2006-10-28', 'KH01', 'NV03', '440000'),
('1009', '2006-10-28', 'KH03', 'NV04', '200000'),
('1010', '2006-11-01', 'KH01', 'NV01', '5200000'),
('1011', '2006-11-04', 'KH04', 'NV03', '250000'),
('1012', '2006-11-30', 'KH05', 'NV03', '21000'),
('1013', '2006-12-12', 'KH06', 'NV01', '5000'),
('1014', '2006-12-31', 'KH03', 'NV02', '3150000'),
('1015', '2007-01-01', 'KH06', 'NV02', '910000'),
('1016', '2007-01-01', 'KH07', 'NV02', '12500'),
('1017', '2007-01-02', 'KH08', 'NV03', '35000'),
('1018', '2007-01-13', 'KH01', 'NV03', '330000'),
('1019', '2007-01-13', 'KH01', 'NV03', '30000'),
('1020', '2007-01-14', 'KH09', 'NV04', '70000'),
('1021', '2007-01-16', 'KH10', 'NV03', '67500'),
('1022', '2007-01-16', NULL, 'NV03', '7000'),
('1023', '2007-01-17', NULL, 'NV01', '330000');

-------------------- receiptdetail --------------------
INSERT INTO salesmanagement.receiptdetail VALUES
('1001', 'TV02', '10'),
('1001', 'ST01', '5'),
('1001', 'BC01', '5'),
('1001', 'BC02', '10'),
('1001', 'ST08', '10'),
('1001', 'BC04', '20'),
('1002', 'BB01', '20'),
('1002', 'BB02', '20'),
('1003', 'BB03', '10'),
('1004', 'TV01', '20'),
('1004', 'TV02', '10'),
('1004', 'TV03', '10'),
('1004', 'TV04', '10'),
('1005', 'TV05', '50'),
('1005', 'TV06', '50'),
('1006', 'TV07', '20'),
('1006', 'ST01', '30'),
('1006', 'ST02', '10'),
('1007', 'ST03', '10'),
('1008', 'ST04', '8'),
('1009', 'ST05', '10'),
('1010', 'TV07', '50'),
('1010', 'ST07', '50'),
('1010', 'ST08', '100'),
('1010', 'ST04', '50'),
('1010', 'TV03', '100'),
('1011', 'ST06', '50'),
('1012', 'ST07', '3'),
('1013', 'ST08', '5'),
('1014', 'BC02', '80'),
('1014', 'BB02', '100'),
('1014', 'BC04', '60'),
('1014', 'BB01', '50'),
('1015', 'BB02', '30'),
('1015', 'BB03', '7'),
('1016', 'TV01', '5'),
('1017', 'TV02', '1'),
('1017', 'TV03', '1'),
('1017', 'TV04', '5'),
('1018', 'ST04', '6'),
('1019', 'ST05', '1'),
('1019', 'ST06', '2'),
('1020', 'ST07', '10'),
('1021', 'ST08', '5'),
('1021', 'TV01', '7'),
('1021', 'TV02', '10'),
('1022', 'ST07', '1'),
('1023', 'ST04', '6');








