-- SQL ЗАПРОСЫ ДЛЯ ЗАДАНИЯ

-- 2.1. Получение информации о сумме товаров заказанных под каждого клиента
SELECT
    c.name AS "Наименование клиента",
    SUM(oi.quantity * oi.price) AS "Сумма"
FROM Customers c
INNER JOIN Orders o ON o.customer_id = c.id
INNER JOIN OrderItems oi ON oi.order_id = o.id
GROUP BY c.id, c.name
ORDER BY "Сумма" DESC;

-- 2.2. Найти количество дочерних элементов первого уровня вложенности для всех категорий
SELECT
    c.name AS "Категория",
    COUNT(child.id) AS "Количество детей"
FROM Categories c
LEFT JOIN Categories child ON child.parent_id = c.id
GROUP BY c.id, c.name
ORDER BY c.id;