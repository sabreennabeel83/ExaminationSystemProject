
/*open exam to stud */

CREATE OR ALTER PROCEDURE ShowExamForStud
@ExamID INT, 
@StudID INT
AS
BEGIN

IF(@StudID IN(SELECT ExamID, StudID FROM AllowedStudForExam WHERE ExamID=@ExamID AND StudID=@StudID))
BEGIN

	IF((SELECT StartDate FROM Exams WHERE ID=@ExamID)<= GETDATE() AND (SELECT EndDate FROM Exams WHERE ID=@ExamID)> GETDATE())
		BEGIN
			SELECT Q.ID,Q.Type,Q.Q_body,Q.CourseID FROM Questions AS Q, Exam_Questions
			WHERE Exam_Questions.ExamID=@ExamID AND Exam_Questions.QuestID=Q.ID
		END
	ELSE IF((SELECT StartDate FROM Exams WHERE ID=@ExamID)> GETDATE())
		BEGIN
			PRINT 'THE EXAM WILL OPEN SOOOOON'
		END
	ELSE IF((SELECT EndDate FROM Exams WHERE ID=@ExamID)< GETDATE())
		BEGIN
			PRINT 'SORRY, YOU MISSED THE EXAM'
		END
END
ELSE
	BEGIN 
		PRINT 'YOU ARE NOT ALLOWED TO TAKE THIS EXAM'
	END
END

