USE PharmacyDb;

CREATE TABLE Pharmacies
(
    PharmacyId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(50),
    Zip NVARCHAR(20),
    NumFilledPrescriptions INT,
    CreatedDate DATETIME2(7),
    UpdatedDate DATETIME2(7)
);

INSERT INTO Pharmacies (Name, Address, City, State, Zip, NumFilledPrescriptions, CreatedDate, UpdatedDate)
VALUES
('Pharmacy A', '1 Main St', 'TownOne', 'StateA', '12345', 100, GETDATE(), GETDATE()),
('Pharmacy B', '2 Main St', 'TownTwo', 'StateB', '67890', 150, GETDATE(), GETDATE()),
('Pharmacy C', '3 Main St', 'TownThree', 'StateC', '10112', 200, GETDATE(), GETDATE()),
('Pharmacy D', '4 Main St', 'TownFour', 'StateD', '13141', 250, GETDATE(), GETDATE()),
('Pharmacy E', '5 Main St', 'TownFive', 'StateE', '16171', 300, GETDATE(), GETDATE());
