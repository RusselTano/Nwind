--ProductSuppliersView
CREATE OR REPLACE VIEW ProductSuppliersView AS
SELECT ProductID "Id", ProductName "Name", SupplierName "Suppliers", CategoryName "Category", City "City"
FROM Suppliers 
    INNER JOIN Products USING (SupplierID)
    INNER JOIN Categories USING (CategoryID)
WITH READ ONLY;

--ProductSalesSummaryView
CREATE OR REPLACE VIEW ProductSalesSummaryView AS
SELECT ProductID "Id", ProductName "Name", SUM(Quantity) "Quantite Totale Vendue", SUM(Quantity * p.UnitPrice) || '$' "Chiffre d'Affaires Total"
FROM Products p
    INNER JOIN OrdersDetails USING (ProductID)
GROUP BY ProductID, ProductName
WITH READ ONLY;


