/* Create & use database */
CREATE DATABASE IF NOT EXISTS aSFashion25;

USE aSFashion25;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS CUSTOMER(
	Cust_Number 	INT PRIMARY KEY AUTO_INCREMENT,
	Cust_FName	VARCHAR(30),
	Cust_LName	VARCHAR(30),
	Cust_Phone	CHAR(10),
	Cust_Email	VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS STAFF(
	Staff_ID	INT PRIMARY KEY AUTO_INCREMENT,
	Staff_FName	VARCHAR(30),
	Staff_LName	VARCHAR(30),
	Staff_Phone	CHAR(10),
	Staff_DoB	DATE,
	Staff_StartDate	DATE,
	Staff_Apt_Level	CHAR(2),
	Store_ID	INT,
	SupervisorID	INT
);

CREATE TABLE IF NOT EXISTS STORE(
	Str_Num		INT PRIMARY KEY AUTO_INCREMENT,
	Str_Name	VARCHAR(50),
	Str_Phone	CHAR(10),
	Str_Email	VARCHAR(40),
	StoreManagerID	INT NOT NULL
);

ALTER STAFF(
	ADD FOREIGN KEY (Store_ID) REFERENCES STORE(Str_Num),
	ADD FOREIGN KEY (SupervisorID) REFERENCES STAFF(Staff_ID)
);

ALTER STORE(
	ADD FOREIGN KEY (StoreManagerID) REFERENCES STAFF(StaffID)
);

CREATE TABLE IF NOT EXISTS APPOINTMENT(
	Apt_Lvl_ID	CHAR(2) PRIMARY KEY,
	Apt_Lvl_Desc	VARCHAR(40),
	Apt_Hourly_Rate	DECIMAL(5,2)
);

CREATE TABLE IF NOT EXISTS PRODUCTTYPE(
	Prod_TypeID	INT PRIMARY KEY AUTO_INCREMENT,
	Prod_Type_Desc VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS PRODUCT(
	Prod_Num    INT PRIMARY KEY AUTO_INCREMENT, 
	Prod_desc   VARCHAR(50), -- e.g. Pants for Man, Skirts for Girl
	Prod_Size   VARCHAR(10), -- e.g. Large, Medium, XL, 14, etc
	Prod_Price  DECIMAL(5,2), -- e.g. 110.50 (actual price)
	Price_Discount  DECIMAL(4,2), -- e.g. 11.35
	Prod_TypeID INT
	FOREIGN KEY (Prod_TypeID) REFERENCES PRODUCTTYPE(Prod_TypeID)
);

CREATE TABLE IF NOT EXISTS INVENTORY(
	Prod_Num    INT PRIMARY KEY,
	Str_Num     INT PRIMARY KEY,
	Inv_QntyOnHand  INT,
	Inv_QtyOrdered  INT,
	FOREIGN KEY (Prod_Num) REFERENCES PRODUCT(Prod_Num),
	FOREIGN KEY (Str_Num) REFERENCES PRODUCT(Str_Num)
);

CREATE TABLE IF NOT EXISTS ORDERMODE(
	Order_ModeID    CHAR(1) PRIMARY KEY,
	Order_Mode_Desc     VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS CUSTOMERORDER(
	CustOrd_ID  INT PRIMARY KEY AUTO_INCREMENT,
	CustOrd_Date    DATE, -- format: 'yyyy-mm-dd'
	CustOrd_Mode    CHAR(1),
	Cust_Number     INT,
	Str_Num     INT,
	FOREIGN KEY (CustOrd_Mode) REFERENCES ORDERMODE(Order_ModeID),
	FOREIGN KEY (Cust_Number) REFERENCES CUSTOMER(Cust_Number),
	FOREIGN KEY (Str_Num) REFERENCES STORE(Str_Num)
);

CREATE TABLE IF NOT EXISTS ORDERLINE(
	CustOrd_ID  INT PRIMARY KEY,
	Prod_Num INT PRIMARY KEY,
	OrdLn_DateArrived   DATE, -- Format: ‘YYYY-MM-DD’; same as order date (CustOrd_Date) or later
	OrdLn_DatePicked    DATE, -- Format: ‘YYYY-MM-DD’; same as arrival date (DateArrived) or later
	OrdLn_Qnty  INT -- e.g., 2, 4, 5, etc
	FOREIGN KEY (CustOrd_ID) REFERENCES CUSTOMERORDER(CustOrd_ID),
	FOREIGN KEY (Prod_Num) REFERENCES PRODUCT(Prod_Num)
);