CodeBook
==============

This is a short script in R in order to make simple process on the input data files and make a tidy summary of them. The input database is originally [Human Activity Recognition Using Smartphones Dataset][1] in its original structure.

The steps of the process according to the [course project][2] are defined as follow:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Process##
The same required process is done inside the `run_analysis.R script file. However there are enough clear comments, another short explanation comes here.

It is important to notice the order of process is different from original suggestion and above steps are done in this order: 1, 4, 3, 2, 5. This is for simplicity and clarity of the code but there is no problem in the results.

 - First all necessary data files including the labels are read
 - Then they are merged to make one large dataset including all necessary data
 - After that descriptive labels and column names are assigned
 - Only required columns are copied to `SelectedData` object
 - `melt` and `dcast` functions are used to clean and summarize data to the final data structure, `TidyData`
 - Finally result is written to the file `"TidyData.txt"`
 
 ##Important intermediate data##
 - AllData: Contains all of the codes and measurements after merging the tables
 - SelectedData: Result after removing unwanted columns
 - MeltData: intermediate result after meltdown and ready for reshaping
 - TidyData: Final summarized data including average of selected variables for each pair of Subject-Activity

##Data description##
Here are the variable names of the final data table that is saved to the disk.

The first two columns are test Subject and Activity ID respectively and the rest are containing the average of the mentioned measurement calculated in that group of Subject-Activity.

 (1) "Subject_id"                 
 (2) "Activity_id"                
 (3) "tBodyAcc-mean()-X"          
 (4) "tBodyAcc-mean()-Y"          
 (5) "tBodyAcc-mean()-Z"          
 (6) "tGravityAcc-mean()-X"       
 (7) "tGravityAcc-mean()-Y"       
 (8) "tGravityAcc-mean()-Z"       
 (9) "tBodyAccJerk-mean()-X"      
(10) "tBodyAccJerk-mean()-Y"      
(11) "tBodyAccJerk-mean()-Z"      
(12) "tBodyGyro-mean()-X"         
(13) "tBodyGyro-mean()-Y"         
(14) "tBodyGyro-mean()-Z"         
(15) "tBodyGyroJerk-mean()-X"     
(16) "tBodyGyroJerk-mean()-Y"     
(17) "tBodyGyroJerk-mean()-Z"     
(18) "tBodyAccMag-mean()"         
(19) "tGravityAccMag-mean()"      
(20) "tBodyAccJerkMag-mean()"     
(21) "tBodyGyroMag-mean()"        
(22) "tBodyGyroJerkMag-mean()"    
(23) "fBodyAcc-mean()-X"          
(24) "fBodyAcc-mean()-Y"          
(25) "fBodyAcc-mean()-Z"          
(26) "fBodyAccJerk-mean()-X"      
(27) "fBodyAccJerk-mean()-Y"      
(28) "fBodyAccJerk-mean()-Z"      
(29) "fBodyGyro-mean()-X"         
(30) "fBodyGyro-mean()-Y"         
(31) "fBodyGyro-mean()-Z"         
(32) "fBodyAccMag-mean()"         
(33) "fBodyBodyAccJerkMag-mean()" 
(34) "fBodyBodyGyroMag-mean()"    
(35) "fBodyBodyGyroJerkMag-mean()"
(36) "tBodyAcc-std()-X"           
(37) "tBodyAcc-std()-Y"           
(38) "tBodyAcc-std()-Z"           
(39) "tGravityAcc-std()-X"        
(40) "tGravityAcc-std()-Y"        
(41) "tGravityAcc-std()-Z"        
(42) "tBodyAccJerk-std()-X"       
(43) "tBodyAccJerk-std()-Y"       
(44) "tBodyAccJerk-std()-Z"       
(45) "tBodyGyro-std()-X"          
(46) "tBodyGyro-std()-Y"          
(47) "tBodyGyro-std()-Z"          
(48) "tBodyGyroJerk-std()-X"      
(49) "tBodyGyroJerk-std()-Y"      
(50) "tBodyGyroJerk-std()-Z"      
(51) "tBodyAccMag-std()"          
(52) "tGravityAccMag-std()"       
(53) "tBodyAccJerkMag-std()"      
(54) "tBodyGyroMag-std()"         
(55) "tBodyGyroJerkMag-std()"     
(56) "fBodyAcc-std()-X"           
(57) "fBodyAcc-std()-Y"           
(58) "fBodyAcc-std()-Z"           
(59) "fBodyAccJerk-std()-X"       
(60) "fBodyAccJerk-std()-Y"       
(61) "fBodyAccJerk-std()-Z"       
(62) "fBodyGyro-std()-X"          
(63) "fBodyGyro-std()-Y"          
(64) "fBodyGyro-std()-Z"          
(65) "fBodyAccMag-std()"          
(66) "fBodyBodyAccJerkMag-std()"  
(67) "fBodyBodyGyroMag-std()"     
(68) "fBodyBodyGyroJerkMag-std()" 

[1]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[2]:https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions

