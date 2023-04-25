Create OR ALTER TRIGGER TrEditExam ON Exams
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF NOT EXISTS (SELECT I.ID FROM Instructors AS I,Teach AS T ,inserted
		WHERE I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)) 
				AND I.ID=T.InstID AND T.CourseID=inserted.CourseID AND T.Class=YEAR(GETDATE()))
	OR
	NOT EXISTS (SELECT I.ID FROM Instructors AS I,Teach AS T ,deleted
		WHERE I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)) 
				AND I.ID=T.InstID AND T.CourseID=deleted.CourseID AND T.Class=YEAR(GETDATE()))
    BEGIN
        RAISERROR('Only the Right instructors can add Exams.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

Create OR ALTER TRIGGER TrEditExamQuest ON Exam_Questions
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF NOT EXISTS (SELECT I.ID FROM Instructors AS I,Questions AS Q ,Exams AS E,Exam_Questions AS EQ,inserted, Teach AS T
		WHERE I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1))
				AND I.ID=T.InstID
				AND T.InstID=(SELECT Exams.InstID FROM inserted , Exams where inserted.ExamID= Exams.ID)
				AND T.CourseID=(SELECT Exams.CourseID FROM inserted , Exams where inserted.ExamID= Exams.ID)
				AND Q.CourseID=(SELECT Q.CourseID FROM inserted , Questions where inserted.QuestID= Q.ID)
	OR
	NOT EXISTS (SELECT I.ID FROM Instructors AS I,Questions AS Q ,Exams AS E,Exam_Questions AS EQ,inserted, Teach AS T
		WHERE I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1))
				AND I.ID=T.InstID
				AND T.InstID=(SELECT Exams.InstID FROM deleted , Exams where deleted.ExamID= Exams.ID)
				AND T.CourseID=(SELECT Exams.CourseID FROM deleted , Exams where deleted.ExamID= Exams.ID)
				AND Q.CourseID=(SELECT Q.CourseID FROM deleted , Questions where deleted.QuestID= Q.ID)
	))
    BEGIN
        RAISERROR('Only the Right instructors can add Questions To Their Exams.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

CREATE or alter TRIGGER  TrEditAllowedStudForExam
ON AllowedStudForExam
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
				AND T.Class=YEAR(GETDATE())
				)
	OR NOT EXISTS (select I.ID from Instructors AS I, Teach AS T,Exams AS E,deleted
				where I.username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)) AND 
				I.ID=T.InstID AND 
				T.CourseID=E.CourseID AND 
				T.InstID=E.InstID AND 
				E.ID=deleted.ExamID AND
				T.StudID=deleted.StudID
				AND T.Class=YEAR(GETDATE())
				)
    BEGIN
        RAISERROR('Only the instructors can Edit their Students and Exams.', 16, 1);
        ROLLBACK TRANSACTION;
    END


END;

INSERT INTO AllowedStudForExam(ExamID,StudID) VALUES (1,1)

SELECT SUSER_SNAME()
SELECT ORIGINAL_LOGIN();
SELECT SYSTEM_USER;

SELECT CURRENT_USER
SELECT SUSER_NAME(10);
SELECT SESSION_USER
SELECT *
FROM sys.objectsþ
SELECT SUBSTRING('SABREEN NABIL GABER',1,5)


