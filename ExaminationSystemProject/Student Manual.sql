-----------------------------------Procedures & Functions---------------------------------------

--------------procedure to insert students in AllowedStudForExam table
 EXEC ps_Student_Exam
 @studID=1, 
 @instID=1,
 @examID=1; 
 --------------To Delete students from AllowedStudForExam table 
  EXEC sp_students_notallwed_exam 
  @studID=2 , 
  @examID=1;
  
--------------open exam to students from AllowedStudForExam table 
 EXEC ShowExamForStud
@ExamID=1,  
@StudID=1;

--------------to show students schedule  exam
 EXEC ShowAllowedExams
@StdID=1;

--------------to display who will attend this EXam*/
 EXEC students_on_Exam  
@examID=1;





------------------------------------Views---------------------------------------

--------------To Display data of students ,inst and course
SELECT * FROM dataofStudents;


------------------------------------Triggers---------------------------------------

--trg_editAllowedStudForExam ON AllowedStudForExam to stop anyone who is trying to INSERT, UPDATE, DELETE 
--on Student that don't belong to him 

