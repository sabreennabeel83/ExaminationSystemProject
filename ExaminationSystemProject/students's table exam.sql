
 /* PROCEDURE to show students's table exam*/

CREATE OR ALTER PROCEDURE ShowAllowedExams
@StdID INT
AS
BEGIN
	SELECT E.ID,E.Type,E.CourseID,E.StartDate,E.EndDate,E.InstID,
			E.QuestNums,E.TotalDegree,E.Allowance,DATEDIFF(MINUTE, GETDATE(), E.EndDate) AS RemainingTime 
		FROM Exams AS E, AllowedStudForExam 
			WHERE AllowedStudForExam.StudID=@StdID AND AllowedStudForExam.ExamID=E.ID 
					AND E.StartDate <= GETDATE() AND E.EndDate >= GETDATE() ;
END


