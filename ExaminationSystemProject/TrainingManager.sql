use [ExaminationSystem.bacpac]
/*Training Manager  can edit (add, Update and
delete) instructors*/

/*add instractor*/
create PROCEDURE add_instractors
@insName nvarchar(20),@email  nvarchar(20), @depId int , @birth_date date ,
@user_name nvarchar(20),@train_manger int 
AS
BEGIN
    
        INSERT INTO [dbo].[Instructors] ( [name] , [email] ,[deptID] ,[birthdate] ,[username],[trainingManager])
        VALUES ( @insName,@email,@depId, @birth_date ,@user_name,@train_manger)
    END
   
--exec addd_instractors  'gggh', 'salem@gmail.com', 3, '1990-01-01', 'ffffffff', 5

/*###################################################*/
 /*update instractor*/
 CREATE PROCEDURE update_instractor
 @id int ,@insName nvarchar(20),@email  nvarchar(20)
 ,@depId int , @birth_date date , @user_name nvarchar(20),@train_manger int ,
 @password nvarchar(20) 
AS
BEGIN
 
	  UPDATE [dbo].[Instructors]
    SET  [name]= @insName, email =@email,[deptID] =@depId,
 [birthdate]=@birth_date ,username=@user_name,[trainingManager] =@train_manger
    WHERE id = @id
ENd
    
  /*################################################*/
  /*delete instractor*/
  create procedure  deleteInstructor @id int 
 as
 begin
 
	update  Instructors  set isActive= 'false'
WHERE Id =@id ;

	 END
    

 
 --***********************************************************************
 --***********************************************************************
 --***********************************************************************
 --***********************************************************************
 /*Training Manager  can edit (add, Update and delete) courses */

/*add course*/
CREATE PROCEDURE add_course
@courseName nvarchar(20),@dep_id  int 
 ,@maxDegree int , @minDegree int , @description nvarchar(20)
AS
BEGIN

  INSERT INTO [dbo].[Courses]
(  [name]  ,[deptID] ,[MaxDegree]
  ,  [MinDegree] ,[Description])

    VALUES ( @courseName,@dep_id, @maxDegree ,@minDegree,@description)
	 END
   
--###############################################################
 /*update course*/
 CREATE PROCEDURE update_course
@id int ,@courseName nvarchar(20),@dep_id  int 
 ,@maxDegree int , @minDegree int , @description nvarchar(20)  
    
AS
BEGIN
 
	 UPDATE [dbo].[Courses]
    SET  [name]=@courseName ,[deptID] =@dep_id,
[MaxDegree]=@maxDegree ,[MinDegree]=@minDegree,[Description]=@description
    WHERE id = @id
	 END

   --###############################################################
/*delete course*/
   create procedure  deletecourse (@id int )
 as
 begin
 
	 update  [dbo].[Courses]  set isActive= 'false'
	  WHERE Id =@id ;
	 END
   
--***********************************************************************************
--***********************************************************************************
--***********************************************************************************
                 /*edit instractor for each course*/

create PROCEDURE add_instractor_for_course
@courseid int ,@instractor_id  int ,@studid int
 ,@class int     
AS
BEGIN

	 insert into [dbo].[Teach] ([CourseID],[InstID],[StudID],[Class])
    values( @courseid,@instractor_id,@studid,@class)
    

	 END

create PROCEDURE update_instractor_for_course
@courseid int ,@instractor_id  int ,@studid int
 ,@class int     
AS
BEGIN

	 UPDATE [dbo].[Teach]
    SET [CourseID]=@courseid,[InstID]=@instractor_id,[Class]=@class,[StudID]=@studid
    WHERE [CourseID] = @courseid

	 END

	 create procedure  delete_instractor_for_course (@courseid int )
 as
 begin
 
	 update  [dbo].[Teach]  set isActive= 'false'
	  WHERE [CourseID] =@courseid ;
	 END
   
 --***********************************************************************
 /*Training manager can add and edit: Branches, tracks in each department*/
 /*add branch and track */
 alter PROCEDURE add_track_and_branch
 @id int ,@dep_id int ,
@branchName nvarchar(20), @trackName nvarchar(20) ,@mgr_id int
AS
BEGIN

	INSERT INTO [dbo].[Department_Info]
([ID],[DeptID],[Branch],[Track],[MangerID] )

    VALUES (@id,@dep_id,@branchName,@trackName,@mgr_id)


	 END
   
    

 /*update track and course*/
 alter PROCEDURE update_track_and_branch
 @id int ,
 @branchName nvarchar(20), @trackName nvarchar(20)
    
AS
BEGIN
 
	UPDATE [dbo].[Department_Info]
    SET [Branch]=@branchName,[Track]=@trackName
    WHERE id = @id 
	 END
    
 /*delete track and branch*/
   create procedure  delete_track_and_branch  (@id int )
 as
 begin
 
	 update [dbo].[Department_Info]   set isActive= 'false'
	 WHERE Id =@id ;
	 END
    
 --***********************************************************************
 /*Training manager can add intake*/
 CREATE PROCEDURE add_intake
 @intakeName nvarchar(20),@id int
