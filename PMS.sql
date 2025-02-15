-- Create Cell Table
CREATE TABLE Cell
(
cell_id INT AUTO_INCREMENT PRIMARY KEY,
cell_number VARCHAR(10) NOT NULL UNIQUE,
capacity INT NOT NULL,
current_occupancy INT DEFAULT 0,
block_number VARCHAR(10) NOT NULL
);

-- Create Prisoner Table
CREATE TABLE Prisoner
(
prisoner_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('Male', 'Female', 'Other') NOT NULL,
date_of_birth DATE NOT NULL,
date_of_incarceration DATE NOT NULL,
date_of_release DATE,
crime_committed TEXT NOT NULL,
status ENUM('Incarcerated', 'Released', 'Paroled') NOT NULL,
cell_id INT,
FOREIGN KEY (cell_id) REFERENCES Cell(cell_id)
);

-- Create CrimeRecord Table
CREATE TABLE CrimeRecord
(
crime_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
crime_description TEXT NOT NULL,
crime_date DATE NOT NULL,
location VARCHAR(100),
severity ENUM('Low', 'Medium', 'High') NOT NULL,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id)
);

-- Create Visitor Table
CREATE TABLE Visitor
(
visitor_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,

first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
relationship VARCHAR(50) NOT NULL,
visit_date DATE NOT NULL,
visit_time TIME NOT NULL,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id)
);

-- Create VisitLog table
CREATE TABLE VisitLog
(
log_id INT AUTO_INCREMENT PRIMARY KEY,
visitor_id INT,
prisoner_id INT,
visit_date DATE NOT NULL,
visit_time TIME NOT NULL,
remarks TEXT,
FOREIGN KEY (visitor_id) REFERENCES Visitor(visitor_id),
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id)
);

-- Create Staff Table
CREATE TABLE Staff
(
staff_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('Male', 'Female', 'Other') NOT NULL,
date_of_birth DATE NOT NULL,
role VARCHAR(50) NOT NULL,
salary DECIMAL(10, 2) NOT NULL,
hire_date DATE NOT NULL
);

-- Create GuardDutySchedule table
CREATE TABLE GuardDutySchedule
(
duty_id INT AUTO_INCREMENT PRIMARY KEY,
staff_id INT,
shift_start TIME NOT NULL,
shift_end TIME NOT NULL,
duty_date DATE NOT NULL,
location VARCHAR(50) NOT NULL,
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Create Parole Table
CREATE TABLE Parole
(
parole_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
parole_date DATE NOT NULL,
parole_status ENUM('Approved', 'Denied', 'Pending') NOT NULL,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id)
);

-- Create IncidentReport table
CREATE TABLE IncidentReport
(
report_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
staff_id INT,
incident_description TEXT NOT NULL,
incident_date DATE NOT NULL,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id),
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Create MedicalRecord Table
CREATE TABLE MedicalRecord
(
medical_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
diagnosis TEXT NOT NULL,
treatment TEXT NOT NULL,
date_of_examination DATE NOT NULL,
doctor_id INT,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id),
FOREIGN KEY (doctor_id) REFERENCES Staff(staff_id)
);

-- Create WorkAssignment table
CREATE TABLE WorkAssignment
(
assignment_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
task_description TEXT NOT NULL,
start_date DATE NOT NULL,
end_date DATE,
status ENUM('Ongoing', 'Completed') NOT NULL DEFAULT 'Ongoing',
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id)
);

-- Create RehabilitationProgram table
CREATE TABLE RehabilitationProgram
(
program_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
program_name VARCHAR(100) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
status ENUM('Enrolled', 'Completed', 'Dropped') NOT NULL DEFAULT 'Enrolled',
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id)
);

-- Create DisciplinaryAction table
CREATE TABLE DisciplinaryAction
(
action_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
action_taken TEXT NOT NULL,
action_date DATE NOT NULL,
severity ENUM('Warning', 'Medium', 'Severe') NOT NULL,
staff_id INT,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id),
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Create SecurityIncident table
CREATE TABLE SecurityIncident
(
incident_id INT AUTO_INCREMENT PRIMARY KEY,
incident_date DATE NOT NULL,
location VARCHAR(50) NOT NULL,
description TEXT NOT NULL,
severity ENUM('Low', 'Medium', 'High') NOT NULL,
staff_id INT,
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Create PrisonerTransfer table
CREATE TABLE PrisonerTransfer
(
transfer_id INT AUTO_INCREMENT PRIMARY KEY,
prisoner_id INT,
from_cell_id INT,
to_cell_id INT,
transfer_date DATE NOT NULL,
reason TEXT,
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id),
FOREIGN KEY (from_cell_id) REFERENCES Cell(cell_id),
FOREIGN KEY (to_cell_id) REFERENCES Cell(cell_id)
);
