# Horizon Hospital Emergency Room Analysis In SQL

This project analyzes patient admission data in Horizon Hospital’s Emergency Room (ER) using SQL Server. The goal is to extract insights about patient demographics, wait times, satisfaction scores, and department efficiency to improve hospital operations.

#  Project Objectives

- Understand Patient Trends: Analyze demographics, admission patterns, and satisfaction levels.
- Optimize Hospital Efficiency: Identify delays and improve resource allocation.
- Improve Patient Experience: Reduce long wait times and improve satisfaction scores.
- Advanced SQL Analytics: Perform ranking, window functions, and complex queries for deeper insights.

The dataset contains the following key columns:

![SCHEMA](https://github.com/user-attachments/assets/2ca2ded4-99b8-40b7-a666-d4ee4148d077)

# SQL Queries & Business Questions

- Basic SQL Questions (1-10)

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
