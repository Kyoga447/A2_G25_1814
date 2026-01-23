--first/last name (as Full Name column label) + appointment) hourly rate (must include $) 

SELECT CONCAT(Staff_FName, Staff_LName)
AS 'Full Name'
    FROM STAFF
    
 Staff_Apt_Level, Apt_Hourly_Rate
FROM STAFF, APPOINTMENT
Where Staff_Apt_Level IS NOT NULL;

--customer order; 2nd oldest + customer first/last (as Full Name column label) + date of order

--store name + manager first/last name (as Full Name column label) + appointment level + appointment) hourly rate (must include $); high/low hourly rate

--products + prod ID + description + type + size + quantity of each sold (select only date picked up quantity)

--each product sold (picked) on/before 20/05/2024 + product id; sorted by - Ascending+ description + type + total quantity sold

