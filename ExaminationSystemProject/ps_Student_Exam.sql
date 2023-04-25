
/* procedure to insert students in AllowedStudForExam table */
alter procedure ps_Student_Exam(@studID int, @instID int,@examID int)
as

select t.[StudID], t.[InstID],e.[ID] 
from [dbo].[Teach] as t join [dbo].[Exams] as e
on(e.InstID= t.InstID)
where t.StudID=@studID and t.InstID=@instID and e.ID=@examID

begin
insert into AllowedStudForExam (StudID, ExamID) 
values  (@studID,@examID )
end;
go