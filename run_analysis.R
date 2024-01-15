# R script for Peer-graded Assignment: Getting and Cleaning Data Course Project

library(tidyverse)

# set main directory and "data" sub directory
# requires working directory is set correctly
main_dir <- getwd()
sub_dir <- "./data"

# check if "data" sub-directory exists, if not download and unzip file
if (!file.exists(sub_dir)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        temp <- tempfile()
        download.file(url, temp)
        unzip(zipfile = temp, exdir = file.path(main_dir))
        unlink(c(temp))
        rm(temp)
        file.rename("UCI HAR Dataset", "data")
} else {print("data folder available")}

# read features, activity_labels,subject_test/train, X_test/train, y_test/train 

features <- read_table("./data/features.txt", 
                     col_names = c("index","features"), 
                     col_types = cols(
                             index = col_double(),
                             features = col_character())
                        )

activity_labels <- read_table("./data/activity_labels.txt", 
                                col_names = c("index", "activity"), 
                                col_types = cols(activity = col_character())
                        )

subject_test <- read_table("./data/test/subject_test.txt",
                                col_names = "subject",
                                col_types = cols(subject = col_double())
                        )

X_test <- read_table("./data/test/X_test.txt", 
                     col_names = features$features,
                     col_types = cols(.default = col_double())
                        )

y_test <- read_table("./data/test/y_test.txt", 
                     col_names = "activity", 
                     col_types = cols(activity = col_double())
                        )

subject_train <- read_table("./data/train/subject_train.txt",
                           col_names = "subject",
                           col_types = cols(subject = col_double())
                        )

X_train <- read_table("./data/train/X_train.txt", 
                     col_names = features$features,
                     col_types = cols(.default = col_double())
                        )

y_train <- read_table("./data/train/y_train.txt", 
                     col_names = "activity", 
                     col_types = cols(activity = col_double())
                        )
# create Experiment factor (test/train) - a bit redundant as subjects are either test or train but good practice

Experiment <- tibble(experiment = as.factor(c(rep("test", nrow(y_test)), rep("train", nrow(y_train)))))

# bind data together to create on "Untidy" tibble

Subject <- bind_rows(subject_test, subject_train)
        
Activities <- bind_rows(y_train, y_test)

Data <- bind_rows(X_test, X_train)

Untidy <- bind_cols(Experiment, Subject, Activities, Data)

# "Tidy" table only including means and standard deviations, and descriptive variable names

Tidy <- Untidy %>%  select(matches("experiment") | matches("subject") | matches("activity") | matches("mean") | matches("std")) %>% 
        select(-matches("-meanFreq()"), -matches("^angle\\(")) %>%
        mutate(activity = recode(Untidy$activity, !!!activity_labels$activity)) %>% 
        rename_with(gsub, pattern = "mean\\(\\)", replace = "MEAN") %>%
        rename_with(gsub, pattern = "std\\(\\)", replace = "STDEV") %>%
        rename_with(gsub, pattern = "^f", replace = "FREQ-") %>%
        rename_with(gsub, pattern = "^t", replace = "TIME-")

# summarize Tidy tibble with mean

Tidy_Mean <- Tidy %>% group_by(subject, activity) %>% summarize_at(c(3:66), mean, na.rm = TRUE)

write to two files

write.csv(Tidy, file = "./Tidy.csv")

write.csv(Tidy_Mean, file = "./Tidy_Mean.csv")

clean up environment

rm(list=ls())





        