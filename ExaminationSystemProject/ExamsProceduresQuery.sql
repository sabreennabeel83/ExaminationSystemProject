USE ExaminationSystem;
CREATE OR ALTER PROCEDURE CreateExam
    @Type VARCHAR(50),
    @CourseID INT,
	@StartDate DATE,
	@EndDate DATE,
	@InstID INT,
	@QuestNums INT,
	@Year INT,
	@TotalDegree INT,
	@Intake VARCHAR(10),
	@Track VARCHAR(50),
	@Branch VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Exams([Type],[CourseID],[StartDate],[EndDate],
					[InstID],[QuestNums],[Year],[TotalDegree],[Intake],[Track],[Branch])
    VALUES (@Type, @CourseID, @StartDate,@EndDate,
			@InstID,@QuestNums,@Year,@TotalDegree,@Intake,@Track,@Branch);
	DECLARE @ID INT
	SELECT @ID= ID from Exams where [Type]=@Type AND [CourseID]=@CourseID AND [InstID]=@InstID;
	return @ID
END

CREATE OR ALTER PROCEDURE InsertExamQuestManually
	@ExamID INT,
	@QuestID INT
AS
BEGIN
	DECLARE @currentExamDegree INT
	SELECT @currentExamDegree= SUM(Questions.Degree) FROM Questions,Exam_Questions 
	WHERE @ExamID=Exam_Questions.ExamID AND Exam_Questions.QuestID=Questions.ID GROUP BY Questions.ID
	IF (@currentExamDegree<(select TotalDegree from Exams where ID=@ExamID))
	BEGIN
		IF((SELECT Degree FROM Questions WHERE ID=@QuestID)+@currentExamDegree<=(select TotalDegree from Exams where ID=@ExamID))
		BEGIN
			INSERT INTO Exam_Questions ([ExamID],[QuestID])
			VALUES (@ExamID,@QuestID);
			RETURN 'You Have To Enter More Questions In This Exam'
		END
		ELSE 
			BEGIN
				RETURN 'YOU HAVE TO ENTER ANOTHER QUESTION THAT ITS DEGREE IS LESS THAN THE PREVIOUS ONE'
			END
	END
		ELSE 
		BEGIN
			RETURN 'THE EXAM YOU ARE TRYING TO INSERT INTO IS FULL'
		END
END

CREATE OR ALTER PROCEDURE InsertExamQuestRandomly
@ExamID INT,
@NoMCQ INT,
@NoTF INT,
@NoText INT
AS
BEGIN
	CREATE TABLE #TempExamQuestion
	( ExamID INT NOT NULL,
	  QuestID INT NOT NULL,
	  Degree INT NOT NULL,
	  CourseID INT NOT NULL
	);
	INSERT INTO #TempExamQuestion(ExamID,QuestID,Degree,CourseID) 
		SELECT TOP (@NoMCQ) @ExamID,ID,Degree,CourseID FROM Questions 
		WHERE Type='MCQ' ORDER BY NEWID();

	INSERT INTO #TempExamQuestion(ExamID,QuestID,Degree,CourseID) 
		SELECT TOP (@NoTF) @ExamID,ID,Degree,CourseID FROM Questions 
		WHERE Type='T OR F' ORDER BY NEWID();

	INSERT INTO #TempExamQuestion(ExamID,QuestID,Degree,CourseID) 
		SELECT TOP (@NoText) @ExamID,ID,Degree,CourseID FROM Questions 
		WHERE Type='Text question' ORDER BY NEWID();
	IF((SELECT SUM(Degree) FROM #TempExamQuestion)=(SELECT TotalDegree FROM Exams WHERE ID=@ExamID ))
	BEGIN
		INSERT INTO Exam_Questions(ExamID,QuestID)
			SELECT ExamID,QuestID FROM #TempExamQuestion;
		RETURN 'THE QUESTIONS HAVE BEEN SELECTED AND INSERTED IN THE EXAM'
	END
	ELSE IF((SELECT SUM(Degree) FROM #TempExamQuestion)<(SELECT TotalDegree FROM Exams WHERE ID=@ExamID ))
	BEGIN
		DECLARE @Count INT;
		SET @Count=(SELECT TotalDegree FROM Exams WHERE ID=@ExamID )-(SELECT SUM(Degree) FROM #TempExamQuestion);
		PRINT 'THE SUM OF QUESTIONS DEGREES FOR QUESTIONS TYPE YOU ENTER IS LESS THAN THE EXAM TOTAL DEGREE BY:'
		RETURN @Count
	END
	ELSE
	BEGIN
		SET @Count=(SELECT SUM(Degree) FROM #TempExamQuestion)-(SELECT TotalDegree FROM Exams WHERE ID=@ExamID );
		PRINT 'THE SUM OF QUESTIONS DEGREES FOR QUESTIONS TYPE YOU ENTER IS MORE THAN THE EXAM TOTAL DEGREE BY:'
		RETURN @Count
	END
END



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


SELECT * FROM Exams 





