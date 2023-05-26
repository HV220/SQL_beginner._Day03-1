WITH visits AS (
SELECT
	pv.person_id,
	pv.pizzeria_id,
	pv.visit_date
FROM
	person_visits pv
RIGHT JOIN (
	SELECT
		*
	FROM
		person
	WHERE
		person.name = 'Kate') tmp
                              ON
	pv.person_id = tmp.id),
     pizzerias AS (
SELECT
	pi.id,
	pi.name,
	visits.visit_date
FROM
	pizzeria pi
RIGHT JOIN visits ON
	pi.id = visits.pizzeria_id),
     prices AS (
SELECT
	*
FROM
	menu m
JOIN pizzerias ON
	m.pizzeria_id = pizzerias.id)
SELECT
	pr.pizza_name,
	pr.price,
	pr.name AS pizzeria_name,
	pr.visit_date
FROM
	prices pr
WHERE
	pr.price >= 800
	AND pr.price <= 1000
ORDER BY
	1,
	2,
	3,
	4;