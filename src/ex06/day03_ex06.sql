WITH t1 AS (SELECT m.pizza_name,
                     p.name,
                     m.price,
                     p.id
              FROM menu m
                  JOIN pizzeria p ON m.pizzeria_id = p.id)
SELECT t2.pizza_name,
       t2.name   AS pizzeria_name_1,
       t1.name AS pizzeria_name_2,
       t2.price
FROM (SELECT * FROM t1) t2
         JOIN t1 ON t2.price = t1.price AND t2.pizza_name = t1.pizza_name AND t2.id > t1.id
ORDER BY 1;