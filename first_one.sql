SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Client;
SELECT * FROM Branch Supplier;
SELECT * FROM Works_With;

CREATE TABLE
    Employee(
        emp_id INT PRIMARY KEY,
        first_name VARCHAR(40),
        last_name VARCHAR(40),
        birth_date DATE,
        sex VARCHAR(1),
        salary INT,
        super_id INT,
        branch_id INT
    );

CREATE TABLE
    Branch(
        branch_id INT PRIMARY KEY,
        branch_name VARCHAR(40),
        mgr_id INT,
        mgr_start_date DATE,
        FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE
        SET
            NULL
    );

ALTER TABLE
    Employee
ADD
    FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE
SET
    NULL;

ALTER TABLE
    Employee
ADD
    FOREIGN KEY(super_id) REFERENCES Employee(emp_id) ON DELETE
SET
    NULL;

CREATE TABLE
    Client(
        Client_id INT PRIMARY KEY,
        Client_name VARCHAR(40),
        Branch_id INT,
        FOREIGN KEY (branch_id) REFERENCES Branch(Branch_id) ON DELETE
        SET
            NULL
    );

CREATE TABLE
    works_with (
        emp_id INT,
        client_id INT,
        total_sales INT,
        PRIMARY KEY(emp_id, client_id),
        FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
        FOREIGN KEY(client_id) REFERENCES Client(client_id) ON DELETE CASCADE
    );

CREATE TABLE
    Branch_supplier(
        branch_id INT,
        supplier_name VARCHAR(40),
        PRIMARY KEY(branch_id, supplier_name),
        supply_type VARCHAR(40),
        FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
    );

INSERT INTO
    employee
VALUES
(
        100,
        'David',
        'Wallace',
        '1967-11-17',
        'M',
        250000,
        NULL,
        NULL
    );

INSERT INTO
    branch
VALUES
(1, 'Corporate', 100, '2006-02-09');

UPDATE
    employee
SET
    branch_id = 1
WHERE
    emp_id = 100;

INSERT INTO
    employee
VALUES
(
        101,
        'Jan',
        'Levinson',
        '1961-05-11',
        'F',
        110000,
        100,
        1
    );

INSERT INTO
    employee
VALUES
(
        102,
        'Michael',
        'Scott',
        '1964-03-15',
        'M',
        75000,
        100,
        NULL
    );

INSERT INTO
    branch
VALUES
(2, 'Scranton', 102, '1992-04-06');

UPDATE
    employee
SET
    branch_id = 2
WHERE
    emp_id = 102;

INSERT INTO
    employee
VALUES
(
        103,
        'Angela',
        'Martin',
        '1971-06-25',
        'F',
        63000,
        102,
        2
    );

INSERT INTO
    employee
VALUES
(
        104,
        'Kelly',
        'Kapoor',
        '1980-02-05',
        'F',
        55000,
        102,
        2
    );

INSERT INTO
    employee
VALUES
(
        105,
        'Stanley',
        'Hudson',
        '1958-02-19',
        'M',
        69000,
        102,
        2
    );

INSERT INTO
    employee
VALUES
(
        106,
        'Josh',
        'Porter',
        '1969-09-05',
        'M',
        78000,
        100,
        NULL
    );

INSERT INTO
    branch
VALUES
(3, 'Stamford', 106, '1998-02-13');

UPDATE
    employee
SET
    branch_id = 3
WHERE
    emp_id = 106;

INSERT INTO
    employee
VALUES
(
        107,
        'Andy',
        'Bernard',
        '1973-07-22',
        'M',
        65000,
        106,
        3
    );

INSERT INTO
    employee
