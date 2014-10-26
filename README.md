GetDataProject
==============

This is the course project for Getting and Cleaning Data

The description of the assignment can be found *[here][1]*.

Project repository can be found *[here][2]*.

##Requirements##
 - R (tested on version 3.1.1 (2014-07-10))
 - Installed `reshape2` Package
 - Human Activity Recognition Using Smartphones Dataset
 - Data should be with its original structure inside the working directory

##How to run##
 - Download `run_analysis.R` (or Clone the repo) 
 - Make sure database is inside the working directory
 - run `source("run_analysis.R")` 

##How to check results##
 - Run will take few seconds because of huge data
 - Nothing will happen or be displayed if everything goes as expected
 - After process is complete, result will be saved to `TidyData.txt`
 - You can also check the final result inside `TidyData` object in the R environment
 
##Process##
 The steps of the process according to the course project are defined as follow:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The same required process is done inside the `run_analysis.R script file. However there are enough clear comments, another short explanation comes here.

It is important to notice the order of process is different from original suggestion and above steps are done in this order: 1, 4, 3, 2, 5. This is for simplicity and clarity of the code but there is no problem in the results.

 - First all necessary data files including the labels are read
 - Then they are merged to make one large dataset including all necessary data
 - After that descriptive labels and column names are assigned
 - Only required columns are copied to `SelectedData` object
 - `melt` and `dcast` functions are used to clean and summarize data to the final data structure, `TidyData`
 - Finally result is written to the file `"TidyData.txt"`



[1]: https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions
[2]: https://github.com/Ali-Akbari/GetDataProject
