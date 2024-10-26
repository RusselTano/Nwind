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

