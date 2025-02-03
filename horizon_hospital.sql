create database horizon_hospital

select * from horizon_hospital

select year(patient_admission_date)
from horizon_hospital

--- Basic SQL Questions (1-10) 

-- 1 . Retrieve all records from the Horizon_Hospital table.

SELECT * FROM Horizon_Hospital;

-- 2. List all distinct patient genders.

SELECT DISTINCT Patient_Gender FROM Horizon_Hospital;

-- 3. Find all patients who are older than 50 years.

SELECT * FROM Horizon_Hospital WHERE Patient_Age > 50;

-- 4. Retrieve patient names and their respective admission dates.

SELECT 
concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name ,  
cast(Patient_Admission_Date as date ) as Admission_Date
FROM Horizon_Hospital;

-- 5. Find the total number of admitted patients.

SELECT COUNT(*) AS Total_Patients FROM Horizon_Hospital;

-- 6.  List all patients referred to the ‘physiotherapy’ department.

select * 
from horizon_hospital
where Department_Referral = 'physiotherapy'

-- 7. Retrieve the names of all female patients.

SELECT 
concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name 
from horizon_hospital
where Patient_Gender = 'Female'

-- 8. Sort patients by admission date in descending order.

select *  
from horizon_hospital
order by Patient_Admission_Date desc

-- 9.  Get the names of all patients whose last names start with ‘S’. 

select 
concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name 
from horizon_hospital
where Patient_Last_Name like 's%'

-- 10. Find patients who have a satisfaction score above 8.

select 
concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name 
from horizon_hospital
WHERE Patient_Satisfaction_Score < 5;

---- Intermediate SQL Questions (11-20)

-- These questions involve JOIN, GROUP BY, HAVING, and subqueries.

-- 1.1. Find the average wait time of all patients.

select avg(patient_waittime) as Avg_Waittime  
from horizon_hospital

-- 1.2 Retrieve the number of patients in each department.

select * from horizon_hospital

select Department_Referral, count(*) as Total_depat
from horizon_hospital
group by department_referral

-- 1.3 List the top 5 youngest patients admitted whose age is between 15 to 25 

select top 5 concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name , Patient_Age
from horizon_hospital
where patient_age between '25' and '55'
order by Patient_Age asc 

-- 1.4 Find departments with more than 10 patients admitted.

select Department_Referral, count(*) as Total_depat
from horizon_hospital
group by department_referral
having  count(*) > 10

-- 1.5  Find the total number of male and female patients.

select Patient_Gender AS Gender , count(*) as Total_Patient 
from horizon_hospital
group by Patient_Gender


-- 1.6 Find all patients who were admitted in the last 6 months.

select concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name 
from horizon_hospital
where Patient_Admission_Date >= DATEADD(month,-6,GETDATE())

-- 1.7 Find the patient with the longest wait time.

select top 1  
       concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name ,  
	   concat(Patient_Waittime , ' ' , 'Mins') as Waiting_Time 

from horizon_hospital
order by Patient_Waittime desc 

-- 1.8 List all patients admitted on a Monday.

select 
      concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name 

from horizon_hospital
where datename(weekday,Patient_Admission_Date) = 'Monday'

-- 20 Find all patients whose patient satisfication score is null . 

select * 
from horizon_hospital
where Patient_Satisfaction_Score is null ; 

-- 2.1 Find the second most common patient race. 

select * from horizon_hospital

SELECT Patient_Race, RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk 
FROM Horizon_Hospital 
GROUP BY Patient_Race

SELECT TOP 1 Patient_Race FROM (
    SELECT Patient_Race, RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk 
    FROM Horizon_Hospital 
    GROUP BY Patient_Race
) AS RankedRaces WHERE rnk = 2;

-- 2.2  Get the total number of patients admitted per month.

select patient_id , datename(month,patient_admission_date) as Admission_Month , count(*) as Total_patients 
from horizon_hospital
group by patient_id , datename(month,patient_admission_date)

-- 2.3 Find the average satisfaction score per department.

select department_referral , avg(Patient_Satisfaction_Score) as Avg_satif_rating 
from horizon_hospital
group by Department_Referral

-- 2.4 Get the rank of each patient based on wait time within their department.

SELECT Patient_Id, Department_Referral, Patient_Waittime, 
       rank() over ( partition by department_referral order by patient_waittime desc ) AS Rank
FROM Horizon_Hospital;

-- 2.6 Find the department with the longest average wait time.

select department_referral 
from horizon_hospital
group by Department_Referral
order by avg(Patient_Waittime) desc 

-- 2.7 Retrieve patients who waited more than the average wait time

select concat(Patient_First_Inital, ' ' ,  Patient_Last_Name) as Patient_Full_Name 
from horizon_hospital
where Patient_Waittime > ( select avg(patient_waittime) from horizon_hospital)

-- 2.8 Find the total number of admitted patients per week.

select count(*) as Total_patients , datepart(week,patient_admission_date) AS Week_Number
from horizon_hospital
group by datepart(week,patient_admission_date)

-- 2.9  Identify the top 3 departments with the highest patient satisfaction scores.

select top 3  department_referral , avg(Patient_Satisfaction_Score) as Avg_Satisfaction
from horizon_hospital
group by Department_Referral
ORDER BY Avg_Satisfaction DESC; 

-- 3.0 Find the total number of patients admitted this year compared to the previous year.

select year(patient_admission_date) as admission_year , count(patient_id) as total_patients 
from horizon_hospital
where  year(patient_admission_date) >= year(getdate()) -1 
group by year(patient_admission_date)