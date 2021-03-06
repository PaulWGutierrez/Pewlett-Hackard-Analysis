-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e 
	INNER JOIN  titles AS t ON e.emp_no = t.emp_no
where e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.to_date DESC;

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name,
t.title
INTO unique_titles
FROM employees AS e 
	INNER JOIN  titles AS t ON e.emp_no = t.emp_no
where e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY 1 DESC;

SELECT * FROM retiring_titles

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date, t.title 
INTO mentorship_eligibilty
FROM employees AS e
	INNER JOIN  dept_emp AS de ON e.emp_no = de.emp_no
	INNER JOIN titles AS t ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty