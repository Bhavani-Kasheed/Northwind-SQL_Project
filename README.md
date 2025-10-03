# Northwind SQL Project

## Project Summary
This project uses the classic Northwind sample database to practice SQL queries and analyze business data including orders, products, customers, and revenue trends. It covers a wide range of SQL concepts and analytical tasks.

## Key Features & Components
- Use of Northwind sample schema: orders, customers, products, suppliers, etc.
- 50+ SQL practice queries covering:
  - Filtering, joins, group by, aggregations
  - Views and subqueries
  - Customer behavior and order patterns
  - Top products and revenue analysis
- Query scripts with explanations provided

## Technologies / Tools Used
- SQL (MySQL, PostgreSQL, or equivalent)
- Northwind sample database
- Query files and documentation

## Why It’s Valuable
- Demonstrates foundational SQL skills
- Covers a wide variety of query types
- Converts database data into actionable insights
- Strong portfolio example for recruiters and hiring managers

Here are the main tables and columns I worked with:
---

### 🏷️ Category
| Column        | Type         | Description                     |
|---------------|-------------|---------------------------------|
| categoryId    | INT (PK)    | Unique ID of the category       |
| categoryName  | VARCHAR     | Category name (e.g., Beverages) |
| description   | VARCHAR     | Text description of category    |

---

### 📦 Product
| Column        | Type         | Description                           |
|---------------|-------------|---------------------------------------|
| productId     | INT (PK)    | Unique product ID                     |
| productName   | VARCHAR     | Product name                          |
| supplierId    | INT (FK)    | Linked to Supplier table              |
| categoryId    | INT (FK)    | Linked to Category table              |
| quantityPerUnit | VARCHAR   | e.g., "24-box case"                   |
| unitPrice     | DECIMAL     | Price per unit                        |
| unitsInStock  | INT         | Current stock                         |
| unitsOnOrder  | INT         | Items on order                        |
| reorderLevel  | INT         | Minimum stock before reorder needed   |
| discontinued  | TINYINT     | 0 = active, 1 = discontinued          |

---

### 👥 Customer
| Column        | Type         | Description                        |
|---------------|-------------|------------------------------------|
| custId        | VARCHAR (PK)| Unique customer code               |
| companyName   | VARCHAR     | Customer company name              |
| contactName   | VARCHAR     | Contact person                     |
| contactTitle  | VARCHAR     | Job title                          |
| address       | VARCHAR     | Street address                     |
| city          | VARCHAR     | City                               |
| country       | VARCHAR     | Country                            |
| phone         | VARCHAR     | Phone number                       |
| fax           | VARCHAR     | Fax number (nullable)              |

---

### 🧑‍💼 Employee
| Column        | Type         | Description                                |
|---------------|-------------|--------------------------------------------|
| employeeId    | INT (PK)    | Unique employee ID                         |
| lastName      | VARCHAR     | Last name                                  |
| firstName     | VARCHAR     | First name                                 |
| title         | VARCHAR     | Job title                                  |
| birthDate     | DATE        | Date of birth                              |
| hireDate      | DATE        | Hire date                                  |
| address       | VARCHAR     | Address                                    |
| city          | VARCHAR     | City                                       |
| country       | VARCHAR     | Country                                    |
| mgrId         | INT (FK)    | Manager ID (self-join on Employee table)   |

---

### 🛒 SalesOrder
| Column        | Type         | Description                        |
|---------------|-------------|------------------------------------|
| orderId       | INT (PK)    | Unique order ID                    |
| custId        | VARCHAR (FK)| Customer placing the order         |
| employeeId    | INT (FK)    | Employee handling the order        |
| orderDate     | DATETIME    | Order creation date                |
| requiredDate  | DATETIME    | Required delivery date             |
| shippedDate   | DATETIME    | Actual shipping date               |
| shipVia       | INT (FK)    | Shipper ID                         |
| freight       | DECIMAL     | Shipping cost                      |
| shipAddress   | VARCHAR     | Shipping address                   |
| shipPostalCode| VARCHAR     | Postal code                        |
| shipCountry   | VARCHAR     | Country shipped to                 |

---

### 📋 OrderDetail
| Column        | Type         | Description                           |
|---------------|-------------|---------------------------------------|
| orderId       | INT (FK)    | Linked to SalesOrder                  |
| productId     | INT (FK)    | Linked to Product                     |
| unitPrice     | DECIMAL     | Price at time of order                |
| quantity      | INT         | Quantity ordered                      |
| discount      | DECIMAL     | Discount applied                      |

---

### 🚚 Shipper
| Column        | Type         | Description                |
|---------------|-------------|----------------------------|
| shipperId     | INT (PK)    | Unique shipper ID          |
| companyName   | VARCHAR     | Shipping company name      |
| phone         | VARCHAR     | Contact phone              |

---

### 🏭 Supplier
| Column        | Type         | Description                |
|---------------|-------------|----------------------------|
| supplierId    | INT (PK)    | Unique supplier ID         |
| companyName   | VARCHAR     | Supplier company name      |
| contactName   | VARCHAR     | Contact person             |
| address       | VARCHAR     | Address                    |
| city          | VARCHAR     | City                       |
| country       | VARCHAR     | Country                    |
| phone         | VARCHAR     | Phone                      |
| fax           | VARCHAR     | Fax (nullable)             |
| homePage      | VARCHAR     | Website (nullable)         |

---

## 📝 Why add schema info?
This section makes it clear:
- **What data I worked with**
- **How tables are related (foreign keys)**
- **What data types are used** (important for filtering, joins, aggregates)

It also shows I can **read and understand a SQL schema**, not just write queries.
