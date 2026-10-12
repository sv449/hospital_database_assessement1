-- Hospital database setup
-- Reconstructed from the exported database and CSV files
-- This script is for setting up a fresh database

CREATE DATABASE IF NOT EXISTS hospital_database;
USE hospital_database;

-- Create hospitals table
CREATE TABLE hospitals (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    size INT,
    type VARCHAR(50),
    accreditation_status VARCHAR(50)
);

-- Create doctors table
CREATE TABLE doctors (
    person_id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    address VARCHAR(255),
    role VARCHAR(50),
    hospital_id INT,
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

-- Create patients table
CREATE TABLE patients (
    person_id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    address VARCHAR(255),
    role VARCHAR(50),
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(person_id)
);

-- Create prescriptions table
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication VARCHAR(100),
    prescription_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(person_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(person_id)
);

-- Import the supplied CSV files
-- Import hospitals first because other tables depend on it

LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/hospitals.csv'
INTO TABLE hospitals
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/doctors.csv'
INTO TABLE doctors
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/patients.csv'
INTO TABLE patients
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/prescriptions.csv'
INTO TABLE prescriptions
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Check the number of imported records
SELECT COUNT(*) FROM hospitals;
SELECT COUNT(*) FROM doctors;
SELECT COUNT(*) FROM patients;
SELECT COUNT(*) FROM prescriptions;
