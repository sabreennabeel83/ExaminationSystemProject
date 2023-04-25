USE ExaminationSystem;

CREATE OR ALTER VIEW QuestionsPool
AS
SELECT *
FROM Questions;

CREATE VIEW AllExamsQuests
AS
SELECT E.ID,E.CourseID,E.[Year],Q.ID AS QuestionID,Q.Type,Q_body 
	FROM Exams AS E, Exam_Questions AS EQ, Questions AS Q
		WHERE E.ID=EQ.ExamID AND Q.ID=EQ.QuestID

CREATE VIEW AllExamsQuestsAnswer
AS
SELECT E.ID,E.CourseID,E.[Year],Q.ID AS QuestionID,Q.Type,Q_body,Q.Answer
	FROM Exams AS E, Exam_Questions AS EQ, Questions AS Q
		WHERE E.ID=EQ.ExamID AND Q.ID=EQ.QuestID




select * from AllExamsQuests



