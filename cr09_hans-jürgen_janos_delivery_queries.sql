1.Count number of employees
SELECT COUNT(customer_id) FROM customer
2.Show first name,last name and id of employees
SELECT employees_id, first_name, last_name FROM employees
3.Show Info of Customer and adress info
SELECT customer_id, first_name, last_name, street_name, city_name FROM customer JOIN adress ON adress_id = fk_adress_id