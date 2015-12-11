## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##optional step 0: set work directory.
setwd("C:/DataScienceCoursera/Getting and Cleaning Data/Week 3/Project/")


##Step1.
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
dim(trainData) # 7352*561
head(trainData)
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(testData) # 2947*561
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
joinData <- rbind(trainData, testData)
dim(joinData) # 10299*561
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) # 10299*1
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) # 10299*1



##Make sure I have the following:

##Please upload the tidy data set created in step 5 of the instructions. 
##Please upload your data set as a txt file created with write.table() using row.name=FALSE 
##(do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).


##Please submit a link to a Github repo with the code for performing your analysis. The code should have 
##a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. 
##The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing 
##how the script works and the code book describing the variables.