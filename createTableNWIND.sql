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









//Question
/*
a quoi sert le -> ON DELETE CASCADE et quand l'utilise
Le casing des table et des champs
cle primaire avec reference et sans reference
Table Orders ne fonctionne pas
*/