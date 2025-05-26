SELECT 
    c.Name AS CustomerName,
    e.Name AS EmployeeName,
    p.ProductName AS Product,
    COUNT(od.OrderDetailID) AS TotalItems,
    SUM(od.Price * od.Quantity) AS TotalPrice
FROM 
    Customers c
INNER JOIN Orders o ON c.CustomerId = o.CustomerId
INNER JOIN Employees e ON e.EmployeeId = o.EmployeeId
INNER JOIN OrderDetails od ON o.OrderId = od.OrderId
INNER JOIN Products p ON od.ProductId = p.ProductId
WHERE
    o.OrderDate >= '2025-01-01'
GROUP BY
    c.CustomerId, c.Name, e.Name, p.ProductName
ORDER BY
    TotalPrice DESC
LIMIT 5;
