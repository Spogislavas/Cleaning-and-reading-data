Getting and Cleaning Data Project
=================================

This is the GitHub Repository for the Getting and Cleaning Data Course
Project.

Project Description
===================

The purpose of this project is to demonstrate the ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis.

In more details, the following steps are required to complete the
assignment: 1) a tidy data set as described below; 2) a link to a Github
repository with your script for performing the analysis; 3) a Code book
that describes the variables, the data, and any transformations
performed to clean up the data called.

Data Description
================

The data considered for the Project represent data collected from the
accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the web site where the data was
obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The whole data package can be downloaded at the following link:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Data Analysis
=============

-   Download and Unzip the data package by clicking at the following
    url:
    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

-   Run the following `data_analysis.R` which is available at the
    following url: <https://github.com/Spogislavas/datasciencecoursera>

Running the `run_analysis.R` script will perform the actual analysis. In
particular:

    - Read the Dataset
    - Merges the training and the test sets to create one single data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement. 
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names. 
    - Creates a second, independent tidy data set with the average of each variable 
         for each activity and each subject.

-   After performing the analysis, the following file will be created:

    -   `tidy_data.txt`
