CREATE or alter TRIGGER trg_InstructorQuestionPool
ON Questions
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
DECLARE @CourseID INT

-- Get the [CourseID] of the Instructor
SELECT @CourseID = CourseID FROM Teach t,[dbo].[Instructors] i 
	WHERE i.[username] = (SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1))
	and i.ID=t.InstID and class=Year(getdate())

-- Check if the inserted or deleted record belongs to the Instructor's course
IF EXISTS (SELECT 1 FROM INSERTED WHERE CourseID = @CourseID) OR  
   EXISTS (SELECT 1 FROM DELETED WHERE CourseID = @CourseID)
BEGIN
    -- Allow the insert, update, or delete operation
    IF EXISTS (SELECT * FROM INSERTED) INSERT INTO Questions ( Answer, CourseID) SELECT  Answer, CourseID FROM INSERTED;
	BEGIN
        SET IDENTITY_INSERT Questions ON
        UPDATE Questions SET Answer = i.Answer FROM Questions q INNER JOIN INSERTED i ON q.ID = i.ID;
        SET IDENTITY_INSERT Questions OFF
    END
    IF EXISTS (SELECT * FROM DELETED) DELETE FROM Questions WHERE id IN (SELECT id FROM DELETED);
END
ELSE
BEGIN
    -- Rollback the transaction and display an error message
    ROLLBACK TRANSACTION;
    RAISERROR ('You are not authorized to modify this question pool.', 16, 1);
END
END
SET IDENTITY_INSERT dbo.Questions ON

INSERT INTO dbo.Questions ([Degree] , [CourseID],[Type],[Q_body],[Answer]) VALUES ( 30, 1,'mcq','sdf','sdf')

SET IDENTITY_INSERT dbo.Questions OFF