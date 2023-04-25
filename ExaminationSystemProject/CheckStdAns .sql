Alter FUNCTION dbo.Gradestudent (@answer nvarchar(max))
RETURNS nvarchar(50)
AS
BEGIN

/*if found grade in norhan the table so no need for variable grade   */
    DECLARE @grade nvarchar(50);
    DECLARE @accepted_answer_pattern nvarchar(max);
    DECLARE @partial_answer_pattern nvarchar(max);
    
    SET @grade = '0';
    SET @accepted_answer_pattern = '%accepted_answer_pattern%';
    SET @partial_answer_pattern = '%partial_answer_pattern%';
    
    IF @answer IS NULL OR @answer = ''
    BEGIN
        SET @grade = '0';
    END
    ELSE IF @answer LIKE @accepted_answer_pattern
    BEGIN
        SET @grade = 'full_marks';
    END
    ELSE IF @answer LIKE @partial_answer_pattern
    BEGIN
        SET @grade = 'partial_marks';
    END

    RETURN @grade;
END

/* select *from Student_Answer */

/* SELECT CURRENT_USER;‏ */

CREATE DATABASE ExaminationSystem_Snapshot ON 
( NAME = [ExaminationSystem.bacpac], FILENAME = 'C:\Users\ragab afify\Documents\SQL Server Management Studio' )
AS SNAPSHOT OF [ExaminationSystem.bacpac];
BACKUP DATABASE ExaminationSystem TO DISK = 'D:\ExaminationSystem.bak'
