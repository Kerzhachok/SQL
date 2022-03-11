-- Таблица employees
-- 1. Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);
select * from employees;

-- 2. Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values	('Kathy'),
		('Shawn'),
		('Sandra'),
		('Pauline'),
		('Patricia'),
		('Christopher'),
		('Edward'),
		('Judith'),
		('Jennifer'),
		('Julie'),
		('Shirley'),
		('Kathy'),
		('Brandon'),
		('Dennis'),
		('Rene'),
		('Michael'),
		('Monica'),
		('Deborah'),
		('Gloria'),
		('Brian'),
		('Teresa'),
		('Stephanie'),
		('Lauren'),
		('Tracy'),
		('Virginia'),
		('Margaret'),
		('Thomas'),
		('William'),
		('Pamela'),
		('Norman'),
		('Rosa'),
		('Kenneth'),
		('Charles'),
		('Karen'),
		('Edward'),
		('Cindy'),
		('Lois'),
		('Michelle'),
		('Harold'),
		('Connie'),
		('Travis'),
		('Lillie'),
		('Phillip'),
		('Steven'),
		('Lori'),
		('Dawn'),
		('Philip'),
		('Chad'),
		('Peggy'),
		('Carol'),
		('Karen'),
		('Esther'),
		('Christine'),
		('Edward'),
		('Carol'),
		('Claude'),
		('Paul'),
		('Anna'),
		('Michael'),
		('Carlos'),
		('Donald'),
		('Jenny'),
		('Juan'),
		('Diane'),
		('Carmen'),
		('Brett'),
		('Beverly'),
		('Larry'),
		('John'),
		('Kimberly');

-- Таблица salary
-- 3. Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

-- 4. Наполнить таблицу salary 15 строками:
-- 1000- 1100- 1200- 1300- 1400- 1500- 1600- 1700- 1800- 1900- 2000- 2100- 2200- 2300- 2400- 2500
insert into salary(monthly_salary)
values	(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	
-- Таблица employee_salary
-- 5. Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);

select * from employee_salary;

-- 6. Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values 	(1, 10),
		(5, 12),
		(7, 1),
		(10, 5),
		(11, 8),
		(13, 8),
		(20, 3),
		(21, 4),
		(25, 10),
		(30, 11),
		(35, 12),
		(37,13),
		(40, 9),
		(41, 16),
		(45, 6),
		(47, 8),
		(51, 2),
		(53, 8),
		(55, 9),
		(58, 14),
		(60, 14),
		(61, 8),
		(62, 10),
		(63, 11),
		(64, 12),
		(65, 13),
		(66, 16),
		(67, 1),
		(68, 2),
		(69, 5),
		(71, 1),
		(72, 1),
		(73, 1),
		(74, 1),
		(75, 1),
		(76, 1),
		(77, 1),
		(78, 1),
		(79, 1),
		(80, 1);
	
-- Таблица roles

/* 7. Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique*/
create table roles(
	id  serial primary key,
	role_name int unique not null
);

select * from roles;

-- 8. Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);

-- 9. Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values 	('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

/*Таблица roles_employee
10. Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/
create table roles_employee(
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

select * from roles_employee;
-- 11. Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values 	(1, 10),
		(2, 1),
		(3, 1),
		(4, 1),
		(5, 12),
		(7, 1),
		(10, 5),
		(11, 8),
		(13, 8),
		(20, 3),
		(21, 4),
		(25, 10),
		(26, 1),
		(27, 1),
		(28, 1),
		(29, 1),
		(30, 11),
		(31, 1),
		(32, 1),
		(33, 1),
		(35, 12),
		(37,13),
		(40, 9),
		(41, 16),
		(45, 6),
		(47, 8),
		(51, 2),
		(53, 8),
		(55, 9),
		(58, 14),
		(60, 14),
		(61, 8),
		(62, 10),
		(63, 11),
		(64, 12),
		(65, 13),
		(66, 16),
		(67, 1),
		(68, 2),
		(69, 5);
		
SELECT * FROM roles;
SELECT * FROM salary;
SELECT * FROM roles_employee re ;
