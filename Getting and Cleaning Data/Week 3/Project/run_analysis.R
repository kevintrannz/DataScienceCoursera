##optional step 0: set work directory.
setwd("C:/DataScienceCoursera/Getting and Cleaning Data/Week 3/Project/")


##Step1: Merges the training and the test sets to create one data set.
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

##create x data set
x_data <- rbind(x_train, x_test)

##create y data set
y_data <- rbind(y_train, y_test)

##create subject data set
subject_data <- rbind(subject_train, subject_test)


##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt")

## get only columns with mean() or std() in their names.
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

##Subset desired columns
x_data <- x_data[, mean_and_std_features]

##Change names
names(x_data) <- features[mean_and_std_features, 2]


## Step 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activity_labels[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"


## step 4. Appropriately labels the data set with descriptive variable names. 

## Change column name
names(subject_data) <- "Subject"

##Create single data set
data_all <- cbind(x_data, y_data, subject_data)


## Step 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
library(dplyr)

##Use dplyr function (learned in the swirl course) to chain the functions (Gotta love dplyr ^^)!
data_AVG <- data_all %>%
            group_by(activity, Subject) %>%
                summarise_each(funs(mean))


#Create txt file containing the output
write.table(data_AVG, "data_AVG.txt", row.names = FALSE)


##Make sure I have the following:

##Please upload the tidy data set created in step 5 of the instructions. 
##Please upload your data set as a txt file created with write.table() using row.name=FALSE 
##(do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).


##Please submit a link to a Github repo with the code for performing your analysis. The code should have 
##a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. 
##The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing 
##how the script works and the code book describing the variables.