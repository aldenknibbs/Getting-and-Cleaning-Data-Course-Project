##Getting and Cleaning Data Course Project CodeBook.md

### Description
Alden Knibbs created this CodeBook.md as part of the submission of the course project for the Johns Hopkins Getting and Cleaning Data course by Coursera.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

####Notes
For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


##Procedure Applied to Data

The procedure below was applied to the data is as follows.

###Step 1 - Prepare Workspace
1. Clear Workspace
2. Load Libraries


###Step 2 - Get Data
1. Download datset
2. Unzip dataset into data directory

###Step 3 - Merge Data

Merges the training and the test sets to create one data set

1. Read data from "test" tables and store 
2. Read data from "train" tables and store 
3. Read data from "features" and store 
4. Read data from "activity_labels"
5. Assign column headers to test data
6. Assign column headers to train data
7. Assign column headers to activity_labels
8. Merge tables

###Step 4 - Extract Data

Extract only the measurements on the mean and standard deviation for each measurement

1. Store column headers in variable
2. Subset activity_data for meanstd

###Step 5 - Provide Meaning Activity Names

Uses descriptive activity names to name the activities in the data set

1. Merge with "activity_labels"
2. Update column headers

###Step 6 - Give Descriptive Names for Each Variable

Appropriately labels the data set with descriptive variable names

1. Create function to rename headers
2. Assign descriptive names to data

###Step 7 - Create Summary Dataset

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

1. Create summary dataset
2. Update activityid
3. Delete activity.x
4. Rename activity.y
5. Assign column headers for tidier dataset
6. Write summary tidy dataset

##Variable Names and Class of *activity_summary.txt*
Variable Names	| Variable Class
--------------- | --------------
activityid | integer
subjectid | integer
timebodyaccelerationmagnitudemean | numeric
timebodyaccelerationmagnitudestd | numeric
timegravityaccelerationmagnitudemean | numeric
timegravityaccelerationmagnitudestd | numeric
timebodyaccelerationjerkmagnitudemean | numeric
timebodyaccelerationjerkmagnitudestd | numeric
timebodygyromagnitudemean | numeric
timebodygyromagnitudestd | numeric
timebodygyrojerkmagnitudemean | numeric
timebodygyrojerkmagnitudestd | numeric
freqbodyaccelerationmagnitudemean | numeric
freqbodyaccelerationmagnitudestd | numeric
freqbodyaccelerationjerkmagnitudemean | numeric
freqbodyaccelerationjerkmagnitudestd | numeric
freqbodygyromagnitudemean | numeric
freqbodygyromagnitudestd | numeric
freqbodygyrojerkmagnitudemean | numeric
freqbodygyrojerkmagnitudestd | numeric
activity | factor

