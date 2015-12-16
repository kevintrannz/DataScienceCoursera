##Introduction
The script `run_analysis.R` performs the five steps described in the course project's definition. These steps will be listed
below and they can be found in the script as well.

<ol>
<li>First, all the similar data is merged using the 'rbind()' function. By similar, we address those files having the same number
of columns and referring to the same entities.</li>
<li>Second, the measurements on the mean and standard eviation are extracted using the `grep` function. Together with the outcome of the
`grep` function a subset is done on the `x_data` dataset. Then the (column)names of `x_data` are changed using a subset of the `features` variable.</li>
<li>Third, the `activity_labels` variable is created using the txt file provided by the assignment. Then the `y_data` values are updated using a subset from the
`activity_labels` variable. After that the column name of `y_data` is changed to 'Activity' </li>
<li>Fourth, the column name of `subject_data` is changed to 'Subject'. After that `x_data`, `y_data` and `subject_data` is merged using the `c_bind` function. This merge forms
the new `data_all` variable.</li>
<li>Last, using the dplyr package (learned in the swirl assignment) a chain is created to average the `data_all` variable. For this task the functions `group_by` and `summarise_each` are used. After that the
result `data_AVG` is saved as a `.txt` file.</li>
</ol>

##Variables
- `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
- `x_data1`, `y_data` and `subject_data` merge the previous datasets for further analysis.
- `features` contains the correct names for the `x_data` dataset. These are applied by sturing the column names in `mean_and_std_features`, which is a numeric vector what can be used to extract the desired data.
- A similar approach is taken with activity names through the `activities` variable.
- `data_all` merges `x_data`, `y_data` and `subject_data` to one dataset.
- `data_AVG` contains the averages which will be stored in a `.txt` file. Average is calculated using the `dplyr` package, by chaining the `group_by` and `summarise_each` function.
