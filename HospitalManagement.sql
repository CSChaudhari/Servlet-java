CREATE DATABASE ECommerceHealthcare;

-- Use Database
USE ECommerceHealthcare;

-- Create Users table
CREATE TABLE Users(
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    UserType ENUM('Patient', 'Doctor', 'Admin') NOT NULL
);

-- Create Patients table
CREATE TABLE Patients (
PatientID INT PRIMARY KEY,
UserID INT UNIQUE,
Name VARCHAR(100) NOT NULL,
Address VARCHAR(255),
ContactInformation VARCHAR(100),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Doctors table
CREATE TABLE Doctors (
DoctorID INT PRIMARY KEY,
UserID INT UNIQUE,
Name VARCHAR(100) NOT NULL,
Specialization VARCHAR(100),
ContactInformation VARCHAR(100),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Admins table
CREATE TABLE Admins (
AdminID INT PRIMARY KEY,
UserID INT UNIQUE,
Name VARCHAR(100) NOT NULL,
ContactInformation VARCHAR(100),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Products table
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Description TEXT,
Price DECIMAL(10, 2) NOT NULL,
QuantityAvailable INT NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
UserID INT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Subtotal DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Appointments table
CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY,
PatientID INT,
DoctorID INT,
AppointmentDateTime DATETIME,
Status ENUM('Scheduled', 'Completed', 'Canceled') NOT NULL,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Prescriptions table
CREATE TABLE Prescriptions (
PrescriptionID INT PRIMARY KEY,
PatientID INT,
DoctorID INT,
PrescriptionDate DATE,
PrescriptionDetails TEXT,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert data into Users table
INSERT INTO Users (UserID, Username, Password, Email, UserType)
VALUES (1, 'john_doe', 'password123', 'john.doe@email.com', 'Patient'),
       (2, 'jane_doe', 'qwerty', 'jane.doe@email.com', 'Doctor'),
       (3, 'admin', 'admin123', 'admin@email.com', 'Admin'),
       (4, 'alice_smith', 'alice123', 'alice.smith@email.com', 'Patient'),
       (5, 'bob_johnson', 'bob123', 'bob.johnson@email.com', 'Patient'),
       (6, 'michael_brown', 'michael123', 'michael.brown@email.com', 'Patient'),
       (7, 'sarah_lee', 'sarah123', 'sarah.lee@email.com', 'Doctor'),
       (8, 'alex_johnson', 'alex123', 'alex.johnson@email.com', 'Doctor'),
       (9, 'emily_wang', 'emily123', 'emily.wang@email.com', 'Doctor'),
       (10, 'james_smith', 'james123', 'james.smith@email.com', 'Doctor'),
       (11, 'jessica_martinez', 'jessica123', 'jessica.martinez@email.com', 'Doctor'),
       (12, 'admin1', 'admin123', 'admin1@email.com', 'Admin'),
       (13, 'admin2', 'admin123', 'admin2@email.com', 'Admin'),
       (14, 'admin3', 'admin123', 'admin3@email.com', 'Admin'),
       (15, 'admin4', 'admin123', 'admin4@email.com', 'Admin'),
       (16, 'admin5', 'admin123', 'admin5@email.com', 'Admin');

-- Insert data into Patients table
INSERT INTO Patients (PatientID, UserID, Name, Address, ContactInformation)
VALUES (2, 4, 'Alice Smith', '456 Elm St, Anytown USA', '555-987-6543'),
       (3, 5, 'Bob Johnson', '789 Oak St, Anytown USA', '555-111-2222'),
       (4, 1, 'Emily White', '567 Pine St, Anytown USA', '555-222-3333'),
       (5, 6, 'Michael Brown', '890 Maple St, Anytown USA', '555-444-5555');

-- Insert data into Doctors table
INSERT INTO Doctors (DoctorID, UserID, Name, Specialization, ContactInformation)
VALUES (1, 7, 'Dr. Sarah Lee', 'Neurology', '555-123-4567'),
       (2, 8, 'Dr. Alex Johnson', 'Pediatrics', '555-987-6543'),
       (3, 9, 'Dr. Emily Wang', 'Cardiology', '555-111-2222'),
       (4, 10, 'Dr. James Smith', 'Dermatology', '555-222-3333'),
       (5, 11, 'Dr. Jessica Martinez', 'Oncology', '555-444-5555');

-- Insert data into Admins table
INSERT INTO Admins (AdminID, UserID, Name, ContactInformation)
VALUES (1, 12, 'Admin1', '555-555-5555'),
       (2, 13, 'Admin2', '555-666-6666'),
       (3, 14, 'Admin3', '555-777-7777'),
       (4, 15, 'Admin4', '555-888-8888'),
       (5, 16, 'Admin5', '555-999-9999');

-- Insert data into Products table
INSERT INTO Products (ProductID, Name, Description, Price, QuantityAvailable)
VALUES (1, 'Thermometer', 'Digital thermometer', 19.99, 100),
       (2, 'Bandage', 'Adhesive bandage', 4.99, 500),
       (3, 'First Aid Kit', 'First aid kit for home use', 29.99, 100),
       (4, 'Pain Reliever', 'Over-the-counter pain reliever', 9.99, 200),
       (5, 'Antibacterial Soap', 'Soap for killing bacteria', 3.99, 300);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, UserID, OrderDate, TotalAmount)
VALUES (1, 1, '2023-01-01', 34.97),
       (2, 2, '2023-02-15', 19.99),
       (3, 3, '2023-03-20', 45.50),
       (4, 4, '2023-04-05', 12.99),
       (5, 5, '2023-05-10', 87.25);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (1, 1, 1, 1, 19.99),
       (2, 1, 2, 3, 14.97),
       (3, 2, 2, 1, 4.99),
       (4, 3, 3, 2, 59.98),
       (5, 4, 4, 1, 12.99);

-- Insert data into Appointments table
-- Insert data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDateTime, Status)
VALUES (2, 2, 2, '2023-02-15 14:00:00', 'Completed'),
       (3, 3, 3, '2023-03-20 11:30:00', 'Scheduled'),
       (5, 5, 5, '2023-05-10 13:45:00', 'Scheduled');

-- Insert data into Prescriptions table
INSERT INTO Prescriptions (PrescriptionID, PatientID, DoctorID, PrescriptionDate, PrescriptionDetails)
VALUES (1, 1, 1, '2023-01-01', 'Take one pill twice a day for 7 days'),
       (2, 2, 2, '2023-02-15', 'Use as needed for pain relief'),
       (3, 3, 3, '2023-03-20', 'Apply cream to affected area twice daily'),
       (5, 5, 5, '2023-05-10', 'Use as directed on package');



-- Update data in Users table
UPDATE Users
SET Password = 'newpassword123'
WHERE UserID = 1;

-- Update data in Patients table
UPDATE Patients
SET Address = '789 Oak St, Anytown USA'
WHERE PatientID = 1;

-- Update data in Doctors table
UPDATE Doctors
SET Specialization = 'Neurology'
WHERE DoctorID = 1;

-- Update data in Admins table
UPDATE Admins
SET ContactInformation = '555-666-7777'
WHERE AdminID = 1;

-- Update data in Products table
UPDATE Products
SET Price = 24.99
WHERE ProductID = 1;

-- Update data in Orders table
UPDATE Orders
SET TotalAmount = 29.99
WHERE OrderID = 1;

-- Update data in OrderDetails table
UPDATE OrderDetails
SET Quantity = 2
WHERE OrderDetailID = 1;

-- Update data in Appointments table
UPDATE Appointments
SET Status = 'Canceled'
WHERE AppointmentID = 1;

-- Update data in Prescriptions table
UPDATE Prescriptions
SET PrescriptionDetails = 'Take two pills twice a day for 14 days'
WHERE PrescriptionID = 1;


-- Delete data from Users table
DELETE FROM Users
WHERE UserID = 12;

-- Delete data from Patients table
DELETE FROM Patients
WHERE PatientID = 4;

-- Select data from Users table
SELECT * FROM Users;

-- Select data from Patients table
SELECT * FROM Patients;

-- Select data from Doctors table
SELECT * FROM Doctors;

-- Select data from Admins table
SELECT * FROM Admins;

-- Select data from Products table
SELECT * FROM Products;

-- Select data from Orders table
SELECT * FROM Orders;

-- Select data from OrderDetails table
SELECT * FROM OrderDetails;

-- Select data from Appointments table
SELECT * FROM Appointments;

-- Select data from Prescriptions table
SELECT * FROM Prescriptions;
CREATE DATABASE ECommerceHealthcare;

-- Use Database
USE ECommerceHealthcare;

-- Create Users table
CREATE TABLE Users(
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    UserType ENUM('Patient', 'Doctor', 'Admin') NOT NULL
);

-- Create Patients table
CREATE TABLE Patients (
PatientID INT PRIMARY KEY,
UserID INT UNIQUE,
Name VARCHAR(100) NOT NULL,
Address VARCHAR(255),
ContactInformation VARCHAR(100),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Doctors table
CREATE TABLE Doctors (
DoctorID INT PRIMARY KEY,
UserID INT UNIQUE,
Name VARCHAR(100) NOT NULL,
Specialization VARCHAR(100),
ContactInformation VARCHAR(100),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Admins table
CREATE TABLE Admins (
AdminID INT PRIMARY KEY,
UserID INT UNIQUE,
Name VARCHAR(100) NOT NULL,
ContactInformation VARCHAR(100),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Products table
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Description TEXT,
Price DECIMAL(10, 2) NOT NULL,
QuantityAvailable INT NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
UserID INT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Subtotal DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Appointments table
CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY,
PatientID INT,
DoctorID INT,
AppointmentDateTime DATETIME,
Status ENUM('Scheduled', 'Completed', 'Canceled') NOT NULL,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Prescriptions table
CREATE TABLE Prescriptions (
PrescriptionID INT PRIMARY KEY,
PatientID INT,
DoctorID INT,
PrescriptionDate DATE,
PrescriptionDetails TEXT,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert data into Users table
INSERT INTO Users (UserID, Username, Password, Email, UserType)
VALUES (1, 'john_doe', 'password123', 'john.doe@email.com', 'Patient'),
       (2, 'jane_doe', 'qwerty', 'jane.doe@email.com', 'Doctor'),
       (3, 'admin', 'admin123', 'admin@email.com', 'Admin'),
       (4, 'alice_smith', 'alice123', 'alice.smith@email.com', 'Patient'),
       (5, 'bob_johnson', 'bob123', 'bob.johnson@email.com', 'Patient'),
       (6, 'michael_brown', 'michael123', 'michael.brown@email.com', 'Patient'),
       (7, 'sarah_lee', 'sarah123', 'sarah.lee@email.com', 'Doctor'),
       (8, 'alex_johnson', 'alex123', 'alex.johnson@email.com', 'Doctor'),
       (9, 'emily_wang', 'emily123', 'emily.wang@email.com', 'Doctor'),
       (10, 'james_smith', 'james123', 'james.smith@email.com', 'Doctor'),
       (11, 'jessica_martinez', 'jessica123', 'jessica.martinez@email.com', 'Doctor'),
       (12, 'admin1', 'admin123', 'admin1@email.com', 'Admin'),
       (13, 'admin2', 'admin123', 'admin2@email.com', 'Admin'),
       (14, 'admin3', 'admin123', 'admin3@email.com', 'Admin'),
       (15, 'admin4', 'admin123', 'admin4@email.com', 'Admin'),
       (16, 'admin5', 'admin123', 'admin5@email.com', 'Admin');

-- Insert data into Patients table
INSERT INTO Patients (PatientID, UserID, Name, Address, ContactInformation)
VALUES (2, 4, 'Alice Smith', '456 Elm St, Anytown USA', '555-987-6543'),
       (3, 5, 'Bob Johnson', '789 Oak St, Anytown USA', '555-111-2222'),
       (4, 1, 'Emily White', '567 Pine St, Anytown USA', '555-222-3333'),
       (5, 6, 'Michael Brown', '890 Maple St, Anytown USA', '555-444-5555');

-- Insert data into Doctors table
INSERT INTO Doctors (DoctorID, UserID, Name, Specialization, ContactInformation)
VALUES (1, 7, 'Dr. Sarah Lee', 'Neurology', '555-123-4567'),
       (2, 8, 'Dr. Alex Johnson', 'Pediatrics', '555-987-6543'),
       (3, 9, 'Dr. Emily Wang', 'Cardiology', '555-111-2222'),
       (4, 10, 'Dr. James Smith', 'Dermatology', '555-222-3333'),
       (5, 11, 'Dr. Jessica Martinez', 'Oncology', '555-444-5555');

-- Insert data into Admins table
INSERT INTO Admins (AdminID, UserID, Name, ContactInformation)
VALUES (1, 12, 'Admin1', '555-555-5555'),
       (2, 13, 'Admin2', '555-666-6666'),
       (3, 14, 'Admin3', '555-777-7777'),
       (4, 15, 'Admin4', '555-888-8888'),
       (5, 16, 'Admin5', '555-999-9999');

-- Insert data into Products table
INSERT INTO Products (ProductID, Name, Description, Price, QuantityAvailable)
VALUES (1, 'Thermometer', 'Digital thermometer', 19.99, 100),
       (2, 'Bandage', 'Adhesive bandage', 4.99, 500),
       (3, 'First Aid Kit', 'First aid kit for home use', 29.99, 100),
       (4, 'Pain Reliever', 'Over-the-counter pain reliever', 9.99, 200),
       (5, 'Antibacterial Soap', 'Soap for killing bacteria', 3.99, 300);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, UserID, OrderDate, TotalAmount)
VALUES (1, 1, '2023-01-01', 34.97),
       (2, 2, '2023-02-15', 19.99),
       (3, 3, '2023-03-20', 45.50),
       (4, 4, '2023-04-05', 12.99),
       (5, 5, '2023-05-10', 87.25);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (1, 1, 1, 1, 19.99),
       (2, 1, 2, 3, 14.97),
       (3, 2, 2, 1, 4.99),
       (4, 3, 3, 2, 59.98),
       (5, 4, 4, 1, 12.99);

-- Insert data into Appointments table
-- Insert data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDateTime, Status)
VALUES (2, 2, 2, '2023-02-15 14:00:00', 'Completed'),
       (3, 3, 3, '2023-03-20 11:30:00', 'Scheduled'),
       (5, 5, 5, '2023-05-10 13:45:00', 'Scheduled');

-- Insert data into Prescriptions table
INSERT INTO Prescriptions (PrescriptionID, PatientID, DoctorID, PrescriptionDate, PrescriptionDetails)
VALUES (1, 1, 1, '2023-01-01', 'Take one pill twice a day for 7 days'),
       (2, 2, 2, '2023-02-15', 'Use as needed for pain relief'),
       (3, 3, 3, '2023-03-20', 'Apply cream to affected area twice daily'),
       (5, 5, 5, '2023-05-10', 'Use as directed on package');

-- Update data in Users table
UPDATE Users
SET Password = 'newpassword123'
WHERE UserID = 1;

-- Update data in Patients table
UPDATE Patients
SET Address = '789 Oak St, Anytown USA'
WHERE PatientID = 1;

-- Update data in Doctors table
UPDATE Doctors
SET Specialization = 'Neurology'
WHERE DoctorID = 1;

-- Update data in Admins table
UPDATE Admins
SET ContactInformation = '555-666-7777'
WHERE AdminID = 1;

-- Update data in Products table
UPDATE Products
SET Price = 24.99
WHERE ProductID = 1;

-- Update data in Orders table
UPDATE Orders
SET TotalAmount = 29.99
WHERE OrderID = 1;

-- Update data in OrderDetails table
UPDATE OrderDetails
SET Quantity = 2
WHERE OrderDetailID = 1;

-- Update data in Appointments table
UPDATE Appointments
SET Status = 'Canceled'
WHERE AppointmentID = 1;

-- Update data in Prescriptions table
UPDATE Prescriptions
SET PrescriptionDetails = 'Take two pills twice a day for 14 days'
WHERE PrescriptionID = 1;


-- Delete data from Users table
DELETE FROM Users
WHERE UserID = 12;

-- Delete data from Patients table
DELETE FROM Patients
WHERE PatientID = 4;

-- Select data from Users table
SELECT * FROM Users;

-- Select data from Patients table
SELECT * FROM Patients;

-- Select data from Doctors table
SELECT * FROM Doctors;

-- Select data from Admins table
SELECT * FROM Admins;

-- Select data from Products table
SELECT * FROM Products;

-- Select data from Orders table
SELECT * FROM Orders;

-- Select data from OrderDetails table
SELECT * FROM OrderDetails;

-- Select data from Appointments table
SELECT * FROM Appointments;

-- Select data from Prescriptions table
SELECT * FROM Prescriptions;

SELECT * FROM Appointments WHERE DATE(AppointmentDateTime) = CURDATE();

SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

SELECT DISTINCT ProductID FROM OrderDetails;

-- Set a savepoint
SAVEPOINT my_savepoint;

-- Create role 'warden'
CREATE ROLE 'warden';

-- Create a new user and assign default role
CREATE USER 'Wardboy'@'localhost' IDENTIFIED BY '1234' DEFAULT ROLE warden;

-- Grant privileges to the new user
GRANT ALL PRIVILEGES ON type.* TO 'warden'@'localhost';

-- Reload all the privileges
FLUSH PRIVILEGES;

-- Start a new transaction
START TRANSACTION;

-- Grant specific privileges to the new user
GRANT ALL PRIVILEGES ON Products.* TO 'Wardboy'@'localhost';

COMMIT;

ROLLBACK;

SAVEPOINT my_savepoint;

UPDATE Products
SET QuantityAvailable = 200
WHERE ProductID = 3;

Set autocommit = off;
-- Rollback to the savepoint 'my_savepoint' if needed
COMMIT;
ROLLBACK;

select * from Products;