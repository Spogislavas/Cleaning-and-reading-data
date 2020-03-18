#Download and load the datasets
setwd("/Users/Ignas/Desktop/Learning Data Scientist/Projects in R/Cleaning and reading data_3/")

if (!file.exists("Final project")) {
        dir.create("Final project")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "/Users/Ignas/Desktop/Learning Data Scientist/Projects in R/Cleaning and reading data_3/Final project/dataset.zip", method = "curl")
if (!file.exists("/Users/Ignas/Desktop/Learning Data Scientist/Projects in R/Cleaning and reading data_3/Final project/UCI HAR Dataset")) {
        unzip(zipfile = "/Users/Ignas/Desktop/Learning Data Scientist/Projects in R/Cleaning and reading data_3/Final project/dataset.zip", 
              exdir = "/Users/Ignas/Desktop/Learning Data Scientist/Projects in R/Cleaning and reading data_3/Final project")
}
dataPath <- "//Users/Ignas/Desktop/Learning Data Scientist/Projects in R/Cleaning and reading data_3/Final project/UCI HAR Dataset"

#Read the data sets

activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
features <- read.table(file.path(dataPath, "features.txt"))
features$V2 <- as.character(features$V2)

subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"))
featuresTrain <- read.table(file.path(dataPath, "train", "X_train.txt"))
activityTrain <- read.table(file.path(dataPath, "train", "y_train.txt"))

subjectTest <- read.table(file.path(dataPath, "test", "subject_test.txt"))
featuresTest <- read.table(file.path(dataPath, "test", "X_test.txt"))
activityTest <- read.table(file.path(dataPath, "test", "y_test.txt"))

#Merge the training and the test sets to create one data set

trainData <- cbind(subjectTrain, featuresTrain, activityTrain)
testData <- cbind(subjectTest, featuresTest, activityTest)
mergeData <- rbind(trainData, testData)
colnames(mergeData) <- c("subject", features$V2, "activity")

#Subset the measurements that include mean and standard deviation names

selectedColumns <- grepl("subject|mean|std|activity", colnames(mergeData))
mergeData <- mergeData[, selectedColumns]
names(mergeData)    # check

#Name the activities with descriptive names

mergeData$activity <- factor(mergeData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
mergeData$subject <- as.factor(mergeData$subject)
head(mergeData$activity) # Check

#Clean the names to appropriate descriptive variable names

colnames(mergeData) <- gsub('[-()]', '', colnames(mergeData))
colnames(mergeData) <- gsub("^t", "time", colnames(mergeData))
colnames(mergeData) <- gsub("^f", "frequency", colnames(mergeData))
colnames(mergeData) <- gsub("Acc", "Accelerometer", colnames(mergeData))
colnames(mergeData) <- gsub("Gyro", "Gyroscope", colnames(mergeData))
colnames(mergeData) <- gsub("Mag", "Magnitude", colnames(mergeData))
colnames(mergeData) <- gsub("mean", "Mean", colnames(mergeData))
colnames(mergeData) <- gsub("std", "Std", colnames(mergeData))
colnames(mergeData) <- gsub("BodyBody", "Body", colnames(mergeData))
names(mergeData)       # check

library(dplyr)
secondData <- mergeData %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))
write.table(secondData, "tidydata.txt", row.names = FALSE, quote = FALSE)    