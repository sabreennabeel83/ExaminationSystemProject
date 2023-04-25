
------------------------------------Procedures & Functions---------------------------------------

--------------To Create New Exam
EXEC CreateExam 
	@Type='corrective',
    @CourseID=1,
	@StartDate ='2023-04-17 10:00:00',
	@EndDate ='2023-04-17 12:00:00',
	@InstID= 1,
	@QuestNums =3,
	@Year =2023,
	@TotalDegree =4,
	@Intake='ITI 4 months 2022',
	@Track ='Testing',
	@Branch ='Aswan';

--------------To Insert Exam Questions Randomly
EXEC InsertExamQuestManually
	@ExamID =1,
	@QuestID =1;

--------------To Insert Exam Questions Manually
EXEC InsertExamQuestRandomly
@ExamID =1,
@NoMCQ =1,
@NoTF =2,
@NoText =1;
select * from Exam_Questions
--------------To Show Allowed Exams for Specific Student
EXEC ShowAllowedExams
@StdID =5




------------------------------------Views---------------------------------------

--------------To Display All Questions
SELECT * FROM QuestionsPool;

--------------To Display All Exams and its Questions
SELECT * FROM AllExamsQuests;

--------------To Display All Exams,Questions and its Answers
SELECT * FROM AllExamsQuestsAnswer;


------------------------------------Triggers---------------------------------------

--TrEditExam ON Exams to stop anyone who is trying to INSERT, UPDATE, DELETE 
--on exams that don't belong to him 


--TrEditExamQuest ON Exam_Questions to stop anyone who is trying to INSERT, UPDATE, DELETE
--on Exam's Questions that don't belong to him

--TrEditAllowedStudForExam ON AllowedStudForExam to stop anyone who is trying to INSERT, UPDATE, DELETE
--on Student that don't belong to him