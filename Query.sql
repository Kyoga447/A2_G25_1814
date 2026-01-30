--first/last name (as Full Name column label) + appointment) hourly rate (must include $) (Complete)

SELECT
    CONCAT(S.Staff_FName, ' ', S.Staff_LName) AS 'Full Name', 
    CONCAT('$', A.Apt_Hourly_Rate) AS 'Hourly Rate'
FROM 
    STAFF as S, APPOINTMENT as A
Where
    S.Staff_Apt_Level = A.Apt_Lvl_ID
ORDER BY
    A.Apt_Hourly_Rate DESC;

--customer order; 2nd oldest + customer first/last (as Full Name column label) + date of order

SELECT
    CONCAT(C.Cust_FName, ' ', C.Cust_LName) AS 'Full Name',
    CO.CustOrd_Date AS 'Date of Order'
FROM 
    CUSTOMER AS C, CUSTOMERORDER AS CO
Where
    C.Cust_Number = CO.Cust_Number
ORDER BY 
    CO.CustOrd_Date ASC
LIMIT 1,1;


--store name + manager first/last name (as Full Name column label) + appointment level + appointment hourly rate (must include $); high/low hourly rate

SELECT
    Str_Name,
    CONCAT(S.Staff_FName, ' ', S.Staff_LName) AS 'Full Name', 
    Staff_Apt_Level,
    CONCAT('$', A.Apt_Hourly_Rate) AS 'Hourly Rate'
FROM 
    STAFF as S,
    STORE AS SO,
    APPOINTMENT AS A
WHERE
    S.Staff_ID = SO.StoreManagerID AND
    S.Staff_Apt_Level = A.Apt_Lvl_ID
ORDER BY   
	A.Apt_Hourly_Rate DESC;

--products + prod ID + description + type + size + quantity of each sold (select only date picked up quantity)

SELECT
    OL.Prod_Num AS 'Product ID',
    P.Prod_desc AS 'Product Description',
    PT.Prod_Type_Desc AS 'Product Type',
    P.Prod_Size AS 'Product Size',
    SUM(OL.OrdLn_Qnty) AS 'Quantity Sold'
FROM
    PRODUCT AS P, 
    PRODUCTTYPE AS PT, 
    ORDERLINE AS OL
WHERE
    P.Prod_TypeID = PT.Prod_TypeID,
    OL.Prod_Num = P.Prod_Num,
    OL.OrdLn_DatePicked IS NOT NULL;



--each product sold (picked) on/before 20/05/2024 + product id; sorted by - Ascending + description + type + total quantity sold

SELECT DISTINCT
    OL.OrdLn_DatePicked AS 'Product Sold on:',
    P.Prod_Num AS 'Product ID',
    P.Prod_desc AS 'Product Descripion',
    PT.Prod_Type_Desc AS 'Product Type',
    OL.OrdLn_Qnty AS 'Total Quantity Sold'
FROM
    PRODUCT AS P, PRODUCTTYPE AS PT, ORDERLINE AS OL
WHERE
    P.Prod_TypeID = PT.Prod_TypeID,

    OL.OrdLn_DatePicked IS NOT NULL;

--Reference

-- APPOINTMENT LEVELS: 5 appointment levels with hourly rates
INSERT INTO APPOINTMENT (Apt_Lvl_ID, Apt_Lvl_Desc, Apt_Hourly_Rate) VALUES

-- PRODUCTTYPE: 5 product categories
INSERT INTO PRODUCTTYPE (Prod_TypeID, Prod_Type_Desc) VALUES


-- STAFF: 5 staff members (2 managers, 3 sales associates/supervisors)
-- Insert STAFF BEFORE STORE to avoid FK constraint issues with StoreManagerID
INSERT INTO STAFF (Staff_ID, Staff_FName, Staff_LName, Staff_Phone, Staff_DoB, Staff_StartDate, Staff_Apt_Level, Store_ID, SupervisorID) VALUES


-- STORE: 5 stores across Australia with valid StoreManagerID references
INSERT INTO STORE (Str_Num, Str_Name, Str_Phone, Str_Email, StoreManagerID) VALUES


-- PRODUCT: 5 products across different types
INSERT INTO PRODUCT (Prod_Num, Prod_desc, Prod_Size, Prod_Price, Price_Discount, Prod_TypeID) VALUES


-- CUSTOMER: 5 customers
INSERT INTO CUSTOMER (Cust_FName, Cust_LName, Cust_Phone, Cust_Email) VALUES


-- ORDERMODE: 4 order modes (realistic for retail)
INSERT INTO ORDERMODE (Order_ModeID, Order_Mode_Desc) VALUES


-- CUSTOMERORDER: 5 orders from customers
INSERT INTO CUSTOMERORDER (CustOrd_ID, CustOrd_Date, CustOrd_Mode, Cust_Number, Str_Num) VALUES


-- INVENTORY: 5 inventory records across stores
INSERT INTO INVENTORY (Prod_Num, Str_Num, Inv_QntyOnHand, Inv_QtyOrdered) VALUES


-- ORDERLINE: 5 order line items (order details)
INSERT INTO ORDERLINE (CustOrd_ID, Prod_Num, OrdLn_DateArrived, OrdLn_DatePicked, OrdLn_Qnty) VALUES
