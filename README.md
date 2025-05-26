# E-Commerce Orders SQL Project

Цей проєкт моделює базу даних для управління замовленнями, клієнтами, працівниками та продуктами інтернет-магазину. Він включає створення таблиць, заповнення даними та виконання запиту для аналітики продажів.

## Зміст

* [Структура бази даних](#структура-бази-даних)
* [Вставка даних](#вставка-даних)
* [SQL-запит](#sql-запит)
* [Результати запиту](#результати-запиту)

---

## Структура бази даних

База даних складається з п’яти таблиць:

### `Customers`

Інформація про клієнтів.

* `CustomerId` (int, PK)
* `Name` (varchar)
* `Email` (varchar)
* `Phone` (int)

### `Employees`

Інформація про працівників.

* `EmployeeId` (int, PK)
* `Name` (varchar)
* `Department` (varchar)

### `Products`

Інформація про товари.

* `ProductID` (int, PK)
* `ProductName` (varchar)
* `Price` (decimal)
* `Quantity` (int)

### `Orders`

Інформація про замовлення.

* `OrderID` (int, PK)
* `CustomerID` (int, FK → Customers)
* `EmployeeID` (int, FK → Employees)
* `OrderDate` (date)

### `OrderDetails`

Деталі замовлень (який товар і в якій кількості).

* `OrderDetailId` (int, PK)
* `OrderID` (int, FK → Orders)
* `ProductID` (int, FK → Products)
* `Quantity` (int)
* `Price` (decimal) – ціна за одиницю на момент покупки

---

## Вставка даних

Приклади вставлених записів:

### `Customers`

* Alice Smith, Gabrielle Solis, James Bron, Bree Van de Kamp, Robert Wilson, Emma Joy

### `Employees`

* Lynette Scavo (Sales), Susan Mayer (Sales), Edie Britt (Customer Service), тощо.

### `Products`

* Wireless Mouse – \$29.99
* Mechanical Keyboard – \$89.99
* USB-C Cable – \$12.99
* і т.д.

### `Orders`

* Замовлення оформлювались із січня по березень 2025 року, кожне пов’язане з клієнтом та працівником.

### `OrderDetails`

* Наприклад, замовлення 1 включає 2 мишки (\$29.99) та 1 USB-кабель (\$12.99).

---

## SQL-запит

```sql
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
```

---

## Результати запиту

Запит виводить **топ-5 записів за загальною сумою покупки**, які включають:

* Ім’я клієнта (`CustomerName`)
* Ім’я працівника, що оформив замовлення (`EmployeeName`)
* Назву продукту (`Product`)
* Кількість товарів цього виду (`TotalItems`)
* Загальну вартість (`TotalPrice`), розраховану як `Quantity * Price`
