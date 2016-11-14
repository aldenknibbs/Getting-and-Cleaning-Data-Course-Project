##Getting and Cleaning Data Course Project
##Alden Knibbs
##2016-11-14

#Here are the data for the project:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#You should create one R script called run_analysis.R that does the following.
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each 
#measurement.
#3.Uses descriptive activity names to name the activities in the data set.
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

##Clear Workspace
rm(list=ls())


##Load Libraries
library(plyr)


##Get Data

#Download datset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#Unzip dataset into data dir
unzip(zipfile="./data/Dataset.zip",exdir="./data")

##1.Merges the training and the test sets to create one data set

#Read data from "test" tables and store 
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Read data from "train" tables and store 
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Read data from "features" and store 
features <- read.table('./data/UCI HAR Dataset/features.txt')

#Read data from "activity_labels"
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#Assign column headers to test data
colnames(x_test) <- features[,2]
colnames(y_test) <-"activityid"
colnames(subject_test) <- "subjectid"

#Assign column headers to train data
colnames(x_train) <- features[,2]
colnames(y_train) <-"activityid"
colnames(subject_train) <- "subjectid"

#Assign column headers to activity_labels
colnames(activity_labels) <- c('activityid','activity')

#Merge tables
merge_test <- cbind(y_test, subject_test, x_test)
merge_train <- cbind(y_train, subject_train, x_train)
activity_data <- rbind(merge_test, merge_train)


##2.Extracts only the measurements on the mean and standard deviation for each 
##measurement

#Store column headers in variable
headers <- colnames(activity_data)

meanstd <- (
        grepl("activityid", headers) | 
        grepl("subjectid", headers) | 
        grepl("mean..", headers) & 
                !grepl("meanFreq..", headers) & 
                !grepl("mean..-", headers) | 
        grepl("-std..", headers) & 
                !grepl("-std()..-", headers)
        )

#Subset activity_data for meanstd
activity_meanstd <- activity_data[, meanstd == TRUE]


##3.Uses descriptive activity names to name the activities in the data set

#Merge with activity_labels
activity_meanstd = merge(activity_meanstd, 
                         activity_labels, 
                         by='activityid', 
                         all.x = TRUE
                         )

#Update column headers
headers = colnames(activity_meanstd)


#4.Appropriately labels the data set with descriptive variable names

#Create function to rename headers
for (v in 1:length(headers)) 
{
        headers[v] = gsub("\\()","",headers[v])
        headers[v] = gsub("-std$","std",headers[v])
        headers[v] = gsub("-mean","mean",headers[v])
        headers[v] = gsub("^(t)","time",headers[v])
        headers[v] = gsub("^(f)","freq",headers[v])
        headers[v] = gsub("([Gg]ravity)","gravity",headers[v])
        headers[v] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","body",headers[v])
        headers[v] = gsub("[Gg]yro","gyro",headers[v])
        headers[v] = gsub("[Aa]cc", "acceleration",headers[v])
        headers[v] = gsub("[Mm]ag", "magnitude",headers[v])
        headers[v] = gsub("[Jj]erk", "jerk",headers[v])
};

#Assign descriptive names to data
colnames(activity_meanstd) = headers


##5.From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

#Create summary dataset
activity_summary <- aggregate(. ~subjectid + activityid, activity_meanstd, mean)

#Update activityid
activity_summary <- merge(activity_summary, 
                          activity_labels, 
                          by='activityid', 
                          all.x= TRUE
                          )

#Delete activity.x
activity_summary <- activity_summary[-c(21)]

#Rename activity.y
for (v in 1:length(headers)) 
{
        headers[v] = gsub("activity.y","activity",headers[v])
}

#Assign column headers for tidier dataset
colnames(activity_summary) = headers

#Write summary tidy dataset
write.table(activity_summary, "activity_summary.txt", row.name=FALSE)
