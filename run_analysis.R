## Getting and Cleaning Data Project
## Ali

## Note that the requirement is not to do the tasks by exactly the same order
## following script gives exactly the same result as requested in the project description
## but the order of preparation is almost like below:
# 1. Merges the training and the test sets to create one data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 3. Uses descriptive activity names to name the activities in the data set
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# First read all necessary data from files
TrainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
TrainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
TrainMeasures <- read.table("UCI HAR Dataset/train/X_train.txt")
TestSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
TestActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
TestMeasures <- read.table("UCI HAR Dataset/test/X_test.txt")
FeatureNames <- read.table("UCI HAR Dataset/features.txt")
ActivityNames <- read.table("UCI HAR Dataset/activity_labels.txt")

# (1.) Combine all related data to make one full table from all observations and variables
# Note that activity column repeated delibrately to convert one of them to descriptive name
TestData <- cbind(TestSubjects, TestActivity, TestActivity, TestMeasures)
TrainData <- cbind(TrainSubjects, TrainActivity, TrainActivity, TrainMeasures)
AllData <- rbind(TrainData, TestData)

# (4.) Set meaningful column names
names(AllData) <- c("Subject_id", "Activity_id", "Activity", as.character(FeatureNames[,2]))

# (3.) Convert Activity_id to descriptive activity name inside $Activity
AllData$Activity <- factor(AllData$Activity, labels = ActivityNames[,2])

# (2.) Keep only the requested measurements and get rid of other columns
# We want to keep first 3 columns (subject and activity info) plus "mean" or "std" related columns
# Then we remove "meanFreq" related columns too because it asks mean/std "for each measurement" not for their frquency component
SelectedData <- AllData[,c(1:3, grep("mean()", names(AllData)), grep("std()", names(AllData)))]
SelectedData <- SelectedData[, -grep("meanFreq", names(SelectedData))]

# (5.) Creat final tidy data with average of each variable for each activity and subject
library(reshape2)
MeltData <- melt(SelectedData, id=c("Subject_id", "Activity_id"), measure.var=names(SelectedData)[4:69])
TidyData <- dcast(MeltData, Subject_id+Activity_id ~ variable, mean)

# Save final results to a text file
write.table(TidyData, file="TidyData.txt", row.name=FALSE)
