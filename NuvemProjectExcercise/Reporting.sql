USE PharmacyDb

CREATE TABLE Pharmacists
(
    PharmacistId INT PRIMARY KEY IDENTITY(1,1),
    WorkLocation INT,
    Name NVARCHAR(100),
    Age INT,
    StartDate DATETIME2(7),
    EndDate DATETIME2(7),
    FOREIGN KEY (WorkLocation) REFERENCES Pharmacies(PharmacyId)
)

INSERT INTO Pharmacists (WorkLocation, Name, Age, StartDate)
VALUES 
(1, 'Alex Johnson', 30, '2023-01-10'),
(1, 'Taylor White', 28, '2023-01-15'),
(2, 'Jordan Smith', 32, '2023-02-01'),
(2, 'Casey Green', 29, '2023-02-20'),
(3, 'Jamie Lake', 34, '2023-03-05'),
(3, 'Robin Blue', 31, '2023-03-15'),
(4, 'Drew Hill', 35, '2023-04-10'),
(4, 'Morgan Creek', 27, '2023-04-17'),
(5, 'Riley Stone', 33, '2023-05-01'),
(5, 'Skye River', 29, '2023-05-20');

CREATE TABLE Warehouses
(
    WarehouseId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Address NVARCHAR(255)
)

INSERT INTO Warehouses (Name, Address)
VALUES 
('Central Supply', '123 Warehouse Lane'),
('Eastside Storage', '456 Distribution Dr'),
('Westend Depot', '789 Logistics Blvd');

CREATE TABLE Drugs
(
    DrugId INT PRIMARY KEY IDENTITY(1,1),
    Description NVARCHAR(MAX)
)

INSERT INTO Drugs (Description)
VALUES 
('Acetaminophen - Pain reliever and fever reducer.'),
('Ibuprofen - Anti-inflammatory drug used for pain relief, fever reduction, and swelling.'),
('Amoxicillin - Antibiotic used to treat a variety of bacterial infections.'),
('Cetirizine - Antihistamine used for relieving allergy symptoms.'),
('Albuterol - Medication to treat and prevent bronchospasm.'),
('Simvastatin - Drug used to control hypercholesterolemia.'),
('Lisinopril - Medication for treating hypertension.'),
('Metformin - Oral diabetes medicine that helps control blood sugar levels.'),
('Amlodipine - Used to treat high blood pressure and chest pain.'),
('Sertraline - Antidepressant used for treating depression and anxiety.');

CREATE TABLE Deliveries
(
    DeliveryId INT PRIMARY KEY IDENTITY(1,1),
    Warehouse INT,
    Pharmacy INT,
    Drug INT,
    UnitCount INT,
    UnitPrice DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    DateDelivered DATETIME2(7),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(WarehouseId),
    FOREIGN KEY (Pharmacy) REFERENCES Pharmacies(PharmacyId),
    FOREIGN KEY (Drug) REFERENCES Drugs(DrugId)
)

DECLARE @DeliveryDate DATE = '2024-02-01';

INSERT INTO Deliveries (Warehouse, Pharmacy, Drug, UnitCount, UnitPrice, TotalPrice, DateDelivered)
VALUES
  (1, 1, 1, 100, 5.50, 550, DATEADD(DAY, -1, @DeliveryDate)),
  (2, 2, 2, 200, 2.75, 550, DATEADD(DAY, -4, @DeliveryDate)),
  (3, 3, 3, 150, 3.67, 550.5, DATEADD(DAY, -7, @DeliveryDate)),
  (1, 4, 4, 120, 4.58, 549.6, DATEADD(DAY, -11, @DeliveryDate)),
  (2, 5, 5, 180, 3.05, 549, DATEADD(DAY, -15, @DeliveryDate)),
  (3, 1, 6, 110, 5.00, 550, DATEADD(DAY, -18, @DeliveryDate)),
  (1, 2, 7, 130, 4.23, 550.9, DATEADD(DAY, -22, @DeliveryDate)),
  (2, 3, 8, 140, 3.93, 550.2, DATEADD(DAY, -25, @DeliveryDate)),
  (3, 4, 9, 160, 3.44, 550.4, DATEADD(DAY, -28, @DeliveryDate)),
  (1, 5, 10, 170, 3.24, 550.8, DATEADD(DAY, -32, @DeliveryDate)),
  (2, 1, 1, 190, 2.89, 549.1, DATEADD(DAY, -36, @DeliveryDate)),
  (3, 2, 2, 210, 2.62, 550.2, DATEADD(DAY, -39, @DeliveryDate)),
  (1, 3, 3, 230, 2.39, 550.7, DATEADD(DAY, -43, @DeliveryDate)),
  (2, 4, 4, 250, 2.20, 550, DATEADD(DAY, -46, @DeliveryDate)),
  (3, 5, 5, 270, 2.04, 550.8, DATEADD(DAY, -50, @DeliveryDate)),
  (1, 1, 6, 290, 1.90, 551, DATEADD(DAY, -53, @DeliveryDate)),
  (2, 2, 7, 310, 1.77, 549.7, DATEADD(DAY, -57, @DeliveryDate)),
  (3, 3, 8, 330, 1.67, 550.1, DATEADD(DAY, -60, @DeliveryDate)),
  (1, 4, 9, 350, 1.57, 549.5, DATEADD(DAY, -63, @DeliveryDate)),
  (2, 5, 10, 370, 1.49, 550.3, DATEADD(DAY, -67, @DeliveryDate));

CREATE TABLE PharmacySales
(
    SaleId INT PRIMARY KEY IDENTITY(1,1),
    Pharmacist INT,
    Drug INT,
    Pharmacy INT,
    SaleDate DATETIME2(7),
    QuantitySold INT,
    FOREIGN KEY (Pharmacist) REFERENCES Pharmacists(PharmacistId),
    FOREIGN KEY (Drug) REFERENCES Drugs(DrugId),
    FOREIGN KEY (Pharmacy) REFERENCES Pharmacies(PharmacyId)
);

CREATE TABLE PharmacySales
(
    SaleId INT PRIMARY KEY IDENTITY(1,1),
    Pharmacist INT,
    Drug INT,
    Pharmacy INT,
    SaleDate DATETIME2(7),
    QuantitySold INT,
    FOREIGN KEY (Pharmacist) REFERENCES Pharmacists(PharmacistId),
    FOREIGN KEY (Drug) REFERENCES Drugs(DrugId),
    FOREIGN KEY (Pharmacy) REFERENCES Pharmacies(PharmacyId)
);

INSERT INTO PharmacySales (Pharmacist, Drug, Pharmacy, SaleDate, QuantitySold)
VALUES
(1, 1, 1, '2023-10-01', 20),
(2, 2, 1, '2023-10-02', 15),
(1, 3, 2, '2023-10-03', 25),
(2, 4, 2, '2023-10-04', 30),
(1, 5, 3, '2023-10-05', 10),
(2, 1, 3, '2023-10-06', 5),
(1, 2, 4, '2023-10-07', 20),
(2, 3, 4, '2023-10-08', 25),
(1, 4, 5, '2023-10-09', 15),
(2, 5, 5, '2023-10-10', 10);
