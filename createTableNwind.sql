-- Categories
CREATE TABLE Categories(
    CategoryID NUMBER,
    CategoryName VARCHAR2(40)
        CONSTRAINT Categories_CategoryName_nn NOT NULL,
        
        CONSTRAINT Categories_pk PRIMARY KEY (CategoryID)
);

-- Suppliers
CREATE TABLE Suppliers(
    SupplierID NUMBER,
    SupplierName VARCHAR2(60)
        CONSTRAINT Suppliers_SupplierName_uk UNIQUE
        CONSTRAINT Suppliers_SupplierName_nn NOT NULL,
    City VARCHAR2(60)
        CONSTRAINT Suppliers_City_nn NOT NULL,
    PostalCode VARCHAR(7),
    Country VARCHAR2(60)
        CONSTRAINT Suppliers_Country_chk CHECK (Country IN ('Canada','France','Chine')),
    HomePage VARCHAR2(120),
    
        CONSTRAINT Suppliers_pk PRIMARY KEY (SupplierID)
);

-- Shippers
CREATE TABLE Shippers(
    ShipperID NUMBER,
    CompanyName VARCHAR2(60)
        CONSTRAINT shippers_CompanyName_nn NOT NULL,
        
        CONSTRAINT Shippers_pk PRIMARY KEY(ShipperID)
);

-- Customers
CREATE TABLE Customers(
    CustomerID NUMBER,
    CustomerName VARCHAR2(75)
        CONSTRAINT Customers_CusTomerName_nn NOT NULL,
    City VARCHAR2(60)
        CONSTRAINT Customers_City_nn NOT NULL,
    PostalCode VARCHAR2(7)
        CONSTRAINT Customers_PostalCode_nn NOT NULL,
    Country VARCHAR2(60)
        CONSTRAINT Customers_Country_nn NOT NULL,
        
        CONSTRAINT Customers_pk PRIMARY KEY (CustomerID)
);

-- Employees
CREATE TABLE Employees(
    EmployeeID NUMBER,
    LastName VARCHAR2(40)
        CONSTRAINT Employees_LastName_nn NOT NULL,
    FirstName VARCHAR2(40)
        CONSTRAINT Employees_FirstName_nn NOT NULL,
    Title VARCHAR2(25)
        CONSTRAINT Employees_Title_nn NOT NULL,
    Birthdate DATE 
        CONSTRAINT Employees_Birthdate_nn NOT NULL
        CONSTRAINT Employees_Birthdate_chk CHECK(Birthdate < TO_DATE('01-JAN-2006','DD-MON-YYYY')),
    HireDate DATE
        CONSTRAINT Employees_HireDate_nn NOT NULL,
        CONSTRAINT Employees_HireDate_chk CHECK(HireDate > BirthDate),
    City VARCHAR2(60)
        CONSTRAINT Employees_City_nn NOT NULL,
    PostalCode VARCHAR2(7)
        CONSTRAINT Employees_PostalCode_nn NOT NULL,
    Country VARCHAR2(60)
        DEFAULT 'Canada',
    ReportsTo NUMBER,
    
        CONSTRAINT Employees_pk PRIMARY KEY (EmployeeID),
        CONSTRAINT Employees_ReportsTo_fk FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

-- Products
CREATE TABLE Products(
    ProductID NUMBER,
    ProductName VARCHAR2(80)
        CONSTRAINT Products_ProductName_nn NOT NULL,
    CategoryID NUMBER
        CONSTRAINT Products_CategoryID_nn NOT NULL,
    SupplierID NUMBER
        CONSTRAINT Products_SupplierID_nn NOT NULL,
    QuantityPerUnit VARCHAR2(75),
    UnitPrice NUMBER
        CONSTRAINT Products_UnitPrice_nn NOT NULL
        CONSTRAINT Products_UnitPrice_chk CHECK(UnitPrice > 0.10),
    UnitsInStock NUMBER
        CONSTRAINT Products_UnitsInStock_nn NOT NULL,
    ReorderLevel NUMBER 
        DEFAULT 5
        CONSTRAINT Products_ReorderLevel_chk CHECK(ReorderLevel > 0),
    Discontinued CHAR(1)
        CONSTRAINT Product_Discontinued_chk CHECK(discontinued IN ('O', 'N')),
        
        CONSTRAINT Products_pk PRIMARY KEY (ProductID),
        CONSTRAINT Products_CategoryID_fk FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE,
        CONSTRAINT Products_SupplierID_fk FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE,
        CONSTRAINT Products_UnitsInStock_chk CHECK (UnitsInStock >= ReorderLevel)
);

-- Orders
CREATE TABLE Orders (
    OrderID NUMBER,
    CustomerID NUMBER 
        CONSTRAINT Orders_CustomerID_nn NOT NULL,
    EmployeeID NUMBER 
        CONSTRAINT Orders_EmployeeID_nn NOT NULL,
    OrderDate DATE DEFAULT SYSDATE 
        CONSTRAINT Orders_OrderDate_nn NOT NULL,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia NUMBER 
         CONSTRAINT Orders_ShipVia_nn NOT NULL,
    Freight NUMBER 
         CONSTRAINT Orders_Freight_chk CHECK(Freight >= 30 AND Freight < 800),

        CONSTRAINT Orders_pk PRIMARY KEY (OrderID),
        CONSTRAINT Orders_CustomerID_fk FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
        CONSTRAINT Orders_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
        CONSTRAINT Orders_ShipVia_fk FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID) ON DELETE CASCADE,
        CONSTRAINT Orders_RequiredDate_chk CHECK (RequiredDate > OrderDate),
        CONSTRAINT Orders_ShippedDate_chk CHECK (ShippedDate < RequiredDate)
);

-- OrdersDetails
CREATE TABLE OrdersDetails (
    OrderID NUMBER,
    ProductID NUMBER,
    UnitPrice NUMBER 
        CONSTRAINT OrdersDetails_UnitPrice_nn NOT NULL
        CONSTRAINT OrdersDetails_UnitPrice_chk CHECK(UnitPrice > 0.25),
    Quantity NUMBER 
        CONSTRAINT OrdersDetailsQuantity_nn NOT NULL 
        CONSTRAINT OrdersDetailsQuantity_chk CHECK (Quantity > 0),
    Discount NUMBER 
        CONSTRAINT OrdersDetailsDiscount_chk CHECK (Discount >= 5 AND Discount <= 75),

        CONSTRAINT OrdersDetails_pk PRIMARY KEY (OrderID, ProductID),
        CONSTRAINT OrdersDetails_OrderID_fk FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
        CONSTRAINT OrdersDetails_ProductID_fk FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);


