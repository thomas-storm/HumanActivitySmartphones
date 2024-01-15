# CodeBook for HumanActivitySmartphones
Peer-graded Assignment: Getting and Cleaning Data Course Project
# Data Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Used Data 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Description of the data
The zip-file contains the following files
- readme.txt with relevant information
- activity_labels.txt with 6 activity labels
- features.txt with a list of "features" to be used as variable names
- features_info.txt with relevant information on the features
- test/subject_test.txt with the subject IDs for the test data 2947 entries
- test/X_test.txt with the test data 2947 x 561 entries
- test/y_test.txt codes the activities in test data 2947 entries
- train/subject_train.txt with the subject IDs for the train data 7352 entries
- train/X_train.txt with the train data 7352 x 561 entries
- train/y_train.txt codes the activities in train data 7352 entries   
# Workflow in run_analysis.R
1. Download and extract zip-file to data folder
2. Read files listed under Description of the data into R
3. Rbind and Cbind the data into one untidy tibble "Untidy"
4. Convert into tidy tibble
5. Summarize mean for by subject and by activity
6. Save step 4. to .csv file Tidy.csv
7. Save step 5. to .csv file Tidy_Mean.csv
See also the comments in run_analyis.R
# Variables
The variable experiment was created to allow subsetting for test and train
The variable subject and activity were created from the files included on the zip file
The variables 4 - 69 were selected as mean and standard deviations, and the description updated to better human readable form.
Results are either TIME or FREQuency domain, and described as MEAN or STDEV. Further details can be found in the file features_info.txt

# Listing on the variables.
Note: The variable "experiment" is not included in the Tidy_Mean.csv dataset
1 experiment
2 subject
3 activity
4 TIME-BodyAcc-MEAN-X
5 TIME-BodyAcc-MEAN-Y
6 TIME-BodyAcc-MEAN-Z
7 TIME-GravityAcc-MEAN-X
8 TIME-GravityAcc-MEAN-Y
9 TIME-GravityAcc-MEAN-Z
10 TIME-BodyAccJerk-MEAN-X
11 TIME-BodyAccJerk-MEAN-Y
12 TIME-BodyAccJerk-MEAN-Z
13 TIME-BodyGyro-MEAN-X
14 TIME-BodyGyro-MEAN-Y
15 TIME-BodyGyro-MEAN-Z
16 TIME-BodyGyroJerk-MEAN-X
17 TIME-BodyGyroJerk-MEAN-Y
18 TIME-BodyGyroJerk-MEAN-Z
19 TIME-BodyAccMag-MEAN
20 TIME-GravityAccMag-MEAN
21 TIME-BodyAccJerkMag-MEAN
22 TIME-BodyGyroMag-MEAN
23 TIME-BodyGyroJerkMag-MEAN
24 FREQ-BodyAcc-MEAN-X
25 FREQ-BodyAcc-MEAN-Y
26 FREQ-BodyAcc-MEAN-Z
27 FREQ-BodyAccJerk-MEAN-X
28 FREQ-BodyAccJerk-MEAN-Y
29 FREQ-BodyAccJerk-MEAN-Z
30 FREQ-BodyGyro-MEAN-X
31 FREQ-BodyGyro-MEAN-Y
32 FREQ-BodyGyro-MEAN-Z
33 FREQ-BodyAccMag-MEAN
34 FREQ-BodyBodyAccJerkMag-MEAN
35 FREQ-BodyBodyGyroMag-MEAN
36 FREQ-BodyBodyGyroJerkMag-MEAN
37 TIME-BodyAcc-STDEV-X
38 TIME-BodyAcc-STDEV-Y
39 TIME-BodyAcc-STDEV-Z
40 TIME-GravityAcc-STDEV-X
41 TIME-GravityAcc-STDEV-Y
42 TIME-GravityAcc-STDEV-Z
43 TIME-BodyAccJerk-STDEV-X
44 TIME-BodyAccJerk-STDEV-Y
45 TIME-BodyAccJerk-STDEV-Z
46 TIME-BodyGyro-STDEV-X
47 TIME-BodyGyro-STDEV-Y
48 TIME-BodyGyro-STDEV-Z
49 TIME-BodyGyroJerk-STDEV-X
50 TIME-BodyGyroJerk-STDEV-Y
51 TIME-BodyGyroJerk-STDEV-Z
52 TIME-BodyAccMag-STDEV
53 TIME-GravityAccMag-STDEV
54 TIME-BodyAccJerkMag-STDEV
55 TIME-BodyGyroMag-STDEV
56 TIME-BodyGyroJerkMag-STDEV
57 FREQ-BodyAcc-STDEV-X
58 FREQ-BodyAcc-STDEV-Y
59 FREQ-BodyAcc-STDEV-Z
60 FREQ-BodyAccJerk-STDEV-X
61 FREQ-BodyAccJerk-STDEV-Y
62 FREQ-BodyAccJerk-STDEV-Z
63 FREQ-BodyGyro-STDEV-X
64 FREQ-BodyGyro-STDEV-Y
65 FREQ-BodyGyro-STDEV-Z
66 FREQ-BodyAccMag-STDEV
67 FREQ-BodyBodyAccJerkMag-STDEV
68 FREQ-BodyBodyGyroMag-STDEV
69 FREQ-BodyBodyGyroJerkMag-STDEV
