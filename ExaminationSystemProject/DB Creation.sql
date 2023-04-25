use ExaminationSystem;
CREATE TABLE Students (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  fname NVARCHAR(50) NOT NULL,
  lname NVARCHAR(50) NOT NULL,
  address NVARCHAR(100) NOT NULL,
  sex CHAR(1) NOT NULL,
  nationalID NVARCHAR(20) UNIQUE NOT NULL,
  birthdate DATE NOT NULL,
  username NVARCHAR(50) NOT NULL,
  track NVARCHAR(50) NOT NULL,
  intake NVARCHAR(10) NOT NULL,
  branch NVARCHAR(50) NOT NULL
);
Drop table Students

CREATE TABLE Courses (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  DeptID INT NOT NULL,
  MaxDegree FLOAT NOT NULL,
  MinDegree FLOAT NOT NULL,
  Description NVARCHAR(255)  NOT NULL
);

ALTER TABLE Courses ADD CONSTRAINT fk_CourseDeptID
FOREIGN KEY (DeptID)
REFERENCES Departments(ID);

Drop table Courses


CREATE TABLE Departments (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(50) NOT NULL,
);

CREATE TABLE Department_Info (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  DeptID INT NOT NULL,
  Branch  NVARCHAR(50) NOT NULL,
  Track NVARCHAR(50) NULL,
  MangerID  int  NULL,

);
ALTER TABLE Department_Info ADD CONSTRAINT fk_MangerID 
FOREIGN KEY (MangerID) 
REFERENCES Instructors(ID);
ALTER TABLE Department_Info ALTER column MangerID INT  NULL;
ALTER TABLE Department_Info DROP CONSTRAINT fk_MangerID;
Drop table Departments

CREATE TABLE Instructors (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(20) NOT NULL,
  email NVARCHAR(50) UNIQUE,
  deptID INT NOT NULL,
  birthdate DATE,
  username NVARCHAR(50) NOT NULL,
  trainingManager INT NULL
);
ALTER TABLE Instructors ADD CONSTRAINT fk_InstTrainingManager
FOREIGN KEY (trainingManager)
REFERENCES Instructors(ID);
ALTER TABLE Instructors DROP CONSTRAINT fk_InstTrainingManager;


ALTER TABLE Instructors ADD CONSTRAINT fk_deptID
FOREIGN KEY (deptID)
REFERENCES Departments(ID);
ALTER TABLE Instructors DROP CONSTRAINT fk_deptID;



Drop table Instructors


CREATE TABLE Questions(
ID INT IDENTITY(1,1) PRIMARY KEY,
Degree INT NOT NULL,
CourseID INT NOT NULL,
Type NVARCHAR(50) NOT NULL ,
Q_body NVARCHAR(550) NOT NULL,
Answer NVARCHAR(550) NOT NULL
);
ALTER TABLE Questions ADD CONSTRAINT fk_CourseID
FOREIGN KEY (CourseID)
REFERENCES Courses(ID);

ALTER TABLE Questions DROP CONSTRAINT fk_CourseID;

drop table Questions

CREATE TABLE Options(
ID INT IDENTITY(1,1) PRIMARY KEY,
Text NVARCHAR(50) NOT NULL,
IsAnswer BIT NOT NULL DEFAULT (0),
QuestID INT NOT NULL
);
ALTER TABLE Options ADD CONSTRAINT fk_QuestID
FOREIGN KEY (QuestID)
REFERENCES Questions(ID);

ALTER TABLE Options DROP CONSTRAINT fk_QuestID;
drop table Options

CREATE TABLE Exams (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Type NVARCHAR(50) NOT NULL,
  CourseID INT NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  InstID INT NOT NULL,
  QuestNums INT NOT NULL,
  Year INT NOT NULL,
  TotalDegree FLOAT NOT NULL,
  Allowance NVARCHAR(50),
  Intake NVARCHAR(10) NOT NULL,
  Track NVARCHAR(50) NOT NULL,
  Branch NVARCHAR(50) NOT NULL,
  
);
ALTER TABLE Exams ADD CONSTRAINT fk_ExamInstructorsID
FOREIGN KEY (InstID)
REFERENCES Instructors(ID);

ALTER TABLE Exams DROP CONSTRAINT fk_ExamInstructorsID;


ALTER TABLE Exams ADD CONSTRAINT fk_ExamCourseID
FOREIGN KEY (CourseID)
REFERENCES Courses(ID);

ALTER TABLE Exams DROP CONSTRAINT fk_ExamCourseID;


CREATE TABLE Exam_Questions(
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ExamID INT NOT NULL,
  QuestID INT NOT NULL,
);
ALTER TABLE Exam_Questions ADD CONSTRAINT fk_ExamIDofExam_Questions
FOREIGN KEY (ExamID)
REFERENCES Exams(ID);

ALTER TABLE Exam_Questions ADD CONSTRAINT fk_QuestIDofExam_Questions
FOREIGN KEY (QuestID)
REFERENCES Questions(ID);

ALTER TABLE Exam_Questions DROP CONSTRAINT fk_QuestIDofExam_Questions;


CREATE TABLE Student_Answers(
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ExamQuestID INT NOT NULL,
  StudID INT NOT NULL,
  StudAnswer NVARCHAR(500) NOT NULL,
);
ALTER TABLE Student_Answers ADD CONSTRAINT fk_ExamQuestID
FOREIGN KEY (ExamQuestID)
REFERENCES Exam_Questions(ID);
ALTER TABLE Student_Answers ADD CONSTRAINT fk_StudIDinStudentAnswer
FOREIGN KEY (StudID)
REFERENCES Students(ID);


CREATE TABLE Teach (
  CourseID INT NOT NULL ,
  InstID INT NOT NULL,
  StudID INT NOT NULL,
  Class INT NOT NULL

  FOREIGN KEY (CourseID) REFERENCES Courses(ID),
  FOREIGN KEY (InstID) REFERENCES Instructors(ID),
  FOREIGN KEY (StudID) REFERENCES Students(ID),
  PRIMARY KEY (CourseID, InstID,StudID)
);

drop table Teach

CREATE TABLE AllowedStudForExam(
  StudID INT NOT NULL,
  ExamID INT NOT NULL,
  FOREIGN KEY (StudID) REFERENCES Students(ID),
  FOREIGN KEY (ExamID) REFERENCES Exams(ID),
  PRIMARY KEY (ExamID,StudID)
);



