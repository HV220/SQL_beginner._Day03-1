WITH all_visit AS (SELECT pv.pizzeria_id,
                          pi.name AS pizzeria_name,
                          p.gender
                   FROM person_visits pv
                      JOIN person p ON pv.person_id = p.id
                      JOIN pizzeria pi  ON pv.pizzeria_id = pi.id),
   visit_women AS (SELECT *
                   FROM all_visit av
                   WHERE av.gender = 'female'),
     visit_men AS (SELECT *
                   FROM all_visit av
                   WHERE av.gender = 'male'),
  commom_visit AS (SELECT vw.pizzeria_id, vw.pizzeria_name
                   FROM visit_women vw
                   INTERSECT ALL
                   SELECT vm.pizzeria_id, vm.pizzeria_name
                   FROM visit_men vm),
    only_women AS (SELECT vw.pizzeria_name
                   FROM visit_women vw
                   EXCEPT ALL 
                   SELECT cv.pizzeria_name
                   FROM commom_visit cv),
      only_men AS (SELECT vm.pizzeria_name
                   FROM visit_men vm
                   EXCEPT ALL 
                   SELECT cv.pizzeria_name
                   FROM commom_visit cv)
SELECT * 
FROM only_women
UNION ALL
SELECT * 
FROM only_men
ORDER BY 1;

    
