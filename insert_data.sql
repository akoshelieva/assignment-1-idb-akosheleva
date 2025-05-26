insert into Customers(CustomerId, Name, Email, Phone)
values
(1, 'Alice Smith', 'alice.smith@email.com', '0680022390'),
(2, 'Gabrielle Solis', 'g.solis@email.com', '0687722909'),
(3, 'James Bron', 'james.bron@email.com', '0973388202'),
(4, 'Bree Van de Kamp', 'bree.v@email.com', '0678900101'),
(5, 'Robert Wilson', 'robert.w@email.com', '0987860990'),
(6, 'Emma Joy', 'emma.j@email.com', '0675904044');

insert into Employees 
values
(1, 'Lynette Scavo', 'Sales'),
(2, 'Susan Mayer', 'Sales'),
(3, 'Edie Britt', 'Customer Service'),
(4, 'Katherine Mayfair', 'Sales'),
(5, 'Renee Perry', 'Customer Service'),
(6, 'Orson Hodge', 'Sales');

insert into Products
values 
(1, 'Wireless Mouse', 29.99, 100),
(2, 'Mechanical Keyboard', 89.99, 50),
(3, 'USB-C Cable', 12.99, 200),
(4, 'Monitor Stand', 39.99, 75),
(5, 'Laptop Sleeve', 24.99, 120),
(6, 'External Hard Drive', 129.99, 30);

insert into Orders
value
(1, 1, 1, '2025-01-10'),
(2, 2, 2, '2025-01-15'),
(3, 3, 4, '2025-02-01'),
(4, 4, 1, '2025-02-10'),
(5, 5, 2, '2025-03-01'),
(6, 6, 4, '2025-03-15');

insert into OrderDetails
values
(1, 1, 1, 2, 29.99),
(2, 1, 3, 1, 12.99),
(3, 2, 2, 1, 89.99),
(4, 2, 4, 1, 39.99),
(5, 3, 5, 2, 24.99),
(6, 4, 6, 1, 129.99);
