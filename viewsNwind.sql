select * from Categories;

select * from Customers;

DELETE FROM Customers
WHERE
    Customers.CustomerID = 115
    or Customers.CustomerID = 120
    or Customers.CustomerID = 125;

select * from Employees;

select * from Orders;

select * from OrdersDetails;

select * from Products;

select * from Shippers;

select * from Suppliers;

CREATE OR REPLACE VIEW ProductSuppliersView AS
SELECT
    ProductID "Id",
    ProductName "Name",
    SupplierName "Suppliers",
    CategoryName "Category",
    City "City"
FROM
    Suppliers
    INNER JOIN Products USING (SupplierID)
    INNER JOIN Categories USING (CategoryID)
WITH
    READ ONLY;

CREATE OR REPLACE VIEW ProductSalesSummaryView AS
SELECT
    ProductID "Id",
    ProductName "Name",
    SUM(Quantity) "Quantite Totale Vendue",
    SUM(Quantity * p.UnitPrice) || '$' "Chiffre d'Affaires Total"
FROM Products p
    INNER JOIN OrdersDetails USING (ProductID)
GROUP BY
    ProductID,
    ProductName
WITH
    READ ONLY;
--Customers
DELETE FROM Employees
WHERE
    Employees.Employeeid = 5
    or Employees.Employeeid = 6
    or Employees.Employeeid = 4;

DELETE FROM Customers
WHERE
    Customers.CustomerID = 115
    or Customers.CustomerID = 120
    or Customers.CustomerID = 125;

SELECT * FROM productsalessummaryview;

SELECT * FROM ProductSuppliersView;