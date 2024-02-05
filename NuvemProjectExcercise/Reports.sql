USE PharmacyDb
-- Report 1
SELECT 
    w.Name AS [Warehouse From],
    p.Name AS [Pharmacy To],
    d.DrugId,
    del.UnitCount,
    del.UnitPrice,
    del.TotalPrice,
    del.DateDelivered
FROM Deliveries del
JOIN Warehouses w ON del.Warehouse = w.WarehouseId
JOIN Pharmacies p ON del.Pharmacy = p.PharmacyId
JOIN Drugs d ON del.Drug = d.DrugId
ORDER BY del.DateDelivered DESC;

-- Report 2
SELECT 
    w.Name AS [Warehouse Name], 
    SUM(del.TotalPrice) AS [Total Revenue], 
    SUM(del.UnitCount) AS [Total Units], 
    SUM(del.TotalPrice) / NULLIF(SUM(del.UnitCount), 0) AS [Average Profit Per Unit]
FROM 
    Deliveries del
JOIN 
    Warehouses w ON del.Warehouse = w.WarehouseId
GROUP BY 
    w.Name
ORDER BY 
    [Total Revenue] DESC;

-- Report 3
SELECT 
    ph.Name AS PharmacistName, 
    p.Name AS PharmacyName,
    d.Description AS DrugSold,
    ps.QuantitySold,
	(ps.QuantitySold * ps.UnitPrice) AS TotalSaleAmt
FROM 
    Pharmacists ph
JOIN 
    Pharmacies p ON ph.WorkLocation = p.PharmacyId
JOIN 
    PharmacySales ps ON ph.PharmacistId = ps.Pharmacist
JOIN 
    Drugs d ON ps.Drug = d.DrugId
ORDER BY (ps.QuantitySold * ps.UnitPrice) DESC;
