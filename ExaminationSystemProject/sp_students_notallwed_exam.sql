
/* procedure to delete students from AllowedStudForExam table  */

create or alter procedure sp_students_notallwed_exam (@studID int , @examID int )
as
begin 
delete from AllowedStudForExam where StudID = @studID and ExamID=@examID
return 'DELETE SUCCESSFULLY'
 end;
 go



