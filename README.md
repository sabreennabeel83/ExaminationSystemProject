# ExaminationSystemProject
SQL Server Examination System Project

* This is a system designed to provide instructors with a question pool from which they can pick exam questions. The questions may be of multiple choice, true and false, or text type. 
The system stores the correct answer for multiple choice and true and false questions, and checks the student's answer, storing the result. For text questions, the system stores the best accepted answer and uses text functions and regular expressions to check the student's answer and display the result to the instructor, showing valid and invalid answers for review and manual marking.


* The system stores course information, instructor information, and student information, where each instructor can teach one or more courses, and each course may be taught by one instructor in each class. 
The instructor can edit the question pool in their course only. A training manager (one of the instructors) can edit instructors, courses, and instructors for each course, add and edit branches and tracks in each department, and add new intake. They can also add students and define their personal data, intake, branch, and track.


* Instructors, students, and the training manager all have login accounts to access the system. Instructors can create exams for their course only by selecting the number of questions of each type, and the system selects the questions randomly or allows manual selection from the question pool. The instructor must put a degree for each question on the exam, and total degrees must not exceed the course Max Degree. The system stores each exam defined by year, course, and instructor.


* Instructors can select students that can do specific exams, and define the exam date, start time, and end time. Students can see the exam and do it only at the specified time. The system stores students' answers for the exam, calculates the correct answers, and calculates the final result for the student in this course. The system also includes test data in all tables to enable testing.
