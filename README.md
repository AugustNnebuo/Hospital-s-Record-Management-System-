# Hospital Management System

The Hospital Management System is designed to centralize and streamline the management of patient data, hospital operations, and healthcare services. By moving away from fragmented records and manual processes, the hospital aims to consolidate all relevant information into a single, efficient database. This transition enhances data accuracy, reduces administrative burdens, and improves overall operational efficiency.

## Primary Objective:
The primary goal of this database design is to create a structured and relational model that effectively manages patient records, staff details, room assignments, and medical procedures. It supports various hospital functions, including patient care management, staff scheduling, and room allocation. The system ensures data integrity, reduces duplication, and enables comprehensive data analysis, which is crucial for delivering high-quality patient care and making informed decisions.


### Summary of Reporting Queries:

Fetch Patients with the Same Age:
Retrieves a list of patients who share the same age, helping identify age-related trends or clusters in the patient population.

Find the Second Oldest Patient and Their Doctor and Department:
Identifies the second oldest patient and provides details about their assigned doctor and department, useful for understanding age distribution and care requirements.

Get the Maximum Age per Department and the Patient Name:
Finds the oldest patient in each department, including their name, to assess the age demographics across different departments.

Doctor-Wise Count of Patients Sorted by Count in Descending Order:
Provides a count of patients assigned to each doctor, sorted by the number of patients, which helps evaluate doctor workload and patient distribution.

Fetch Only the First Name from the PatientName and Append the Age:
Extracts and formats patient first names along with their age, useful for simplified reporting and identification.

Fetch Patients with Odd Ages:
Retrieves patients whose ages are odd numbers, useful for specific age-related analyses or studies.

Create a View to Fetch Patient Details with an Age Greater than 50:
Creates a view that displays details of patients older than 50, facilitating targeted analysis and reporting.

Create a Procedure to Update the Patient's Age by 10% Where the Department is 'Cardiology' and the Doctor is Not 'Dr. Smith':
Develops a stored procedure to adjust the ages of patients in the Cardiology department, excluding those under Dr. Smith’s care, for updated records and accurate reporting.

Create a Stored Procedure to Fetch Patient Details Along with Their Doctor, Department, and State, Including Error Handling:
Develops a comprehensive stored procedure that retrieves detailed patient information, including their doctor, department, and state, with built-in error handling to ensure robust data retrieval.


### Impact on Business Processes:

Enhanced Patient Care:
By consolidating patient records and managing healthcare services efficiently, the system supports better patient care and treatment continuity.

Operational Efficiency:
The streamlined management of patient data, room assignments, and staff schedules reduces administrative overhead and improves overall hospital operations.

Resource Management:
Analyzing room occupancy, staff workload, and medical procedures helps in effective resource planning and utilization, ensuring optimal service delivery.

Data-Driven Decision Making:
Comprehensive reporting and data analysis enable informed decisions regarding patient care, staff management, and hospital resource allocation.

Error Reduction:
The integrated system reduces the likelihood of errors in patient records and administrative processes, enhancing the accuracy and reliability of hospital operations.
