
create database HR_Analytics;

set global local_infile=1;
show global variables like'local_infile';
select version ();
use hr_analytics;
select count(age) from hr_data;
create table HR_DATA (EmployeeNumber INT primary key,
   Age INT,
  Age_Bins VARCHAR(255),
  Attrition VARCHAR(255),
  NoOfAttrition INT,
  BusinessTravel VARCHAR(255),
  DailyRate INT,
  Department VARCHAR(255),
  DistanceFromHome INT,
  DistanceFromHomeBins VARCHAR(255), DistanceBinIndex int,
  Education INT,
  EducationField VARCHAR(255),
  EmployeeCount INT,
  EnvironmentSatisfaction INT,
  EnvironmentSatisfactionLowHigh VARCHAR(255),
  Gender VARCHAR(255),
  HourlyRate INT,
  JobInvolvement INT,
  JobInvolvementLowHigh VARCHAR(255),
  JobLevel INT,
  JobRole VARCHAR(255),
  JobSatisfaction INT,
  JobSatisfactionLowHigh VARCHAR(255),
  MaritalStatus VARCHAR(255),
  MonthlyIncome INT,
  MonthlyIncomeBins VARCHAR(25),
  MonthlyIncomeIndex int,
  NoOfEmpCountBySalaryBin INT,
  MonthlyRate INT,
  NumCompaniesWorked INT,
  Over18 VARCHAR(255),
  OverTime VARCHAR(255),
  PercentSalaryHike INT,
  PerformanceRating INT,
  PerformanceRatingLowHigh VARCHAR(255),
  RelationshipSatisfaction INT,
  RelationshipSatisfactionLowHigh VARCHAR(255),
  StandardHours INT,
  StockOptionLevel INT,
  TotalWorkingYears INT,
  TrainingTimesLastYear INT,
  WorkLifeBalance INT,
  WorkLifeBalanceLowHigh VARCHAR(255),
  YearsAtCompany INT,
  YearsInCurrentRole INT,
  YearsSinceLastPromotion INT,
 YearsWithCurrManager INT
);
drop database hr_analytics;
drop table HR_DATA;
Select*from HR_DATA;
describe hr_data;

Load data local infile 'C:\\Users\\rupal\\OneDrive\\Desktop\\DA Project_1\\Book1.masterdata.csv' into table HR_DATA
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;


select count(employeecount) from HR_DATA;


## KPI-1 ##############
Select Department, count(Employeecount) as Total_Employee,
sum(NoOfAttrition) as Total_Attrition,
Round((sum(NoOfAttrition)/count(Employeecount))*100,2) as per_Attrition_in_the_cluster,
Round((sum(NoOfAttrition)/(select sum(NoOfAttrition) from HR_DATA) )*100,2) as per_of_total_Attrition
from HR_DATA group by Department  order by Total_Employee  desc;

## KPI-2 ##############
select Department,JobRole,avg(hourlyrate) as Avg_HourlyRate  from HR_data where jobrole = "Research Scientist" and Gender = "Male" 
             group by Department order by Avg_HourlyRate desc;
             
select avg(hourlyrate)  from HR_data where jobrole = "Research Scientist" and Gender = "Male";

## KPI-3 ##############
select MonthlyIncomeBins, count(EmployeeCount) as total_emp, 
sum(NoOfAttrition) as Total_Attrition,
Round((sum(NoOfAttrition)/count(Employeecount))*100,2) as per_Attrition_in_the_cluster,
Round((sum(NoOfAttrition)/(select sum(NoOfAttrition) from HR_DATA) )*100,2) as per_of_total_Attrition
from HR_DATA group by MonthlyIncomeBins,Monthlyincomeindex  order by Monthlyincomeindex  asc;
## KPI-4 ##############
select  department, Round(avg(TotalWorkingYears),3) as Avg_working_years from HR_data group by department ;

## KPI-5 ##############
select JobRole, Round(avg(WorkLifeBalance),2) as Avg_WorkLifeBalance from HR_data group by JobRole;

## KPI-6 ##############
select PromotionBin, count(EmployeeCount) as total_emp, 
sum(NoOfAttrition) as Total_Attrition,
Round((sum(NoOfAttrition)/count(Employeecount))*100,2) as per_Attrition_in_the_cluster,
Round((sum(NoOfAttrition)/(select sum(NoOfAttrition) from HR_DATA) )*100,2) as per_of_total_Attrition
from HR_DATA group by promotionBin order by promotionBin asc;
        
select department,avg(YearsSincelastpromotion) from HR_DATA group by department;
        
        
        
        
        
    














