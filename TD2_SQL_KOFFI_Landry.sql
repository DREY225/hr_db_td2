									-- TD SQL n°2--

                            -- KOFFI Kouadio Landry Régis --
                                -- MDBFA 2 IT-FINANCE --
SHOW DATABASES;
USE hr_db;

/* 1) Affichons le nom de l’employé, le prénom, le titre du poste et 
le département des employés du département (Administration, marketing et Achat)*/ 

SELECT last_name, first_name, job_title, department_name 
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN jobs ON employees.job_id = jobs.job_id
WHERE departments.department_name IN ('Administration', 'Marketing', 'Purchasing');

/* 2) Affichons la région, le pays, l’adresse et la ville des pays suivants
(USA, Royaume Unis et CHINE)*/ 

SELECT region_name, country_name, street_address, city 
FROM regions
INNER JOIN countries ON regions.region_id = countries.region_id
INNER JOIN locations 
WHERE country_name IN ("United States of America", "China", "United Kingdom");

/* 3) Affichons la masse salariale par département 
par ordre décroissant de masse salariale*/ 
SELECT department_name AS "Department", ROUND(SUM(salary),0) AS "Total Salary"
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name 
ORDER BY SUM(salary) DESC;

/* 4) Affichons la répartition du nombre d’employés par poste et par département. */ 

SELECT  departments.department_name AS "Department", job_title AS "Position", COUNT(*) AS "Employees Number"
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN jobs ON employees.job_id = jobs.job_id
GROUP BY departments.department_id, jobs.job_title;

/* 5) Affichons le salaire minimum par département */ 

SELECT MIN(salary) AS "Min Salary", department_name AS "Department"
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name;


/* 6) Affichons le nom de département et le salaire moyen pour le département
 dont le salaire moyen est entre 5000 et 7000*/ 

SELECT department_name AS "Department", ROUND(AVG(salary),2) AS "AVG Salary"
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name 
HAVING AVG(salary) BETWEEN 5000 AND 7000;
  