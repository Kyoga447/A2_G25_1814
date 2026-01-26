--first/last name (as Full Name column label) + appointment) hourly rate (must include $) (Complete)

SELECT DISTINCT
    CONCAT(S.Staff_FName, ' ', S.Staff_LName) AS 'Full Name', 
    CONCAT('$', A.Apt_Hourly_Rate) AS 'Hourly Rate'
FROM 
    STAFF as S, APPOINTMENT as A
Where
    S.Staff_Apt_Level = A.Apt_Lvl_ID

--customer order; 2nd oldest + customer first/last (as Full Name column label) + date of order

--store name + manager first/last name (as Full Name column label) + appointment level + appointment) hourly rate (must include $); high/low hourly rate

--products + prod ID + description + type + size + quantity of each sold (select only date picked up quantity)

--each product sold (picked) on/before 20/05/2024 + product id; sorted by - Ascending+ description + type + total quantity sold

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
