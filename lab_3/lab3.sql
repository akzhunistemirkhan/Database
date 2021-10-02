--- Task 1
--------------------
---A
select * from course
where credits > 3;

---B
select * from classroom
where building = 'Watson' or building = 'Packard';

---C
select * from course
where dept_name = 'Comp. Sci.';

---D
select * from section where semester = 'Fall';

---E
select * from student
where tot_cred > 45 and tot_cred < 90;

---F
select * from student
where name like '%a'
   or name like '%e'
   or name like '%y'
   or name like '%u'
   or name like '%i'
   or name like '%o';

---G
select * from prereq
where prereq_id = 'CS-101';

------------------------
---TASK 2
------------------------
---A
select dept_name, avg(salary)
from instructor
group by dept_name
order by avg(salary) asc;

---B
select building, COUNT( course_id ) AS cnt from section
group by building
order by cnt desc
limit 1;

---C
select dept_name, count(course_id) from course
group by dept_name
having count(course_id) =
       (select count(course_id)
        from course
        group by dept_name
        limit 1);

---D
select student.name, takes.id, count(takes.course_id)
from course, takes, student
where takes.course_id = course.course_id
  and takes.id = student.id
  and course.dept_name = 'Comp. Sci.'
group by student.name, takes.id
having count(takes.course_id) > 3;

---E
select *
from instructor
where dept_name = 'Biology' or dept_name = 'Philosophy' or dept_name = 'Music';

---F
select * from instructor
where id in (select distinct(teaches.id) from teaches
where id not in (select distinct(id) from teaches
where year = 2017) and year = 2018);

-----------------------
---TASK 3
-----------------------
---A
select *
from student
where id in(
    select takes.id
    from takes
    where grade in('A', 'A-')
    )
    and dept_name = 'Comp. Sci.'
order by name;

---B
select * from instructor
where instructor.id in(
    select i_id from advisor
    where s_id in(
        select takes.id
        from takes
        where grade NOT IN ('A', 'A-', 'B', 'B+')
        )
    );

---C
select * from department
where dept_name not in(
    select student.dept_name from student
    where student.id in(
        select takes.id from takes
        where takes.grade = 'F' or takes.grade = 'C')
        );

---D
select * from instructor
where id not in(
    select teaches.id from teaches
    where (course_id,sec_id,semester,year) in(
        select takes.course_id, takes.sec_id, takes.semester, takes.year
        from takes
        where takes.grade = 'A')
        );

---E
select * from course
where course_id in(
    select course_id from section
    where time_slot_id in(
        select time_slot_id from time_slot
        where end_hr < 13
        )
    );