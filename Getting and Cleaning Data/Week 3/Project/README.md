#Getting and Cleaning Data - Course Project
This repository contains the R code and documentation files for the Coursera Data Science's track course 'Getting and Cleaning data'.

Information about the dataset that has been used can be found here: <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones</a>

#Files
This code takes for granted that the data is present in a folder in a folder named `UCI HAR Dataset`. This
folder named above should be present in the same folder as the project files.

`Codebook.md` contains a description for all the variables.

`run_analysis.R` contains all the code to perform the analyses described in 5 steps. 

The output of the 5th step from the `run_analysis.R` file is called `data_AVG.txt`. This is uploaded in the
root folder of the current directory.

##Explanation of code
The script `run_analysis.R` performs the five steps described in the course project's definition. These steps will be listed
below and they can be found in the script as well.


- First, all the similar data is merged using the `rbind` function. By similar, we address those files having the same number
of columns and referring to the same entities.
- Second, the measurements on the mean and standard eviation are extracted using the `grep` function. Together with the outcome of the
`grep` function a subset is done on the `x_data` dataset. Then the (column)names of `x_data` are changed using a subset of the `features` variable.
- Third, the `activity_labels` variable is created using the txt file provided by the assignment. Then the `y_data` values are updated using a subset from the
`activity_labels` variable. After that the column name of `y_data` is changed to 'Activity' 
- Fourth, the column name of `subject_data` is changed to 'Subject'. After that `x_data`, `y_data` and `subject_data` is merged using the `c_bind` function. This merge forms
the new `data_all` variable.
- Lastly, using the dplyr package (learned in the swirl assignment) a chain is created to average the `data_all` variable. For this task the functions `group_by` and `summarise_each` are used. After that the
result `data_AVG` is saved as a `.txt` file.