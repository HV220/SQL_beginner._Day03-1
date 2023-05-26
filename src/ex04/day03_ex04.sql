WITH main_order AS (SELECT p.gender,
                          pz.name AS pizzeria_name
                     FROM person_order po
                        JOIN person p ON po.person_id = p.id
                        JOIN menu m ON po.menu_id = m.id
                        JOIN pizzeria pz  ON m.pizzeria_id = pz.id),
    order_women AS (SELECT *
                    FROM main_order mo
                    WHERE mo.gender = 'female'),
    order_men AS (SELECT *
                    FROM main_order mo
                    WHERE mo.gender = 'male'),
    only_women AS (SELECT pizzeria_name FROM order_women
                   EXCEPT
                   SELECT pizzeria_name FROM order_men),
    only_men AS (SELECT pizzeria_name FROM order_men
                   EXCEPT
                   SELECT pizzeria_name FROM order_women)
SELECT pizzeria_name FROM only_women
UNION
SELECT pizzeria_name FROM only_men
ORDER BY 1;