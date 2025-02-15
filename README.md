# Prisoner Management System

## Overview
The **Prisoner Management System** is a robust database-driven system designed to manage and track prisoners, staff, incidents, and various prison-related operations efficiently. It ensures proper record-keeping, security, and rehabilitation tracking within a correctional facility.

## Features
- **Comprehensive Prisoner Records**: Store detailed information about prisoners, including their crimes, medical records, disciplinary actions, and rehabilitation programs.
- **Staff and Duty Management**: Assign and track staff responsibilities, including guard duty schedules and incident reporting.
- **Visitor and Parole Tracking**: Manage visitor logs, parole hearings, and prisoner transfers.
- **Security and Incident Monitoring**: Log security incidents and disciplinary actions to maintain order within the prison.
- **Work and Education Programs**: Track prisoners' work assignments and participation in rehabilitation programs.

## Entity-Relationship Model
The system follows a structured relational database design with key relationships between entities:

- **Prisoner ↔ CrimeRecord** (One-to-Many)
- **Prisoner ↔ DisciplinaryActions** (One-to-Many)
- **Prisoner ↔ WorkAssignment** (One-to-Many)
- **Prisoner ↔ Parole** (One-to-One)
- **Prisoner ↔ Cell** (Many-to-One)
- **Prisoner ↔ EducationRehabilitation** (One-to-Many)
- **Prisoner ↔ Visitor** (One-to-Many)
- **Prisoner ↔ MedicalRecord** (One-to-Many)
- **Staff ↔ IncidentReport** (One-to-Many)

## Database Schema
### Prisoner
- `prisoner_id` (Primary Key)
- `first_name`
- `last_name`
- `gender`
- `date_of_birth`
- `date_of_release`
- `crime_committed`
- `status`
- `cell_id` (Foreign Key)
- `nationality`

### Cell
- `cell_id` (Primary Key)
- `cell_number`
- `capacity`
- `cell_occupancy`
- `block_number`
- `security_level`

### CrimeRecord
- `crime_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `crime_description`
- `crime_date`
- `location`
- `severity`

### MedicalRecord
- `medical_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `diagnosis`
- `treatment`
- `date_of_examination`
- `doctor_id`

### Parole
- `parole_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `parole_date`
- `parole_status`

### IncidentReport
- `report_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `staff_id` (Foreign Key)
- `incident_description`
- `incident_date`

### Visitor
- `visitor_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `first_name`
- `last_name`
- `relationship`
- `visit_date`
- `visit_time`
- `contact_number`

### DisciplinaryActions
- `action_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `action_taken`
- `action_date`
- `severity`
- `staff_id` (Foreign Key)

### WorkAssignment
- `assignment_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `task_description`
- `start_date`
- `end_date`
- `status`

### EducationRehabilitation
- `program_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `program_name`
- `start_date`
- `end_date`
- `completion_status`

### VisitLog
- `log_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `visitor_id` (Foreign Key)
- `visit_date`
- `visit_time`
- `remarks`

### GuardDutySchedule
- `duty_id` (Primary Key)
- `staff_id` (Foreign Key)
- `shift_start`
- `shift_end`
- `duty_date`
- `location`

### Staff
- `staff_id` (Primary Key)
- `first_name`
- `last_name`
- `gender`
- `date_of_birth`
- `role`
- `salary`
- `hire_date`
- `shift`

### PrisonerTransfer
- `transfer_id` (Primary Key)
- `prisoner_id` (Foreign Key)
- `from_cell_id` (Foreign Key)
- `to_cell_id` (Foreign Key)
- `transfer_date`
- `reason`

### SecurityIncident
- `incident_id` (Primary Key)
- `incident_date`
- `location`
- `description`
- `severity`
- `staff_id` (Foreign Key)

## Getting Started
### Prerequisites
- **Database Management System**: MySQL / PostgreSQL
- **Backend Framework**: Node.js / Java Spring Boot / Django (depending on implementation preference)
- **Frontend Framework**: React / Angular / Vue.js (optional for UI management)

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/PrisonerManagementSystem.git
   ```
2. Navigate to the project directory:
   ```sh
   cd PrisonerManagementSystem
   ```
3. Set up the database schema using the provided SQL scripts.
4. Configure backend and frontend dependencies.
5. Run the application.

## Usage
- **Admin Dashboard**: Manage prisoners, staff, and security records.
- **Visitor Management**: Log and track prisoner visits.
- **Incident Reporting**: Report and track security incidents.
- **Rehabilitation Programs**: Monitor prisoner education and work assignments.

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch`
3. Commit changes: `git commit -m 'Add new feature'`
4. Push to the branch: `git push origin feature-branch`
5. Open a pull request.

## Credits
Created by Shashank Singh[@shashankexore](https://github.com/shashankexore) and Anushka Banerjee [@anushka369](https://github.com/anushka369).
