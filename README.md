## Getting and Cleaning Data Project README.md

Alden Knibbs created this READEME.md as part of the submission of the course project for the Johns Hopkins Getting and Cleaning Data course by Coursera.

### Overview
This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent
analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Making Modifications to This Script
The script (run_anlaysis.R) creates a "data" directory, if a dicrectory of that name does not already exist, where source and output data will be saved. If you wish to save to a specific location you will need to modify the script (lines 28-30).

### Project Summary
The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.
