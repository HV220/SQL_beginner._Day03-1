WITH andrey_visit AS (SELECT DISTINCT pz.name AS pizzeria_name
                FROM person_visits pv
                         JOIN (SELECT * FROM person p WHERE p.name = 'Andrey') t1
                              ON pv.person_id = t1.id
                         JOIN pizzeria pz ON pv.pizzeria_id = pz.id),
     andrey_order AS (SELECT DISTINCT pz.name AS pizzeria_name
                FROM person_order po
                         JOIN (SELECT * FROM person p WHERE p.name = 'Andrey') t2
                              ON po.person_id = t2.id
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria pz ON m.pizzeria_id = pz.id)
SELECT *
FROM andrey_visit
EXCEPT
SELECT *
FROM andrey_order;