
/*CREATE TRIGGER ditAllowedStudForExam from user*/

CREATE or alter TRIGGER  trg_editAllowedStudForExam
on AllowedStudForExam
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
IF NOT EXISTS (select I.ID from Instructors AS I, Teach AS T,Exams AS E,inserted
				where I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)) AND 
				I.ID=T.InstID AND 
				T.CourseID=E.CourseID AND 
				T.InstID=E.InstID AND 
				E.ID=inserted.ExamID AND
				T.StudID=inserted.StudID
				)
	OR NOT EXISTS (select I.ID from Instructors AS I, Teach AS T,Exams AS E,deleted
				where I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)) AND 
				I.ID=T.InstID AND 
				T.CourseID=E.CourseID AND 
				T.InstID=E.InstID AND 
				E.ID=deleted.ExamID AND
				T.StudID=deleted.StudID
				)
    BEGIN
        RAISERROR('Only the instructors can Edit their Students and Exams.', 16, 1);
        ROLLBACK TRANSACTION;
    END