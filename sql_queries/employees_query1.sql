-- Display All Data From The Employees Table
SELECT * 
FROM employees_data;

-- Count Employees Starting By Month And Year
SELECT 
    strftime('%m', e.startdate) AS month, 
    strftime('%Y', e.startdate) AS year, 
    COUNT(1)
FROM employees_data AS e
GROUP BY year, month
ORDER BY year, month;

-- Find The Earliest And Latest Start Dates
SELECT MIN(startdate), MAX(startdate)
FROM employees_data;

-- Count Employees Active On A Specific Date (2008-07-01)
SELECT COUNT(1)
FROM employees_data AS e
WHERE e.startdate <= '2008-07-01'
  AND (e.enddate >= '2008-07-01'
       OR e.enddate IS NULL);
