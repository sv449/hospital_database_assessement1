# Hospital Database Assessment

Student Number: 760084998

## Overview
For this assessment, I built a hospital database in MySQL to store information about hospitals, doctors, patients and prescriptions.
The database structure was designed with an Entity Relationship Diagram (ERD) and pseudocode. I then created the tables, imported the CSV files and wrote six SQL queries to retrieve and update data in the database.

## Database Planning
Before creating the database, I created an Entity Relationship Diagram (ERD) to show the four tables and how they connect.

The database contains:
Hospitals: hospital id, name, address, size, type, accreditation status
Doctors: person id, name, date of birth, address, role, hospital id
Patients: person id, name, date of birth, address, role, doctor id
Prescriptions: prescription id, patient id, doctor id, medication, prescription date

Each hospital can have many doctors and each doctor can be assigned to many patients, The prescription table links each prescription with a patient and doctor who described it. I used primary and foreign keys to link the tables. Pseudocode was written to plan the steps needed to create the database and complete the SQL queries. 
The ERD and pseudocode are available in the database planning folder.

## Creating the Database
Once the four tables were created in MySQL using appropriate data types for each field, I imported the four CSV files in the following order:
- Hospitals: 40 records
- Doctors:100 records
- Patients: 600 records
- Prescriptions: 500 records

I imported the data in this order since the doctors, patients and prescriptions tables rely on records from other tables via foreign keys.
I checked the imported data using SELECT and COUNT(*) statements to confirm that the records had loaded correctly. All four CSV files were imported without warnings.

## SQL Queries
Six queries were written to do the following:
1. Print a list of all doctors based at a particular hospital. 
2. Print a list of all prescriptions for a particular patient, ordered by the prescription date. 
3. Print a list of all prescriptions that a particular doctor has prescribed. 
4. Add a new patient to the database, including being registered with one of the doctors. 
5. Identify which doctor has made the most prescriptions. 
6. Print a list of all doctors at the hospital with biggest size (number of beds).
SQL commands including SELECT, JOIN, INSERT, WHERE, GROUP BY, COUNT and ORDER BY were used to complete the query.

## Results
I checked that the database tables contained the expected records before running the queries. The results of the queries included:
- Patient 312 had four prescriptions, which were displayed in date order.
- Doctor 68 had written seven prescriptions.
- A new patient, Alex Morgan (ID 701), was added and assigned to doctor 68.
- Dr. Taylor Sanchez had written the most prescriptions, with 13 records.
- Peters, Anderson and Baker Hospital had the most beds (494), with four doctors working there.
  
I also ran the saved SQL query file and recorded the outputs in query_results.txt so the results can be reviewed.

## Repository Files
| File name |	Description |
|---|---|
| [database planning/](https://github.com/sv449/hospital_database_assessement1/tree/main/database%20planning)	| ERD and pseudocode in editable and PDF formats |
| [hospital_database.sql](https://github.com/sv449/hospital_database_assessement1/blob/main/sql/hospital_database.sql)| Exported MySQL database, including the tables and records |
| [database_setup.sql](https://github.com/sv449/hospital_database_assessement1/blob/main/sql/database_setup.sql) | Reconstructed SQL script with how the database tables were created and how CVS files were imported.
| [sql/hospital_queries.sql](https://github.com/sv449/hospital_database_assessement1/blob/main/sql/hospital_queries.sql) |	The six SQL queries |
| [sql/query_results.txt](https://github.com/sv449/hospital_database_assessement1/blob/main/sql/query_results.txt) |	Results from running the SQL queries |

## How to Run the Database
The database can be imported into MySQL using:
mysql -u USERNAME -p < sql/hospital_database.sql

The queries can then be run using:
mysql -u USERNAME -p --table < sql/hospital_queries.sql

Replace USERNAME with your MySQL username. 

## Tools used
- MySQL
- Ubuntu Linux
- Git
- GitHub
- PowerPoint
- Word

## Summary
I used Git and GitHub to keep track of my work. I created a public repository and uploaded my ERD and pseudocode to the database planning folder. I also used Git from the Linux terminal to commit and upload my SQL queries, query results and updated database export to the sql folder. The GitHub commit history shows any adjustments I made while working through.
