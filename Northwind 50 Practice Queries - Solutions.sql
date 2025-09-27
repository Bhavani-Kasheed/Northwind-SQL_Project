use northwind ; 
-- ==========================================================
-- Northwind 50 Practice Queries - Solutions
-- Database: northwind (from northwind .sql)
-- ==========================================================

-- 1. CategoryName & Description sorted by CategoryName
SELECT categoryName, description
FROM Category
ORDER BY categoryName;

-- 2. ContactName, CompanyName, ContactTitle, Phone from Customer sorted by Phone
SELECT contactName, companyName, contactTitle, phone
FROM Customer
ORDER BY phone;

-- 3. Capitalized FirstName and LastName with HireDate sorted newest first
SELECT UPPER(firstname) AS FirstName,
       UPPER(lastname)  AS LastName,
       hireDate
FROM Employee
ORDER BY hireDate DESC;

-- 4. Top 10 orders with freight cost, sorted highest freight
SELECT orderId, orderDate, shippedDate, custId AS CustomerID, freight
FROM SalesOrder
ORDER BY freight DESC
LIMIT 10;

-- 5. Customer IDs in lowercase
SELECT LOWER(CAST(custId AS CHAR)) AS ID
FROM Customer;

-- 6. Suppliers info sorted by Country (desc), CompanyName (asc)
SELECT companyName, fax, phone, country, homePage
FROM Supplier
ORDER BY country DESC, companyName ASC;

-- 7. Customers from Buenos Aires
SELECT companyName, contactName
FROM Customer
WHERE city = 'Buenos Aires';

-- 8. Products out of stock
SELECT productName, unitPrice, quantityPerUnit
FROM Product
WHERE unitsInStock = 0 OR unitsInStock IS NULL;

-- 9. Customers not from Germany, Mexico, Spain
SELECT contactName, address, city
FROM Customer
WHERE country NOT IN ('Germany','Mexico','Spain');

-- 10. Orders placed on 21 May 1996
SELECT orderDate, shippedDate, custId AS CustomerID, freight
FROM SalesOrder
WHERE DATE(orderDate) = '1996-05-21';

-- 11. Employees not from USA
SELECT firstname, lastname, country
FROM Employee
WHERE country NOT IN ('USA','United States');

-- 12. Orders shipped later than required date
SELECT employeeId, orderId, custId, requiredDate, shippedDate
FROM SalesOrder
WHERE shippedDate > requiredDate;

-- 13. Customers from cities starting with A or B
SELECT city, companyName, contactName
FROM Customer
WHERE city LIKE 'A%' OR city LIKE 'B%';

-- 14. Even OrderIDs
SELECT orderId
FROM SalesOrder
WHERE MOD(orderId,2) = 0;

-- 15. Orders where freight > 500
SELECT *
FROM SalesOrder
WHERE freight > 500;

-- 16. Products up for reorder
SELECT productName, unitsInStock, unitsOnOrder, reorderLevel
FROM Product
WHERE unitsInStock <= reorderLevel;

-- 17. Customers with no fax
SELECT companyName, contactName
FROM Customer
WHERE fax IS NULL OR fax = '';

-- 18. Employees with no manager
SELECT firstname, lastname
FROM Employee
WHERE mgrId IS NULL;

-- 19. Odd OrderIDs
SELECT orderId
FROM SalesOrder
WHERE MOD(orderId,2) = 1;

-- 20. Customers without fax sorted by ContactName
SELECT companyName, contactName, fax
FROM Customer
WHERE fax IS NULL OR fax = ''
ORDER BY contactName;

-- 21. Customers from cities with letter L
SELECT city, companyName, contactName
FROM Customer
WHERE city LIKE '%L%' OR city LIKE '%l%'
ORDER BY contactName;

-- 22. Employees born in 1950s
SELECT firstname, lastname, birthDate
FROM Employee
WHERE YEAR(birthDate) BETWEEN 1950 AND 1959;

-- 23. Employees with birth year column
SELECT firstname, lastname, YEAR(birthDate) AS birthYear
FROM Employee;

-- 24. Count of OrderDetails per Order
SELECT orderId, COUNT(*) AS NumberOfOrders
FROM OrderDetail
GROUP BY orderId
ORDER BY NumberOfOrders DESC;

-- 25. Products supplied by specific suppliers
SELECT p.supplierId, p.productName, s.companyName
FROM Product p
JOIN Supplier s ON p.supplierId = s.supplierId
WHERE s.companyName IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY p.supplierId;

-- 26. Orders where ShipPostalCode begins with 98124
SELECT shipPostalCode, orderId, orderDate, requiredDate, shippedDate, shipAddress
FROM SalesOrder
WHERE shipPostalCode LIKE '98124%';

-- 27. Customers with no "Sales" in ContactTitle
SELECT contactName, contactTitle, companyName
FROM Customer
WHERE contactTitle NOT LIKE '%Sales%';

-- 28. Employees not in Seattle
SELECT lastname, firstname, city
FROM Employee
WHERE city <> 'Seattle';

