select * from roles;
select * from salary;
select * from employees;
select * from roles_employee order by role_id;
select * from employee_salary; 

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on employee_id = e.id
join salary s on salary_id = s.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on employee_id = e.id
join salary s on salary_id = s.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, monthly_salary from employees e
left join employee_salary es on employee_id = e.id
right join salary s on salary_id = s.id
where employee_id is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, monthly_salary from  employees e
left join employee_salary es on employee_id = e.id
right join salary s on salary_id = s.id
where employee_id is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.
select e.id, employee_name, monthly_salary from employees e
left join employee_salary es on employee_id = e.id
left join salary s on salary_id = s.id
where salary_id is null
order by e.id;

--6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees e
left join roles_employee re on e.id = employee_id
left join roles r on role_id = r.id
order by e.id;

--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees e
left join roles_employee re on e.id = employee_id
left join roles r on role_id = r.id
where role_name like '%Java %';

--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees e
left join roles_employee re on employee_id = e.id
left join roles r on r.id = role_id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from roles r
right join roles_employee re on role_id = r.id
right join employees e on employee_id = e.id
where role_name like '%QA%';
 
--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e
left join roles_employee re on employee_id = e.id
left join roles r on role_id = r.id
where role_name like '%Manual%';

--11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees e
right join roles_employee on employee_id = e.id
right join roles r on role_id = r.id
where role_name like '%Auto%';

--12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary from employees e
join employee_salary es on employee_id = e.id
join salary s on salary_id = s.id
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary from employees e
left join employee_salary es on employee_id = e.id
left join salary s on salary_id = s.id
left join roles_employee re on re.employee_id = e.id
left join roles r on r.id = re.role_id
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary from employees e
left join employee_salary es on employee_id = e.id
left join salary s on salary_id = s.id
left join roles_employee re on re.employee_id = e.id
left join roles r on r.id = re.role_id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary from employees e
left join employee_salary es on employee_id = e.id
left join salary s on salary_id = s.id
left join roles_employee re on re.employee_id = e.id
left join roles r on r.id = re.role_id
where role_name like '%Java %';

--16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on role_id = r.id
join employee_salary es on es.employee_id = e.id
join salary s on es.salary_id = s.id
where role_name like '%Python%' ;

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on re.employee_id = e.id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on es.salary_id = s.id
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on re.employee_id = e.id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on es.salary_id = s.id
where role_name like '%Middle JavaScript%';
 
--19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on re.employee_id = e.id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on es.salary_id = s.id
where role_name like '%Senior Java%';

--20. Вывести зарплаты Junior QA инженеров
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%Junior%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%QA%';

--25. Вывести количество QA инженеров
select count(employee_name) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%QA%';

--26. Вывести количество Middle специалистов
select count(employee_name) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%Middle%';

--27. Вывести количество разработчиков
select count(employee_name) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
order by monthly_salary asc;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where monthly_salary < 2300
order by monthly_salary asc;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees e
left join roles_employee re on e.id = re.employee_id
left join roles r on role_id = r.id
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = salary_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;
