ALTER TABLE Customers ADD (ContactName VARCHAR2(20));

ALTER TABLE Suppliers MODIFY(HomePage VARCHAR(500));

ALTER TABLE Employees DISABLE CONSTRAINT Employees_PostalCode_nn; 

ALTER TABLE Orders MODIFY(Freight CONSTRAINT Orders_Freight_nn NOT NULL);

ALTER TABLE Shippers ADD (Telephone NUMBER);
