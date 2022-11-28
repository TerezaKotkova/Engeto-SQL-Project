SELECT *
FROM czechia_payroll;

SELECT *
FROM czechia_payroll_unit;

SELECT *
FROM czechia_payroll_value_type;

SELECT *
FROM czechia_payroll_calculation;

SELECT *
FROM czechia_price;

SELECT *
FROM czechia_price_category;



SELECT 	
	count(value)
FROM czechia_payroll;


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value IS NOT NULL;


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value IS NOT NULL
	AND value_type_code = '5958'
	AND calculation_code  = '100';


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value_type_code = '5958'
	AND calculation_code  = '100';

	
SELECT 	
	count(value)
FROM czechia_payroll
WHERE value IS NOT NULL
	AND value_type_code = '5958'
	AND calculation_code  = '200';


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value_type_code = '5958'
	AND calculation_code  = '200';



CREATE OR REPLACE VIEW v_czechia_pay_FTE AS 
	SELECT
		cp.value AS quarterly_avg_gross_wage,
		cp.payroll_year AS year,
		cpib.name AS industry_branch
	FROM czechia_payroll AS cp
	LEFT JOIN czechia_payroll_industry_branch AS cpib
		ON cp.industry_branch_code = cpib.code 
	WHERE 
		cp.value_type_code = '5958' 
		AND cp.calculation_code = '200'
	ORDER BY cp.payroll_year;
	
SELECT * FROM v_czechia_pay_FTE;
