This Markdown file serves the purpose of a code book for the assignment found in Getting And Cleaning Data Course Project.

For this assignment, a file containing data files is given. Tidy data is to be obtained from these data files. 

-----------------------------------------------------
The basic rundown of the script goes as follow:
1) Setting up directory

2) Extract data from respective test and training file

3) Replace the variable name for a more descriptive one

4) Replace numerical observations for "activity" variable for a more descriptive one

5) Merge both train and test data frame as one data frame and make sure it is still a tidy data by creating an additional column for the type of data (namely "train" and "test")

6) Select only the mean() and std() variable column

7) Create a data frame with the average of each variable for each activity and each subject

-----------------------------------------------------
Variables named in this script includes :
1) The accelerometer and gyroscope signal data variable

2)"subject" = numeric for each individual subject

3)"activity" = character for each activity performed

4)"type" = type of data, namely test and training

Note that only the mean and standard deviation of the signals are in the final mean.df dataframe.