use SCHOOL;

-- ЗАДАЧА №1. Вывести уроки, где нет ни одной оценки ученикам.

select s.subject_name, g.grade_value from grades as g
right join lessons as l
on l.lesson_id = g.lesson_id
join class_subjects as cs
on cs.class_subject_id = l.class_subject_id
join subjects as s
on s.subject_id = cs.subject_id where g.grade_value is null;

-- ЗАДАЧА №2. Вывести учителей у которые имеется предмет, но у них ещё нет ни одного проведённого урока.
select * from teachers;

select concat(t.last_name, ' ', t.first_name) as fio, cs.weekly_hours from class_subjects as cs
right join teachers as t
on t.teacher_id = cs.teacher_id
where cs.weekly_hours is null
;

-- ЗАДАЧА №3. Вывести предметы, которые по ним ещё не проводились уроки.

select * from lessons

select * from class_subjects as cs
left join lessons as l
on l.class_subject_id = cs.class_subject_id
left join subjects as s
on cs.subject_id = s.subject_id ;

select s.subject_id, s.subject_name, l.lesson_date, cs.weekly_hours from class_subjects as cs
 join lessons as l
on l.class_subject_id = cs.class_subject_id
right join subjects as s
on cs.subject_id = s.subject_id  ;

-- ЗАДАЧА №5. Добавить нового студента для класса 7A в кабинет.

insert into students(last_name, first_name, middle_name, gender, birth_date, phone, address, class_id)
values ('Aliev', 'Ali', 'Valievich', 'мард', '2026-12-20', '+992-96-888-77-66', 'Хуҷанд, кӯчаи 199', 8);

-- ЗАДАЧА №6. Найти учеников с оценкой выше средней и показать их класс
--Вывести в таблице:
-- фио ученика 
-- класс 
-- оценку 
-- только тех учеников, у которых оценка выше среднего

select s.student_id, s.last_name, s.first_name, c.class_name, g.grade_value
from class_subjects as cs
join classes as c
on c.class_id = cs.class_subject_id
join students as s
on s.student_id = cs.subject_id
join grades as g
on g.student_id = s.student_id
group by c.class_name, s.last_name, s.first_name, g.grade_value, s.student_id
having g.grade_value > (
select avg(cast(grade_value as  int)) as avg_grade from grades
)

-- Задача №7. Показать кабинеты и количество уроков в каждом из них

select room_id,  count(lesson_id) from lessons
group by room_id 

-- ЗАДАЧА №9. Перевести всех учеников из класса 7A в 8A

select * from students as s
join classes as c
on c.class_id = s.class_id
where class_name in ('7A', '8A')

