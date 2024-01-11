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

features <- read_table("./data/features.txt", 
                     col_names = c("index","features"), 
                     col_types = cols(
                             index = col_double(),
                             features = col_character()
                                )
                        )

X_test <- read_table("./data/test/X_test.txt", 
                     col_names = features$features
                        )

y_test <- read_table("./data/test/y_test.txt", 
                     col_names = "activity", 
                     col_types = cols(activity = col_double())
                        )

