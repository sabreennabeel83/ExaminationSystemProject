# ExaminationSystemProject

SQL Server Examination System Project

## Functions coded by me


o System should provide a question pool, so instructors can pick an exam from
it.

o Questions type may be Multiple choice, True & false or text questions.

o For multiple choice and true & false questions the system should store
the correct answer and check the student answer and store his result.

o For the text question system should store the best accepted answer and
use text functions and regular expressions to check student answer and
display result to the instructor show him valid answers and not valid
answers to review them and enter the marks manually .

o System should store course information (Course name, description, Max
degree, Min Degree,...)
, instructors information, and students information, each instructor can
teach one or more courses, and each course may be taught by one
instructor in each class (Instructor may be changed for another class in
another year).

o Instructor can edit (add, Update and delete) the question pool in his course
only.

o Training Manager (One of the instructors) can edit (add, Update and
delete) instructors and courses and instructors for each course.

o Training manager can add and edit: Branches, tracks in each department,
and add new intake.

o Training manager can add students, and define their personal data, intake,
branch, and track.

o Training manager, Instructors, Students should have a login account to access
the system.

o Instructor can make Exam (For his course only) by selecting the number of
questions of each type, the system selects the questions randomly, or he
can select them manually from the question pool. And he must put a degree
for each question on the exam, and total degrees must not exceed the
course Max Degree (One course may have more than one exam).

##

o For each exam, we should know type (exam or corrective), intake,
branch, track, course, start time, End time, total time and allowance
options.

o System should store each exam which is defined by year, Course, instructor.

o Instructors can select students that can do specific exams, and define Exam
date, start time and end time. Students can see the exam and do it only on
the specified time.

o System should store students' answers for the exam and calculate
the correct answers, and calculate the final result for the student in
this course.

o Insert test data in all tables and test your system.
