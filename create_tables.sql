use assignment_1;

DROP TABLE IF EXISTS Customers, employees, Products, Orders, OrderDetails;

create table Customers(
	CustomerId int primary key,
	Name varchar(50),
	Email varchar(100),
	Phone INT
);
create table Employees (
	EmployeeId int primary key,
	Name varchar(50),
	Department varchar(100)
);
create table Products (
    ProductID int primary key,
    ProductName varchar(100),
    Price decimal(10,2),
    Quantity INT
);
create table Orders (
    OrderID int primary key,
    CustomerID INT,
    EmployeeID INT,
    OrderDate date
);
create table OrderDetails (
    OrderDetailId int primary key,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price decimal (10,2)
);