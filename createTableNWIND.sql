/****************************************** Nwind ***********************************/
-- Categories

CREATE SEQUENCE CategoriesID_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 200;

CREATE TABLE Categories(
    CategoryID NUMBER 
        CONSTRAINT Categories_pk PRIMARY KEY,
    CategoryName VARCHAR2(40)
        CONSTRAINT Categories_CategoryName_nn NOT NULL
);

-- Customers

CREATE SEQUENCE CustomerID_seq
    START WITH 100
    INCREMENT BY 5
    MAXVALUE 5000;

CREATE TABLE Customers(
    CustomerID NUMBER
        CONSTRAINT  Customers_pk PRIMARY KEY,
    CustomerName VARCHAR2(75)
        CONSTRAINT Customers_CusTomerName_nn NOT NULL,
    City VARCHAR2(60)
        CONSTRAINT Customers_City_nn NOT NULL,
    PostalCode VARCHAR2(7)
        CONSTRAINT Customers_PostalCode_nn NOT NULL,
    Country VARCHAR2(60)
        CONSTRAINT Customers_Country_nn NOT NULL
);

-- Employees

CREATE SEQUENCE EmployeeID_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 555;

CREATE TABLE Employees(
    EmployeeID NUMBER
        CONSTRAINT Employees_pk PRIMARY KEY,
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
        CONSTRAINT Employees_ReportsTo_fk FOREIGN KEY(ReportsTo)
        REFERENCES Employees(EmployeeID)
);

-- Orders

CREATE SEQUENCE OrderID_seq
    START WITH 1
    MAXVALUE 99999;

CREATE TABLE Orders(
    OderID NUMBER 
        CONSTRAINT Orders_pk PRIMARY KEY,
    CustomerID NUMBER
        CONSTRAINT Orders_CustomersID_nn NOT NULL,
        CONSTRAINT Orders_CustomerID_fk REFERENCES Customers(CustomerID),
    EmployeeID NUMBER
        CONSTRAINT Orders_EmployeeID_nn NOT NULL,
        CONSTRAINT  Orders_EmployeeID_fk REFERENCES Employees(EmployeeID),
    OrderDate DATE
        CONSTRAINT Orders_OrderDate_nn NOT NULL,
        DEFAULT sysdate,
    RequiredDate DATE
        CONSTRAINT Orders_RequiredDate_chk CHECK(RequiredDate > OrderDate),
    ShippedDate DATE
        CONSTRAINT Orders_ShippedDate_chk CHECK(ShippedDate < RequiredDate),
    ShipVia NUMBER
        CONSTRAINT Orders_ShipVia_nn NOT NULL,
        CONSTRAINT Orders_ShipVia_fk REFERENCES Shippers(ShipperID),
    Freight NUMBER
        CONSTRAINT Orders_Freight_chk CHECK(Freight >= 30 AND Freight < 800)
);

-- OrdersDetails

CREATE TABLE OrdersDetails(
    OrderID NUMBER
        CONSTRAINT OrdersDetails_OrderID_fk REFERENCES Orders(OrdersID),
    ProductID NUMBER
        CONSTRAINT OrdersDetails_ProductID_fk REFERENCES Product(ProductID),
    UnitPrice NUMBER
        CONSTRAINT OrdersDetails_UnitPrice_nn NOT NULL,
        CONSTRAINT OrdersDetails_UnitPrice_chk CHECK(UnitPrice > 0.5),
    Quantity NUMBER
        CONSTRAINT OrdersDetails_Quantity_chk CHECK(Quantity > 0),
    Discount NUMBER
        CONSTRAINT OrdersDetails_Discount_chk CHECK(Discount >= 5 AND Discount <= 75)
);

-- Products

CREATE SEQUENCE productID
    START WITH 10
    INCREMENT BY 5
    MAXVALUE 10000;

CREATE TABLE Products(
    ProductID NUMBER
        CONSTRAINT Products_pk PRIMARY KEY,
    ProductName VARCHAR2(80)
        CONSTRAINT Products_ProductName_nn NOT NULL,
    CategoryID NUMBER
        CONSTRAINT Products_CategoryID_nn NOT NULL,
        CONSTRAINT Products_CategoryID_fk REFERENCES Categories(CategoryID),
    SupplierID NUMBER
        CONSTRAINT Products_SupplierID_nn NOT NULL,
        CONSTRAINT Products_SupplierID_fk REFERENCES Suppliers(SupplierID),
    QuantityPerUnit VARCHAR2(75),
    UnitPrice NUMBER
        CONSTRAINT Products_UnitPrice_nn NOT NULL,
        CONSTRAINT Products_UnitPrice_chk CHECK(UnitPrice > 0.10),
    UnitsInStock NUMBER
        CONSTRAINT Products_UnitsInStock_nn NOT NULL,
        CONSTRAINT Products_UnitsInStock_chk CHECK(UnitsInStock >= ReorderLevel),
    ReorderLevel NUMBER 
        DEFAULT 5
        CONSTRAINT Products_ReorderLevel_chk CHECK(ReorderLevel > 0),
    Discontinued CHAR(1)
        CONSTRAINT Product_Discontinued_chk CHECK(discontinued IN ('O','N'))
);

-- Shippers

CREATE SEQUENCE ShipperID_seq
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 2000;

CREATE TABLE Shippers(
    ShipperID NUMBER 
        CONSTRAINT Shippers_pk PRIMARY KEY,
    CompanyName VARCHAR2(60)
        CONSTRAINT shippers_CompanyName_nn NOT NULL
);


-- Suppliers

CREATE SEQUENCE SupplierID_sq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 400;

CREATE TABLE Suppliers(
    SupplierID NUMBER
        CONSTRAINT Suppliers_fk PRIMARY KEY,
    SupplierName VARCHAR2(60)
        CONSTRAINT Suppliers_SupplierName_nn NOT NULL,
    City VARCHAR2(60)
        CONSTRAINT Suppliers_City_nn NOT NULL,
    PostalCode VARCHAR(7)
        CONSTRAINT Suppliers_PostalCode_nn NOT NULL,
    Country VARCHAR2(60)
        CONSTRAINT Suppliers_Country_chk CHECK(Country IN ('Canada','France','Chine')),
    HomePage VARCHAR2(120)
);



//Question
/*
a quoi sert le -> ON DELETE CASCADE et quand l'utilise
Le casing des table et des champs
cle primaire avec reference et sans reference
Table Orders ne fonctionne pas
*/