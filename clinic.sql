CREATE DATABASE ClinicBookingSystem;

USE ClinicBookingSystem;

-- Creating doctors table.
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
-- Inserting value into the doctors table.
INSERT INTO Doctors (full_name, email)
VALUES
('Dr. Susan Omondi', 'susanomondi@clinic.com'),
('Dr. Brian Juma', 'brianjuma@clinic.com'),
('Dr. Cathy Jacobs', 'cathyjacobs@clinic.com'),
('Dr. Anastacia Wanjiku', 'anastaciawanjiku@clinic.com');

-- Creating Patients table.
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL
);

-- Inserting value into Patients table.
INSERT INTO Patients (full_name, email, date_of_birth) VALUES 
('John Wambu', 'jwkam@gmail.com', '1990-04-12'),
('Irene Wairimu', 'irenenimo@gmail.com', '1985-11-05'),
('Joan Chepgetich', 'joanchep@gmail.com', '2001-02-22');

-- Creating Appointments table.
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    notes TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Inserting values to Appointments table.
INSERT INTO Appointments (doctor_id, patient_id, appointment_date, notes) VALUES 
(1, 1, '2025-05-01 09:30:00', 'Full check-up'),
(2, 2, '2025-05-02 10:00:00', 'Follow-up on skin rash'),
(3, 3, '2025-05-03 14:00:00', 'Dental cleaning');

-- Creating Prescriptions table.
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication VARCHAR(100) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Inserting values into Prescriptions
INSERT INTO Prescriptions (appointment_id, medication, dosage, instructions) VALUES 
(1, 'Paracetamol', '500mg', 'Take one tablet every 6 hours after meals.'),
(2, 'Hydrocortisone cream', 'Apply twice daily', 'Apply thinly on affected area.'),
(3, 'Ibuprofen', '200mg', 'Take one tablet every 8 hours as needed.');
