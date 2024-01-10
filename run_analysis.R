# R script for Peer-graded Assignment: Getting and Cleaning Data Course Project

# setting up the main directors and "data" sub directory
main_dir <- "C:/Users/stormth1/DataScience/HumanActivitySmartphones"
setwd(main_dir)
sub_dir <- "./data"

# check if "data" sub directory exists, if not download and unzip file
if (!file.exists(sub_dir)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        temp <- tempfile()
        download.file(url, temp)
        unzip(zipfile = temp, exdir = file.path(main_dir))
        unlink(c(temp))
        rm(temp)
        file.rename("UCI HAR Dataset", "data")
} else {print("data folder available")}