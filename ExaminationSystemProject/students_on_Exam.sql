
/* PROCEDURE to who will attend this EXam*/

create or alter  PROCEDURE students_on_Exam  
@examID int
as 
BEGIN
  IF(@examID IN(SELECT ExamID FROM AllowedStudForExam WHERE ExamID=@examID ))
   BEGIN
     select ae.ExamID,ae.StudID ,s.fname+''+s.lname as StudentName
      from AllowedStudForExam ae, Students s 
      where ExamID = @examID and ae.StudID=s.ID ;
   END
ELSE
	BEGIN 
		PRINT 'Enter VALID EXAMID'
	END
END;
go 



