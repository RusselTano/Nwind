-- Categories

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (CategoriesID_seq.NEXTVAL, 'electronique');

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (CategoriesID_seq.NEXTVAL, 'Vetements');

INSERT INTO Categories (CategoryID, CategoryName)
VALUES (CategoriesID_seq.NEXTVAL, 'Alimentation');

-- Customers

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (CustomerID_seq.NEXTVAL, 'Jean Dupont', 'Paris', '75001', 'France');

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (CustomerID_seq.NEXTVAL, 'Marie Martin', 'Montreal', 'H2X 1Y9', 'Canada');

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (CustomerID_seq.NEXTVAL, 'David Lee', 'New York', '10001', 'USA');

-- Employees

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, City, PostalCode, Country, ReportsTo)
VALUES (EmployeeID_seq.NEXTVAL, 'Doe', 'John', 'Directeur', TO_DATE('12-04-1975', 'DD-MM-YYYY'), TO_DATE('01-01-2005', 'DD-MM-YYYY'), 'Paris', '75001', 'France',1);

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, City, PostalCode, Country, ReportsTo)
VALUES (EmployeeID_seq.NEXTVAL, 'Morlet', 'Christine', 'Vendeuse', TO_DATE('25-11-1982', 'DD-MM-YYYY'), TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'Lyon', '69002', 'France', 1);

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, City, PostalCode, Country, ReportsTo)
VALUES (EmployeeID_seq.NEXTVAL, 'Legarer', 'Pierre', 'Developpeur', TO_DATE('08-07-1990', 'DD-MM-YYYY'), TO_DATE('01-11-2015', 'DD-MM-YYYY'), 'Montreal', 'H2X 1Y9', 'Canada', 1);

-- Orders

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES (OrderID_seq.NEXTVAL, 100, 1, TO_DATE('28-04-2024', 'DD-MM-YYYY'), TO_DATE('05-05-2024', 'DD-MM-YYYY'), TO_DATE('02-05-2024', 'DD-MM-YYYY'), 10, 30);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES (OrderID_seq.NEXTVAL, 105, 2, TO_DATE('05-05-2024', 'DD-MM-YYYY'), TO_DATE('10-05-2024', 'DD-MM-YYYY'), TO_DATE('05-05-2024', 'DD-MM-YYYY'), 20, 80);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES (OrderID_seq.NEXTVAL, 110, 3, TO_DATE('20-04-2024', 'DD-MM-YYYY'), TO_DATE('10-05-2024', 'DD-MM-YYYY'), TO_DATE('01-03-2024', 'DD-MM-YYYY'), 30, 120);


-- OrdersDetails

INSERT INTO OrdersDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (1, 10, 599.99, 2, 10);

INSERT INTO OrdersDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (2, 15, 799.99, 3, 15);

INSERT INTO OrdersDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (3, 20, 24.99, 5, 5);

-- Products

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel, Discontinued)
VALUES (ProductID_seq.NEXTVAL, 'Television 4K 55 pouces', 1, 1, '1 unite par boite', 599.99, 20, 5, 'O');

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel, Discontinued)
VALUES (ProductID_seq.NEXTVAL, 'Smartphone dernier cri', 2, 2, '1 unite par boite', 799.99, 15, 10, 'N');

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel, Discontinued)
VALUES (ProductID_seq.NEXTVAL, 'T-shirt coton bio', 3, 3, '1 piece par emballage', 24.99, 50, 10, 'N');

-- Shippers

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (ShipperID_seq.NEXTVAL, 'FedEx');

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (ShipperID_seq.NEXTVAL, 'UPS');

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (ShipperID_seq.NEXTVAL, 'DHL');

-- Suppliers

INSERT INTO Suppliers (SupplierID, SupplierName, City, PostalCode, Country, HomePage)
VALUES (SupplierID_seq.NEXTVAL, 'Thales Group', 'Paris', '75015', 'France', 'https://www.thalesgroup.com');

INSERT INTO Suppliers (SupplierID, SupplierName, City, PostalCode, Country, HomePage)
VALUES (SupplierID_seq.NEXTVAL, 'Canada Goose', 'Toronto', 'M6K 3J1', 'Canada', 'https://www.canadagoose.com');

INSERT INTO Suppliers (SupplierID, SupplierName, City, PostalCode, Country, HomePage)
VALUES (SupplierID_seq.NEXTVAL, 'WH Group', 'Hong Kong', '999077', 'Chine', 'https://www.wh-group.com');