-- 29. Customers in Mexico OR Spain (not Madrid)
SELECT companyName, contactTitle, city, country
FROM Customer
WHERE (country = 'Mexico')
   OR (country = 'Spain' AND city <> 'Madrid');

-- 30. Customer orders count
SELECT c.custId AS CustomerID, c.companyName, c.contactName, c.city, c.country,
       (SELECT COUNT(*) FROM SalesOrder o WHERE o.custId = c.custId) AS NumberOfOrders
FROM Customer c;

-- 31. Customers whose second letter is not 'A'
SELECT contactName
FROM Customer
WHERE SUBSTRING(contactName,2,1) NOT IN ('A','a');

-- 32. Avg, total stock value, max order
SELECT CEIL(AVG(unitPrice)) AS AveragePrice,
       SUM(unitPrice * IFNULL(unitsInStock,0)) AS TotalStock,
       MAX(IFNULL(unitsOnOrder,0)) AS MaxOrder
FROM Product;

-- 33. Product + Supplier + Category info
SELECT p.supplierId, s.companyName, c.categoryName, p.productName, p.unitPrice
FROM Product p
LEFT JOIN Supplier s ON p.supplierId = s.supplierId
LEFT JOIN Category c ON p.categoryId = c.categoryId;

-- 34. Customers with total freight > 200
SELECT custId, SUM(freight) AS TotalFreight
FROM SalesOrder
GROUP BY custId
HAVING SUM(freight) > 200;

-- 35. Orders with discount > 0
SELECT od.orderId, c.contactName, od.unitPrice, od.quantity, od.discount
FROM OrderDetail od
JOIN SalesOrder o ON od.orderId = o.orderId
JOIN Customer c ON o.custId = c.custId
WHERE od.discount > 0;

-- 36. Employees and their managers
SELECT e.employeeId,
       CONCAT(e.lastName, ', ', e.firstName) AS Employee,
       CONCAT(m.lastName, ', ', m.firstName) AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.mgrId = m.employeeId
ORDER BY e.employeeId;

-- 37. Avg, Min, Max price
SELECT AVG(unitPrice) AS AveragePrice,
       MIN(unitPrice) AS MinimumPrice,
       MAX(unitPrice) AS MaximumPrice
FROM Product;

-- 38. Create CustomerInfo view
CREATE VIEW CustomerInfo AS
SELECT c.custId, c.companyName, c.contactName, c.contactTitle,
       c.address, c.city, c.country, c.phone,
       o.orderDate, o.requiredDate, o.shippedDate
FROM Customer c
LEFT JOIN SalesOrder o ON c.custId = o.custId;

-- 39. Rename CustomerInfo view
RENAME TABLE CustomerInfo TO customer_details;

-- 40. Create ProductDetails view
CREATE VIEW ProductDetails AS
SELECT p.productId, s.companyName, p.productName, c.categoryName, c.description,
       p.quantityPerUnit, p.unitPrice, p.unitsInStock, p.unitsOnOrder, p.reorderLevel, p.discontinued
FROM Product p
LEFT JOIN Supplier s ON p.supplierId = s.supplierId
LEFT JOIN Category c ON p.categoryId = c.categoryId;

-- 41. Drop customer_details view
DROP VIEW IF EXISTS customer_details;

-- 42. ShortInfo (first 5 chars of CategoryName)
SELECT LEFT(categoryName,5) AS ShortInfo
FROM Category;

-- 43. Copy Shipper to shippers_duplicate
CREATE TABLE shippers_duplicate LIKE Shipper;
INSERT INTO shippers_duplicate SELECT * FROM Shipper;

-- 44. Select from shippers_duplicate
SELECT shipperId, companyName, phone
FROM shippers_duplicate;

-- 45. Products in Seafood category
SELECT s.companyName, p.productName
FROM Product p
JOIN Category c ON p.categoryId = c.categoryId
JOIN Supplier s ON p.supplierId = s.supplierId
WHERE c.categoryName = 'Seafood';

-- 46. Products in CategoryID = 5
SELECT p.categoryId, s.companyName, p.productName
FROM Product p
LEFT JOIN Supplier s ON p.supplierId = s.supplierId
WHERE p.categoryId = 5;

-- 47. Drop shippers_duplicate
DROP TABLE IF EXISTS shippers_duplicate;

-- 48. Employees with computed age
SELECT employeeId,
       CONCAT(firstName, ' ', lastName) AS FullName,
       birthDate,
       FLOOR(DATEDIFF(CURDATE(), birthDate)/365.25) AS Age
FROM Employee;

-- 49. Customers with more than 10 orders since 1994-12-31
SELECT c.companyName, COUNT(o.orderId) AS NumberOfOrders
FROM Customer c
JOIN SalesOrder o ON c.custId = o.custId
WHERE o.orderDate > '1994-12-31'
GROUP BY c.companyName
HAVING COUNT(o.orderId) > 10;

-- 50. All products (77 rows expected)
SELECT *
FROM Product;
