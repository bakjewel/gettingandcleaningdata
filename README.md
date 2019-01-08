#Summary

This project allows creating a "clean" data set from the 'UCI HAR Dataset' available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It merges different subsets of this data into one single transformed data set --- named "clean" data set --- in order to allow performing data analysis tasks more easily. As an example, a derived data set --- named "tidy" data set) --- is created which contains the average values of each measurement variable for each activity and each subject.

#Data

Download raw data from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once the zip file is extracted it will contain 2 folders and 4 text files. 
Move these 6 items to your working directory.

Run "run_analysis.R" to get "tidyset2nd.txt" as output.
