-- Categories

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (CategoriesID_seq.NEXTVAL, '�lectronique');

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (CategoriesID_seq.NEXTVAL, 'V�tements');

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (CategoriesID_seq.NEXTVAL, 'Alimentation');

DELETE FROM categories;
select * from categories;


-- Customers

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (CustomerID_seq.NEXTVAL, 'Jean Dupont', 'Paris', '75001', 'France');

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (CustomerID_seq.NEXTVAL, 'Marie Martin', 'Montr�al', 'H2X 1Y9', 'Canada');

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (CustomerID_seq.NEXTVAL, 'David Lee', 'New York', '10001', 'USA');

DELETE FROM Customers;
select * from Customers;

-- Employees

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, City, PostalCode, Country, ReportsTo)
VALUES (EmployeeID_seq.NEXTVAL, 'Doe', 'John', 'Directeur', TO_DATE('12-04-1975', 'DD-MM-YYYY'), TO_DATE('01-01-2005', 'DD-MM-YYYY'), 'Paris', '75001', 'France',1);

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, City, PostalCode, Country, ReportsTo)
VALUES (EmployeeID_seq.NEXTVAL, 'Morlet', 'Christine', 'Vendeuse', TO_DATE('25-11-1982', 'DD-MM-YYYY'), TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'Lyon', '69002', 'France', 1);

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, City, PostalCode, Country, ReportsTo)
VALUES (EmployeeID_seq.NEXTVAL, 'L�garer', 'Pierre', 'D�veloppeur', TO_DATE('08-07-1990', 'DD-MM-YYYY'), TO_DATE('01-11-2015', 'DD-MM-YYYY'), 'Montr�al', 'H2X 1Y9', 'Canada', 1);

DELETE FROM Employees;
select * from Employees;

-- Orders

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES (OrderID_seq.NEXTVAL, 100, 1, TO_DATE('28-04-2024', 'DD-MM-YYYY'), TO_DATE('05-05-2024', 'DD-MM-YYYY'), TO_DATE('02-05-2024', 'DD-MM-YYYY'), 10, 30);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES (OrderID_seq.NEXTVAL, 105, 2, TO_DATE('05-05-2024', 'DD-MM-YYYY'), TO_DATE('10-05-2024', 'DD-MM-YYYY'), TO_DATE('05-05-2024', 'DD-MM-YYYY'), 20, 80);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES (OrderID_seq.NEXTVAL, 110, 3, TO_DATE('20-04-2024', 'DD-MM-YYYY'), TO_DATE('10-05-2024', 'DD-MM-YYYY'), TO_DATE('01-03-2024', 'DD-MM-YYYY'), 30, 120);

DELETE FROM Orders;
select * from Orders;

-- OrdersDetails

INSERT INTO OrdersDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (1, 10, 599.99, 2, 10);

INSERT INTO OrdersDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (2, 15, 799.99, 3, 15);

INSERT INTO OrdersDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (3, 20, 24.99, 5, 5);

DELETE FROM OrdersDetails;
select * from OrdersDetails;

-- Products

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel, Discontinued)
VALUES (ProductID_seq.NEXTVAL, 'T�l�vision 4K 55 pouces', 1, 1, '1 unit� par bo�te', 599.99, 20, 5, 'O');

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel, Discontinued)
VALUES (ProductID_seq.NEXTVAL, 'Smartphone dernier cri', 2, 2, '1 unit� par bo�te', 799.99, 15, 10, 'N');

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel, Discontinued)
VALUES (ProductID_seq.NEXTVAL, 'T-shirt coton bio', 3, 3, '1 pi�ce par emballage', 24.99, 50, 10, 'N');

DELETE FROM Products;
select * from Products;

-- Shippers

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (ShipperID_seq.NEXTVAL, 'FedEx');

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (ShipperID_seq.NEXTVAL, 'UPS');

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (ShipperID_seq.NEXTVAL, 'DHL');

DELETE FROM Shippers;
select * from Shippers;

-- Suppliers

INSERT INTO Suppliers (SupplierID, SupplierName, City, PostalCode, Country, HomePage)
VALUES (SupplierID_seq.NEXTVAL, 'Thales Group', 'Paris', '75015', 'France', 'https://www.thalesgroup.com');

INSERT INTO Suppliers (SupplierID, SupplierName, City, PostalCode, Country, HomePage)
VALUES (SupplierID_seq.NEXTVAL, 'Canada Goose', 'Toronto', 'M6K 3J1', 'Canada', 'https://www.canadagoose.com');

INSERT INTO Suppliers (SupplierID, SupplierName, City, PostalCode, Country, HomePage)
VALUES (SupplierID_seq.NEXTVAL, 'WH Group', 'Hong Kong', '999077', 'Chine', 'https://www.wh-group.com');

DELETE FROM Suppliers;
select * from Suppliers;


---Views
SELECT * FROM productsalessummaryview;

SELECT * FROM ProductSuppliersView;

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


---Alter table
ALTER TABLE Customers ADD (ContactName VARCHAR2(20));

ALTER TABLE Suppliers MODIFY(HomePage VARCHAR(500));

ALTER TABLE Employees DISABLE CONSTRAINT Employees_PostalCode_nn; 

--ALTER TABLE Orders ADD CONSTRAINT Orders_Freight_nn NOT NULL ;
ALTER TABLE Orders MODIFY(Freight CONSTRAINT Orders_Freight_nn NOT NULL);
--ALTER TABLE employee MODIFY(dept_id CONSTRAINT dept_id_nn NOT NULL);

ALTER TABLE Shippers ADD (Telephone NUMBER);

--MODIFY(Freight Orders_Freight_nn NOT NULL)
--    HomePage VARCHAR2(120)
--    PostalCode VARCHAR2(7)
--        CONSTRAINT Employees_PostalCode_nn NOT NULL,
desc Orders

--Afficher

SELECT * FROM OrdersDetails;
SELECT * FROM Orders;
SELECT * FROM Employees;
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM Suppliers;
SELECT * FROM Shippers;