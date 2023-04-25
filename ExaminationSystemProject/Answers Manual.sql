------------------------------------Procedures & Functions---------------------------------------

--------------To Store student Answers
EXEC [dbo].[Store_Students_Answers]
		@Exams_ID = 5,
		@Quest_id = 1,
		@Student_ID = 1,
		@StudentAnswer = N'8'

select * from Store_students_answers

--------------To Show Final grade 
DECLARE	@return_value int,
		@Final_result float
EXEC [dbo].[Calc_students_grades]
		@Exams_ID = 5,
		@Student_ID = 1,
		@Final_result = @Final_result OUTPUT
