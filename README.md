# Horizon Hospital Emergency Room Analysis In SQL

This project analyzes patient admission data in Horizon Hospital’s Emergency Room (ER) using SQL Server. The goal is to extract insights about patient demographics, wait times, satisfaction scores, and department efficiency to improve hospital operations.

#  Project Objectives

  - Improve Patient Care: Identify areas where patient experience can be enhanced by analyzing satisfaction scores, wait times, and readmission rates.
  - Optimize Resource Allocation: Understand departmental workload and peak hours to allocate resources more effectively.
  - Enhance Operational Efficiency: Detect inefficiencies such as long wait times, unusual spikes in admissions, and high referral rates to streamline processes. Support Data-Driven 
  - Decision Making: Provide stakeholders with actionable insights to guide strategic planning and operational improvements.

The dataset contains the following key columns:

![SCHEMA](https://github.com/user-attachments/assets/2ca2ded4-99b8-40b7-a666-d4ee4148d077)

# SQL Queries & Business Questions

   1️⃣ Retrieve all records from the Horizon_Hospital table.

      SELECT * FROM Horizon_Hospital;
  
   2️⃣ List all distinct patient genders.

      SELECT DISTINCT Patient_Gender FROM Horizon_Hospital;

   3️⃣ Find all patients who are older than 50 years.

      SELECT * FROM Horizon_Hospital WHERE Patient_Age > 50;
  
   4️⃣ Retrieve patient names and their respective admission dates.

      SELECT Patient_First_Inital, Patient_Last_Name, Patient_Admission_Date 
      FROM Horizon_Hospital;

   5️⃣ Find the total number of admitted patients.

      SELECT COUNT(*) AS Total_Patients FROM Horizon_Hospital;

   6️⃣ List all patients referred to the ‘Cardiology’ department.

      SELECT * FROM Horizon_Hospital WHERE Department_Referral = 'Cardiology';

   7️⃣ Retrieve the names of all female patients.

      SELECT Patient_First_Inital, Patient_Last_Name FROM Horizon_Hospital 
      WHERE Patient_Gender = 'Female';

  8️⃣ Sort patients by admission date in descending order.

      SELECT * FROM Horizon_Hospital ORDER BY Patient_Admission_Date DESC;

  9️⃣ Get the names of all patients whose last names start with ‘S’.

      SELECT * FROM Horizon_Hospital WHERE Patient_Last_Name LIKE 'S%';

  🔟 Find patients who have a satisfaction score above 8.

      SELECT * FROM Horizon_Hospital WHERE Patient_Satisfaction_Score > 8;

  1️⃣1️⃣ Find the average wait time of all patients.

      SELECT AVG(Patient_Waittime) AS Avg_Wait_Time FROM Horizon_Hospital;

  1️⃣2️⃣ Retrieve the number of patients in each department.

     SELECT Department_Referral, COUNT(*) AS Patient_Count 
     FROM Horizon_Hospital 
     GROUP BY Department_Referral;

  1️⃣3️⃣ Find departments with more than 10 patients admitted.

    SELECT Department_Referral, COUNT(*) AS Total_Patients 
    FROM Horizon_Hospital 
    GROUP BY Department_Referral 
    HAVING COUNT(*) > 10;
    
1️⃣4️⃣ List the top 5 youngest patients admitted.

    SELECT * FROM Horizon_Hospital ORDER BY Patient_Age ASC LIMIT 5;

1️⃣5️⃣ Find the total number of male and female patients.

    SELECT Patient_Gender, COUNT(*) AS Total FROM Horizon_Hospital GROUP BY Patient_Gender;

1️⃣6️⃣ Find all patients who were admitted in the last 6 months.

    SELECT * FROM Horizon_Hospital 
    WHERE Patient_Admission_Date >= DATEADD(MONTH, -6, GETDATE());

1️⃣7️⃣ Retrieve patient names along with their full names (concatenating first and last names).

    SELECT CONCAT(Patient_First_Inital, ' ', Patient_Last_Name) AS Full_Name 
    FROM Horizon_Hospital;
    
1️⃣8️⃣ Find the patient with the longest wait time.

    SELECT TOP 1 * FROM Horizon_Hospital ORDER BY Patient_Waittime DESC;

1️⃣9️⃣ List all patients admitted on a Monday.

    SELECT * FROM Horizon_Hospital WHERE DATENAME(WEEKDAY, Patient_Admission_Date) = 'Monday';

2️⃣0️⃣ Find all patients who have not been admitted yet (Null Admission Date).

    SELECT * FROM Horizon_Hospital WHERE Patient_Admission_Date IS NULL;

2️⃣1️⃣ Find the second most common patient race.

    SELECT TOP 1 Patient_Race FROM (
    SELECT Patient_Race, RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk 
    FROM Horizon_Hospital 
    GROUP BY Patient_Race
    ) AS RankedRaces WHERE rnk = 2;

2️⃣2️⃣ Calculate the time difference (in hours) between admission and discharge for each patient.

    SELECT Patient_Id, 
    DATEDIFF(HOUR, Patient_Admission_Date, Discharge_Date) AS Hours_In_Hospital 
    FROM Horizon_Hospital;

2️⃣3️⃣ Get the total number of patients admitted per month.

    SELECT MONTH(Patient_Admission_Date) AS Month, COUNT(*) AS Total_Admissions 
    FROM Horizon_Hospital 
    GROUP BY MONTH(Patient_Admission_Date);
    
2️⃣4️⃣ Find the average satisfaction score per department.

    SELECT Department_Referral, AVG(Patient_Satisfaction_Score) AS Avg_Satisfaction 
    FROM Horizon_Hospital 
    GROUP BY Department_Referral;
    
2️⃣5️⃣ Get the rank of each patient based on wait time within their department.

    SELECT Patient_Id, Department_Referral, Patient_Waittime, 
    RANK() OVER (PARTITION BY Department_Referral ORDER BY Patient_Waittime DESC) AS Rank 
    FROM Horizon_Hospital;
    
2️⃣6️⃣ Find the department with the longest average wait time.

    SELECT TOP 1 Department_Referral 
    FROM Horizon_Hospital 
    GROUP BY Department_Referral 
    ORDER BY AVG(Patient_Waittime) DESC;
    
2️⃣7️⃣ Retrieve patients who waited more than the average wait time.

    SELECT * FROM Horizon_Hospital 
    WHERE Patient_Waittime > (SELECT AVG(Patient_Waittime) FROM Horizon_Hospital);
    
2️⃣8️⃣ Find the total number of admitted patients per week.

    SELECT DATEPART(WEEK, Patient_Admission_Date) AS Week_Number, COUNT(*) AS Total_Admissions 
    FROM Horizon_Hospital 
    GROUP BY DATEPART(WEEK, Patient_Admission_Date);

2️⃣9️⃣ Identify the top 3 departments with the highest patient satisfaction scores.

    SELECT TOP 3 Department_Referral, AVG(Patient_Satisfaction_Score) AS Avg_Satisfaction 
    FROM Horizon_Hospital 
    GROUP BY Department_Referral 
    ORDER BY Avg_Satisfaction DESC;
    
3️⃣0️⃣ Find the total number of patients admitted this year compared to the previous year.

    SELECT YEAR(Patient_Admission_Date) AS Year, COUNT(*) AS Total_Admissions 
    FROM Horizon_Hospital 
    WHERE YEAR(Patient_Admission_Date) >= YEAR(GETDATE()) - 1 
    GROUP BY YEAR(Patient_Admission_Date);


