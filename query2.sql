WITH hires AS (
    SELECT
        departments.id,
        departments.department,
        COUNT(employees.id) AS hired_employees
    FROM employees
    JOIN departments ON employees.department_id = departments.id
    WHERE strftime('%Y', employees.datetime) = '2021'
    GROUP BY departments.id, departments.department
),
hires_mean AS (
    SELECT AVG(hired_employees) AS mean_hired_employees
    FROM hires
)
SELECT
    hires.id,
    hires.department,
    hires.hired_employees
FROM hires
JOIN hires_mean
ON hires.hired_employees > hires_mean.mean_hired_employees
ORDER BY hires.hired_employees DESC