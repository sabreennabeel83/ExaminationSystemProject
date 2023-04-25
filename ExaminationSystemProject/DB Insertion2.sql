use ExaminationSystem


INSERT INTO Students( fname ,lname ,address , sex , nationalID , birthdate , username , track , intake , branch)
values
( 'Ahmed' ,'Mohammed','Quesna' , 'M' , 30004101700615 , '2000-01-10' , 'Ahmed Mohammed' , 'software testing' , '30' ,'Aswan' ),
( 'Mohamed' ,'Ragab', 'Benha' , 'M' , 30009195740615 , '2000-09-19' , 'Mohamed ragab' , 'Data analysis' , '31' , 'Quena' ),
( 'Ezzat' ,'Yasser', 'Benha' , 'M' , 29911557404811 , '1999-11-05' , 'Ezzat yasser' , 'Back end java' , '32' , 'Assuit' ),
( 'Ali' ,'Said', 'Qaha' , 'M' , 30007862457893 , '2000-05-05' , 'Ali Said' , 'System Admin' , '33' , 'Minia' ),
( 'Abdulla' ,'Galal', 'Toukh' , 'M' , 14486974123589 , '1999-01-08' , 'Abdullah Galal' , 'Devops' , '34' , 'Bani Souif' ),
( 'Lamia' ,'Mohammed', 'Cairo' , 'F' , 30005789412687 , '2001-02-15' , 'Lamia Mohamed' , 'Embeded System' , '35' , 'Menufiya' ),
( 'Mahitab' ,'Mohammed', 'Giza' , 'F' , 20004896357418 , '2001-10-10' , 'Mahitab Mohamed' , 'Machine Learning' , '36' , 'Smart village' ),
( 'Radwa' ,'Samy', 'Mansoura' , 'F' , 30009101700567 , '2000-09-10' , 'Radwa samy' , 'Flutter' , '37' , 'Sohag' ),
( 'Nourhan' ,'Ismail', 'Cairo' , 'F' , 30015789634785 , '2001-04-07' , 'Nourhan ismail' , 'Android' , '38' , 'Alexandria' ),
( 'Sabreen' ,'Nabil', 'Alex' , 'F' , 29904569824574 , '1998-06-17' , 'Sabreen Nabil' , 'AI' , '40' , 'Mansoura' );

INSERT INTO Departments(name)
VALUES
('Information Technology'),
('Mechanical Engineering'),
('Bussiness'),
('Media')
;
INSERT INTO Department_Info(DeptID,branch ,track,MangerID )
VALUES
  (1,'aswan','software testing',1),
  (1,'cairo','software devlopment',1),
  (2,'aswan','software testing',3),
  (3,'mansoura','management',4),
  (1,'aswan','back-end',5),
  (3,'alex','management',4),
  (4,'aswan','digital marketing',7),
  (1,'cairo','front-end',1);


INSERT INTO Courses( Name,DeptID,MaxDegree,MinDegree,Description)
		values
				('software testing',001,50,25,'Explaining of ISTQB-FL'),
			    ('software devlopment',001,50,25,'Explaining of dev_fundamentals' ),
				('management fundamentals',003,50,25,'Explaining of management'), 
				('scada system',002,50,25,'Explaining of scada'), 
				('digital marketing',004,30,15,'Explaining of marketing')




  INSERT INTO Instructors ( Name, Email,deptID, Birthdate, Username, TrainingManager)
		VALUES
  ('Ahmed', 'ahmed@example.com', 1, '1985-01-01', 'ahmed85',null ),
  ('Mohamed', 'mohamed@example.com',1, '1980-02-15', 'mohamed80', 1),
  ('Reda', 'reda@example.com', 2, '1990-05-31', 'reda90',null),
  ('Mahmoud', 'mahmoud@example.com', 3, '1982-09-10', 'mahmoud82',null),
  ('Nour', 'nour@example.com', 4, '1988-12-20', 'nour88', null),
  ('Fatma', 'fatma@example.com',1, '1995-03-05', 'fatma95', 4),
  ('Khaled', 'khaled@example.com',2, '1987-06-15', 'khaled87',null),
  ('Reem', 'reem@example.com', 3, '1993-09-01', 'reem93', 3),
  ('Amir', 'amir@example.com', 1, '1984-11-25', 'amir84', 1),
  ('Ramy', 'ramy@example.com', 1, '1991-04-10', 'ramy91', 1);


insert into Questions( Degree, CourseID , [Type],Q_body,Answer)
values(2,1,'Text question','How many bits in byte', '8'),
(2,1,'Text question','What does CPU stand for in computers?','central processing unit'),
(2,1,'Text question','wha does RAM stands for?','Random Access Memory'),
(1,1,'T OR F','Does Nomalization reduce data redundancy','T'),
(1,1,'T OR F','Does insert command come under DDL?','F'),
(1,1,'MCQ','Identify the command which is used to remove files?','rm'),
(1,1,'MCQ','Identify the one which is not a communication command','grep')

insert into Options(text,IsAnswer,QuestID)
values
('cat',0,6),
('rm',1,6),
('dm',0,6),
('mail',0,7),
('greb',1,7),
('write',0,7)

select * from  Instructors
