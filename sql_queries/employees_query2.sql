-- Get Rows Where DateKey Is Between StartDate And EndDate
-- Count Shows Number Of Employees Active On Each DateKey
-- Grouped By DateKey, StartDate, And EndDate
SELECT dates_data.datekey, employees_data.startdate, employees_data.enddate, COUNT(1)
FROM employees_data
CROSS JOIN dates_data
WHERE dates_data.datekey BETWEEN employees_data.startdate AND employees_data.enddate
GROUP BY dates_data.datekey, employees_data.startdate, employees_data.enddate;


-- Replace Null EndDates With '9999-12-31' For Active Employees
-- Get DateKeys Within StartDate And EndDate Range
-- Includes All Employee Columns
SELECT dates_data.datekey, 
       employees_data.startdate, 
       COALESCE(employees_data.enddate, '9999-12-31') AS edate, 
       employees_data.*
FROM employees_data
CROSS JOIN dates_data
WHERE dates_data.datekey >= employees_data.startdate
  AND (dates_data.datekey <= COALESCE(employees_data.enddate, '9999-12-31'));


-- Group By Month (mnt) Using DateKey
-- Count Entries For Employees Active In Each Month
-- Includes Null EndDates
SELECT strftime('%Y-%m', dates_data.datekey) AS mnt, COUNT(1)
FROM employees_data
CROSS JOIN dates_data
WHERE dates_data.datekey >= employees_data.startdate
  AND (dates_data.datekey <= employees_data.enddate
       OR employees_data.enddate IS NULL)
GROUP BY mnt;

