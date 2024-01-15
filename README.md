# HumanActivitySmartphones
Peer-graded Assignment: Getting and Cleaning Data Course Project

Objective is to create one R script called run_analysis.R that does the following:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Content of the repo
- CodeBook
- run_analysis.R
- Files Tidy.csv and Tidy_Mean.csv
# Workflow in run_analysis.R
1. Download and extract zip-file to data folder
2. Read files listed under Description of the data into R
3. Rbind and Cbind the data into one untidy tibble "Untidy"
4. Convert into tidy tibble
5. Summarize mean for by subject and by activity
6. Save step 4. to .csv file Tidy.csv
7. Save step 5. to .csv file Tidy_Mean.csv
8. Save step 5. to .txt file Tidy_Mean.txt
See also the comments in run_analyis.R