VALUES
(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


--Branch Supplier Table
INSERT INTO branch_supplier
VALUES (2, 'Hammer Mill', 'Paper');

INSERT INTO branch_supplier
VALUES (2, 'Uni-ball', 'Writing Utensils');

INSERT INTO branch_supplier
VALUES (3, 'Patriot Paper', 'Paper');

INSERT INTO branch_supplier
VALUES (2, 'J.T. Forms & Labels', 'Custom Forms');

INSERT INTO branch_supplier
VALUES (3, 'Uni-ball', 'Writing Utensils');

INSERT INTO branch_supplier
VALUES (3, 'Hammer Mill', 'Paper');

INSERT INTO branch_supplier
VALUES (3, 'Stamford Lables', 'Custom Forms');

--Client Table
INSERT INTO client
VALUES (400, 'Dunmore Highschool', 2);

INSERT INTO client
VALUES (401, 'Lackawana Country', 2);

INSERT INTO client
VALUES (402, 'FedEx', 3);

INSERT INTO client
VALUES (403, 'John Daly Law, LLC', 3);

INSERT INTO client
VALUES (404, 'Scranton Whitepages', 2);

INSERT INTO client
VALUES (405, 'Times Newspaper', 3);

INSERT INTO client
VALUES (406, 'FedEx', 2);

--Works With Table
INSERT INTO works_with
VALUES (105, 400, 55000);

INSERT INTO works_with
VALUES (102, 401, 267000);

INSERT INTO works_with
VALUES (108, 402, 22500);

INSERT INTO works_with
VALUES (107, 403, 5000);

INSERT INTO works_with
VALUES (108, 403, 12000);

INSERT INTO works_with
VALUES (105, 404, 33000);

INSERT INTO works_with
VALUES (107, 405, 26000);

INSERT INTO works_with
VALUES (102, 406, 15000);

INSERT INTO works_with
VALUES (105, 406, 130000);

-- Find all employees ordered by salary ?
SELECT
    *
FROM
    Employee
ORDER BY
    salary DESC;

--Find all employess ordered by sex then name ?
SELECT
    *
FROM
    Employee
ORDER BY
    sex,
    first_name,
    last_name;

--Find the first 5 employees from the table ?
SELECT
    *
FROM
    Employee
LIMIT
    5;

--Find first and last names of all employees ?
SELECT
    first_name,
    last_name
FROM
    Employee;

--Find forename and surname of all employees ?
SELECT
    first_name AS forename,
    last_name AS surname
FROM
    Employee;

--Find out all different genders ?
SELECT
    DISTINCT sex
FROM
    Employee;

--Find the no. of employees in the company ?
SELECT
    COUNT(emp_id)
FROM
    Employee;

--Find the no. of male employees in the company born after 1970 ?
SELECT
    COUNT(emp_id)
FROM
    Employee
WHERE
    sex = 'M'
    AND birth_date > '1970-01-01';

--Find the average of all employee salaries ?
SELECT
    AVG(salary)
FROM
    Employee;

--Find the total sales of each man ?
SELECT
    SUM(total_sales),
    emp_id
FROM
    Works_with
GROUP BY
    emp_id;

--Find any branch suppliers who are in the label bussiness ?
SELECT
    *
FROM
    Branch_supplier
WHERE
    supplier_name LIKE '% Label%';

--Find an employee born in october ?
SELECT
    *
FROM
    Employee
WHERE
    birth_date LIKE '%____-10-__%';

--Find any client who are schools ?
SELECT
    *
FROM
    Client
WHERE
    client_name LIKE '%school%';

--Find the list of branch and client names ?
SELECT
    branch_name
FROM
    Branch
UNION
SELECT
    client_name
FROM
    Client;

--Find a list of all money spent or earned by the company ?
SELECT
    salary
FROM
    Employee
UNION
SELECT
    total_sales
FROM
    Works_With;

INSERT INTO
    Branch
VALUES
(4, 'Buffalo', NULL, NULL);

SELECT
    *
FROM
    Branch;

--Find all branches and names of their managers ?
SELECT
    Employee.emp_id,
    Employee.first_name,
    Employee.last_name,
    Branch.branch_name
FROM
    Employee
    JOIN Branch ON Employee.emp_id = Branch.mgr_id;

CREATE TABLE
    Student(
        student_id INT PRIMARY KEY,
        namee VARCHAR(20),
        major VARCHAR(40)
    );

INSERT INTO
    Student
VALUES
(1, 'Jack', 'Biology');

INSERT INTO
    Student
VALUES
(2, 'Kate', 'Sociology');

INSERT INTO
    Student (student_id, namee)
VALUES
(3, 'Claire');

SELECT
    *
FROM
    Student;

ALTER TABLE
    Student RENAME COLUMN namee TO name;