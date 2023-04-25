
/* view data of stud,inst and course*/
create view dataofStudents
as
select s.ID as StudentID,s.fname+''+s.lname as StudentName,s.track, s.branch,s.intake,t.Class,
c.ID as CourseID,c.Name as CourseName ,c.DeptID,
i.ID as InstructorsID,i.name as InstructorName,i.deptID as InstructorDepartment 
from Teach t,Students s,Courses c,Instructors i
where s.ID=t.StudID and c.ID=t.CourseID and i.ID=t.InstID;

select *from dataofStudents;


