-- Insert sample data into Cell
INSERT INTO Cell (cell_number, capacity, block_number)
VALUES
('A101', 4, 'A'),
('B202', 6, 'B'),
('C303', 2, 'C');

-- Insert sample data into Prisoner
INSERT INTO Prisoner (first_name, last_name, gender, date_of_birth, date_of_incarceration, crime_committed, status, cell_id)
VALUES
('John', 'Doe', 'Male', '1985-05-15', '2020-01-01', 'Robbery', 'Incarcerated', 1),
('Jane', 'Smith', 'Female', '1990-08-25', '2019-03-15', 'Fraud', 'Incarcerated', 2),
('Mike', 'Johnson', 'Male', '1978-12-10', '2021-07-20', 'Assault', 'Paroled', 3);

-- Insert sample data into Staff
INSERT INTO Staff (first_name, last_name, gender, date_of_birth, role, salary, hire_date)
VALUES
('Alice', 'Brown', 'Female', '1980-04-12', 'Warden', 75000.00, '2010-06-01'),
('Bob', 'White', 'Male', '1985-11-30', 'Guard', 45000.00, '2015-09-15'),
('Charlie', 'Green', 'Male', '1992-07-22', 'Doctor', 60000.00, '2018-03-10');

-- Insert sample data into Visitor
INSERT INTO Visitor (prisoner_id, first_name, last_name, relationship, visit_date, visit_time)
VALUES
(1, 'Mary', 'Doe', 'Family', '2023-10-01', '14:00:00'),
(2, 'Tom', 'Smith', 'Friend', '2023-10-02', '10:30:00');
-- Insert sample data into Parole
INSERT INTO Parole (prisoner_id, parole_date, parole_status)
VALUES
(3, '2023-12-01', 'Approved');

-- Insert sample data into MedicalRecord
INSERT INTO MedicalRecord (prisoner_id, diagnosis, treatment, date_of_examination, doctor_id)
VALUES
(1, 'High Blood Pressure', 'Prescribed medication', '2023-09-15', 3),
(2, 'Fractured Arm', 'Cast applied', '2023-09-20', 3);
