WITH pizz_id AS (SELECT m.id
                  FROM menu m
                  EXCEPT 
                  SELECT po.menu_id
                  FROM person_order po 
                  ORDER BY 1)
SELECT m2.pizza_name,
       m2.price,
       p.name AS pizzeria_name
FROM pizz_id pz
    LEFT JOIN menu m2 ON pz.id = m2.id
    LEFT JOIN pizzeria p ON m2.pizzeria_id = p.id
ORDER BY 1, 2;