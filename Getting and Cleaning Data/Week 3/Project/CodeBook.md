##Variables
- `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
- `x_data1`, `y_data` and `subject_data` merge the previous datasets for further analysis.
- `features` contains the correct names for the `x_data` dataset. These are applied by sturing the column names in `mean_and_std_features`, which is a numeric vector what can be used to extract the desired data.
- A similar approach is taken with activity names through the `activities` variable.
- `data_all` merges `x_data`, `y_data` and `subject_data` to one dataset.
- `data_AVG` contains the averages which will be stored in a `.txt` file. Average is calculated using the `dplyr` package, by chaining the `group_by` and `summarise_each` function.
