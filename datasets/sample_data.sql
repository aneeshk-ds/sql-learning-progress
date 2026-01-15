CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore');

INSERT INTO orders VALUES
(101, 1, '2024-01-10', 2500),
(102, 1, '2024-01-15', 1500),
(103, 2, '2024-02-01', 3000);


-- Drop table if it already exists (safe re-runs)
DROP TABLE IF EXISTS Employees;

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department VARCHAR(30) NOT NULL
);


-- Insert sample employee data
INSERT INTO Employees (emp_id, emp_name, salary, department) VALUES
(1, 'Alice',   60000, 'IT'),
(2, 'Bob',     45000, 'HR'),
(3, 'Charlie', 75000, 'IT'),
(4, 'Diana',   50000, 'Finance'),
(5, 'Ethan',   55000, 'HR');


-- Drop table if it exists
DROP TABLE IF EXISTS Departments;

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL
);


-- Insert sample department data
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');
