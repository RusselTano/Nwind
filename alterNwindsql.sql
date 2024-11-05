ALTER TABLE Customers ADD (ContactName VARCHAR2(20));

select * from Customers;

ALTER TABLE Suppliers MODIFY(HomePage VARCHAR(500));

ALTER TABLE Employees DISABLE CONSTRAINT Employees_PostalCode_nn; 

--ALTER TABLE Orders ADD CONSTRAINT Orders_Freight_nn NOT NULL ;
ALTER TABLE Orders MODIFY(Freight CONSTRAINT Orders_Freight_nn NOT NULL);
--ALTER TABLE employee MODIFY(dept_id CONSTRAINT dept_id_nn NOT NULL);

ALTER TABLE Shippers ADD (Telephone NUMBER);

select * from Shippers;


--MODIFY(Freight Orders_Freight_nn NOT NULL)
--    HomePage VARCHAR2(120)
--    PostalCode VARCHAR2(7)
--        CONSTRAINT Employees_PostalCode_nn NOT NULL,
desc Orders