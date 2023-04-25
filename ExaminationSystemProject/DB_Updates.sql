CREATE TABLE Intake (
  ID INT IDENTITY(1,1) PRIMARY KEY ,
  Name VARCHAR(50) NOT NULL
);

INSERT INTO intake (Name) VALUES
  ('round 1'),
  ('round 2'),
  ('round 3'),
  ('round 4'),
  ('round 5');
  drop table intake

ALTER TABLE Exams
ALTER COLUMN StartDate DATETIME NOT NULL;

ALTER TABLE Exams
ALTER COLUMN EndDate DATETIME NOT NULL;

alter table [dbo].[Teach]
add  isActive  nvarchar(5) not null DEFAULT 'true'

alter table [dbo].[Instructors]
add  isActive  nvarchar(5) not null DEFAULT 'true'


alter table [dbo].[Courses]
add  isActive  nvarchar(5) not null DEFAULT 'true'


alter table [dbo].[Department_Info]
add  isActive  nvarchar(5) not null DEFAULT 'true'

alter table [dbo].[Student_Answers]
add mark float 

alter table [dbo].[Student_Answers]
add ExamID int 

/*ALTER TABLE Student_Answers ADD CONSTRAINT fk_ExamID
FOREIGN KEY (ExamID)
REFERENCES Exam_Questions(ExamID);*/

alter table [dbo].[Student_Answers]
add QuestID int 