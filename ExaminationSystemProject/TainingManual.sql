

/*trainingmanger can add instractor*/


	exec add_instractors 

	@insName  ='mohamed',
	@email ='salem@gmail.com',
	@depId=3, 
	@birth_date='1990-01-01' ,
	@user_name = mohamed97,
	@train_manger=5

	/*trainingmanger can update instractor*/

	 
	exec update_instractor
	
	@id=1,
	@insName  ='mohamed',
	@email ='salem@gmail.com',
	@depId=3, 
	@birth_date='1990-01-01' ,
	@user_name = mohamed97,
	@train_manger=5
	 
	 	/*trainingmanger can update instractor*/


		 exec deleteInstructor @id= 4 

		 /*trainingmanger can add courses*/
	 
	 exec add_course  

	@courseName ='testing' 
    ,@dep_id =5 
   ,@maxDegree= 50  ,
	@minDegree  =25, 
   @description ='fffffffffff'
  
  
  /*trainingmanger can update courses*/
	 
	 exec update_course  
	 @id=3,
	@courseName ='testing' 
    ,@dep_id =5 
   ,@maxDegree= 50  ,
	@minDegree  =25, 
   @description ='fffffffffff'
    
	/*trainingmanger can delete courses*/

	 	 exec deletecourse  

		 @id=3

		  	/*trainingmanger can add_instractor_for_course*/

		    exec add_instractor_for_course 
		   @courseid =1,
		   @instractor_id =3
		   ,@studid =4
		   ,@class =5
 

  	/*trainingmanger can UPDATE_instractor_for_course*/
		 	
			
	  exec update_instractor_for_course 
	   @courseid =1,
	   @instractor_id =3
	   ,@studid =4
       ,@class =5
 
   	/*trainingmanger can DELETE_instractor_for_course*/

   exec delete_instractor_for_course 
	   @courseid =1


	    /* trainingmanger add branch and track */

	     exec add_track_and_branch
		   @dep_id =4 ,
        @branchName ='aswan',
		@trackName ='testing' ,
		@mgr_id ='4'
	  

	   /*trainingmanger update track and course*/
	   	   exec update_track_and_branch
		   @id =4 ,
        @branchName ='aswan',
		@trackName ='testing' 
	  
	   /*trainingmanger delete track and branch*/

	      exec delete_track_and_branch
		   @id =4 
        /*Training manager can add intake*/

   	   exec add_intake
		   @id =4 ,
        @intakeName ='round3'
		 
		 /*Training manager can add students*/
 exec add_student 
	 @fName ='mohamed',
	 @lName ='salem'
	 ,@addres='quesna' ,
	 @sex  ='m',
	@national_id ='29708301701871',
	@birthDate ='1990-01-01', 
	@userName= 'pawlo' ,
	@branchName= 'aswan',
	@trackName= 'testing',
	@intakeid=  '3'

	/*Training manager  define student personal data, intake,
branch, and track.*/
     exec define_student_personal_Data 
	@id= 2

	 /*define_student_track_branch_intake*/

	   exec define_student_track_branch_intake 
		@id= 2