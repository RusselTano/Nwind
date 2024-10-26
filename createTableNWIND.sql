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