AS
BEGIN

	INSERT INTO intake ( id, name)

    VALUES (@id,@intakeName)

	 END
   

 /*Training manager can add students, and define their personal data, intake,
branch, and track.*/
/*Training manager can add students*/
 CREATE PROCEDURE add_student
 @fName nvarchar(20),@lName nvarchar(20),@addres nvarchar(20),@sex char ,
@national_id nvarchar(20),@birthDate date, @userName nvarchar(20) , @branchName nvarchar(20),
@trackName nvarchar(20),@intakeid int 
AS
BEGIN
 
	INSERT INTO [dbo].[Students]
([fname],[lname],[address],[sex],[nationalID],[birthdate],[username],[track],[intake],
[Branch] )

    VALUES (@fName,@lName,@addres,@sex,@national_id,@birthDate,@userName,@branchName,
	@trackName,@intakeid)

	 END
    
/*Training manager  define student personal data, intake,
branch, and track.*/
   create procedure  define_student_personal_Data  (@id int )
 as
 begin
 
	select [fname],[lname],[address],[sex],[nationalID]
from[dbo].[Students]
   WHERE Id =@id 
   END
   

 /*define_student_track_branch_intake*/
    create procedure  define_student_track_branch_intake   (@id int )
 as
 begin
  
	select [track],[intake],[branch]
from[dbo].[Students]
WHERE Id =@id ;
	 END
  



 /***********************************************************/
 --*******************************************************************************************
 --*******************************************************************************************
 --*******************************************************************************************--*******************************************************************************************
 --*******************************************************************************************
 --*******************************************************************************************
 
/*tables*/
CREATE TABLE intake (
  id INT NOT NULL  PRIMARY KEY ,
  name VARCHAR(50) NOT NULL
);

INSERT INTO intake (id, name) VALUES
  (1, 'round 1'),
  (2, 'round 2'),
  (3, 'round 3'),
  (4, 'round 4'),
  (5, 'round 5');
  drop table intake


alter table [dbo].[Teach]
add  isActive  nvarchar(5) not null DEFAULT 'true'

alter table [dbo].[Instructors]
add  isActive  nvarchar(5) not null DEFAULT 'true'


alter table [dbo].[Courses]
add  isActive  nvarchar(5) not null DEFAULT 'true'


alter table [dbo].[Department_Info]
add  isActive  nvarchar(5) not null DEFAULT 'true'

--*******************************************************************************************
--*******************************************************************************************
--*******************************************************************************************
--*******************************************************************************************
--*******************************************************************************************
--*******************************************************************************************
--*******************************************************************************************


/*triggers*/
Create OR ALTER TRIGGER TrainMgr_edit_instractor ON [dbo].[Instructors]
instead of INSERT, UPDATE, DELETE
AS
BEGIN
	if NOT EXISTS (select [trainingManager] from [dbo].[Instructors] 
	where [trainingManager] is null 
	and username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)))
    BEGIN
        RAISERROR('Only the training manager can add instructors.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

Create OR ALTER TRIGGER TrainMgr_edit_course ON [dbo].[Courses]
instead of INSERT, UPDATE, DELETE
AS
BEGIN
	if NOT EXISTS (select [trainingManager] from [dbo].[Instructors] 
	where [trainingManager] is null 
	and username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)))
    BEGIN
        RAISERROR('Only the training manager can add instructors.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

Create OR ALTER TRIGGER edit_instractor_for_course ON [dbo].[Teach]
instead of insert, update ,delete
AS
BEGIN
	if NOT EXISTS (select [trainingManager] from [dbo].[Instructors] 
	where [trainingManager] is null 
	and username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)))
    BEGIN
        RAISERROR('Only the training manager can add instructors.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

Create OR ALTER TRIGGER TrainMgr_edit_branch_track ON [dbo].[Department_Info]
instead of INSERT, UPDATE, DELETE
AS
BEGIN
	if NOT EXISTS (select [trainingManager] from [dbo].[Instructors] 
	where [trainingManager] is null 
	and username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)))
    BEGIN
        RAISERROR('Only the training manager can add instructors.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

Create OR ALTER TRIGGER TrainMgr_edit_student ON [dbo].[Students]
instead of INSERT, UPDATE, DELETE
AS
BEGIN
	if NOT EXISTS (select [trainingManager] from [dbo].[Instructors] 
	where [trainingManager] is null 
	and username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)))
    BEGIN
        RAISERROR('Only the training manager can add instructors.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END

Create OR ALTER TRIGGER TrainMgr_edit_intake ON Intake
instead of INSERT
AS
BEGIN
	if NOT EXISTS (select [trainingManager] from [dbo].[Instructors] 
	where [trainingManager] is null 
	and username=(SELECT SUBSTRING((Select SUSER_NAME()), 1, CHARINDEX('\', (Select SUSER_NAME())) - 1)))
    BEGIN
        RAISERROR('Only the training manager can add instructors.', 16, 1);
        ROLLBACK TRANSACTION;
    END

END
