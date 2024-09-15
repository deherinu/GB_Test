SELECT
        departments.department,
        jobs.job,
        SUM(CASE WHEN strftime('%m', employees.datetime) BETWEEN '01' AND '03' THEN 1 ELSE 0 END) AS Q1,
        SUM(CASE WHEN strftime('%m', employees.datetime) BETWEEN '04' AND '06' THEN 1 ELSE 0 END) AS Q2,
        SUM(CASE WHEN strftime('%m', employees.datetime) BETWEEN '07' AND '09' THEN 1 ELSE 0 END) AS Q3,
        SUM(CASE WHEN strftime('%m', employees.datetime) BETWEEN '10' AND '12' THEN 1 ELSE 0 END) AS Q4
FROM employees
JOIN departments 
        ON employees.department_id = departments.id
JOIN jobs 
        ON employees.job_id = jobs.id
GROUP BY departments.department, jobs.job
ORDER BY departments.department, jobs.job