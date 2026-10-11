-- Hospital database assessment
USE hospital_database;

-- Query 1: Doctors at hospital 1
SELECT doctors.name, hospitals.name
FROM doctors
JOIN hospitals
ON doctors.hospital_id = hospitals.hospital_id
WHERE hospitals.hospital_id = 1;

-- Query 2: Prescriptions for patient 312, ordered by date
SELECT prescriptions.prescription_id, patients.name,
prescriptions.medication, prescriptions.prescription_date
FROM prescriptions
JOIN patients
ON prescriptions.patient_id = patients.person_id
WHERE prescriptions.patient_id = 312
ORDER BY prescriptions.prescription_date;

-- Query 3: Prescriptions written by doctor 68
SELECT prescriptions.prescription_id, doctors.name,
prescriptions.medication, prescriptions.prescription_date
FROM prescriptions
JOIN doctors
ON prescriptions.doctor_id = doctors.person_id
WHERE prescriptions.doctor_id = 68;

-- Query 4: Add a new patient and assign a doctor
-- Patient 701 was already added during testing
-- Only insert if the patient does not exist
INSERT INTO patients
(person_id, name, date_of_birth, address, role, doctor_id)
SELECT 701, 'Alex Morgan', '1995-06-15',
'12 Example Street', 'Patient', 68
WHERE NOT EXISTS (
    SELECT 1 FROM patients WHERE person_id = 701
);

SELECT *
FROM patients
WHERE person_id = 701;

-- Query 5: Doctor with the most prescriptions
SELECT doctors.name, COUNT(*)
FROM prescriptions
JOIN doctors
ON prescriptions.doctor_id = doctors.person_id
GROUP BY doctors.person_id, doctors.name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Query 6: Doctors at the hospital with the most beds
SELECT doctors.name, hospitals.name, hospitals.size
FROM doctors
JOIN hospitals
ON doctors.hospital_id = hospitals.hospital_id
WHERE hospitals.hospital_id = (
    SELECT hospital_id
    FROM hospitals
    ORDER BY size DESC
    LIMIT 1
);
