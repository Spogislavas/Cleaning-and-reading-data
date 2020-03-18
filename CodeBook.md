R Markdown
----------

Code Book
=========

This code book describes the variables, the data, and any
transformations or work performed to clean up the data.

Source of the Data
==================

-   Source of the original data:
    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.>

-   Original description:
    <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.>

Dataset Information
===================

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz.

The experiments have been video-recorded to label the data manually.

The obtained dataset has been randomly partitioned into two sets, where
70% of the volunteers was selected for generating the training data and
30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

The Data Package
================

The dataset includes the following files:

    - `README.txt`
    - `features_info.txt`: Shows information about the variables used on the feature vector.
    - `features.txt`: List of all features.
    - `activity_labels.txt`: Links the class labels with their activity name.
    - `train/X_train.txt`: Training set.
    - `train/y_train.txt`: Training labels.
    - `test/X_test.txt`: Test set.
    - `test/y_test.txt`: Test labels.

In particular, files contained in the `train` and in the `test`
(sub)folders contains data that have been made available for training
and testing respectively. However, since their description is the same,
only training data will be described in the following:

-   `train/subject_train.txt`: Each row refers to one (out of thirty)
    subject who performed the activity for each window sample.
    Therefore, values range from 1 to 30.

-   `train/Inertial Signals/total_acc_x_train.txt`: The acceleration
    signal from the smartphone accelerometer X axis in standard gravity
    units 'g'. Each row shows a 128 element vector. The same description
    applies for the total\_acc\_x\_train.txt and for the
    total\_acc\_z\_train.txt files for the Y and Z axis.

-   `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration
    signal obtained by subtracting the gravity from the total
    acceleration.

-   `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity
    vector measured by the gyroscope for each window sample. These
    values are expressed in radians-per-second

Data Manipulation details
=========================

The run\_analysis.R script performs the following operations to clean
and transform the data: 0. Read the dataset 1. Merges the training and
the test sets to create one single data set. 2. Extracts only the
measurements on the mean and standard deviation for each measurement. 3.
Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 5.
Creates a second, independent tidy data set with the average of each
variable for each activity and each subject.

Merges the training and the test sets to create one single data set.
====================================================================

`train/X_train.txt & test/X_test.txt`: this results in a 10299x561 data
frame, as reported in the original description ("Number of Instances:
10299" and "Number of Attributes: 561")

`train/subject_train.txt` & `test/subject_test.txt`: this results in a
10299 x 1 data frame with subject IDs,

`train/y_train.txt` & `test/y_test.txt`: this results in a 10299 x 1
data frame (as well) with activity IDs.

Extracts only the measurements on the mean and standard deviation for each measurement.
=======================================================================================

To perform this step, the script reads the file `features.txt`, and
extracts only the measurements of the mean and the standard deviation of
each measurement/example.

Uses descriptive activity names to name the activities in the data set
======================================================================

In this step, the script reads the file `activity_labels.txt`, and
applies descriptive activity names to name the activities in the data
set, namely:

WALKING WALKING\_UPSTAIRS WALKING\_DOWNSTAIRS SITTING STANDING LAYING

Clean the names to appropriate descriptive variable names
=========================================================

Names of the attributes corresponds to:

\[1\] "subject"  
\#\# \[2\] "timeBodyAccelerometerMeanX"  
\#\# \[3\] "timeBodyAccelerometerMeanY"  
\#\# \[4\] "timeBodyAccelerometerMeanZ"  
\#\# \[5\] "timeBodyAccelerometerStdX"  
\#\# \[6\] "timeBodyAccelerometerStdY"  
\#\# \[7\] "timeBodyAccelerometerStdZ"  
\#\# \[8\] "timeGravityAccelerometerMeanX"  
\#\# \[9\] "timeGravityAccelerometerMeanY"  
\#\# \[10\] "timeGravityAccelerometerMeanZ"  
\#\# \[11\] "timeGravityAccelerometerStdX"  
\#\# \[12\] "timeGravityAccelerometerStdY"  
\#\# \[13\] "timeGravityAccelerometerStdZ"  
\#\# \[14\] "timeBodyAccelerometerJerkMeanX"  
\#\# \[15\] "timeBodyAccelerometerJerkMeanY"  
\#\# \[16\] "timeBodyAccelerometerJerkMeanZ"  
\#\# \[17\] "timeBodyAccelerometerJerkStdX"  
\#\# \[18\] "timeBodyAccelerometerJerkStdY"  
\#\# \[19\] "timeBodyAccelerometerJerkStdZ"  
\#\# \[20\] "timeBodyGyroscopeMeanX"  
\#\# \[21\] "timeBodyGyroscopeMeanY"  
\#\# \[22\] "timeBodyGyroscopeMeanZ"  
\#\# \[23\] "timeBodyGyroscopeStdX"  
\#\# \[24\] "timeBodyGyroscopeStdY"  
\#\# \[25\] "timeBodyGyroscopeStdZ"  
\#\# \[26\] "timeBodyGyroscopeJerkMeanX"  
\#\# \[27\] "timeBodyGyroscopeJerkMeanY"  
\#\# \[28\] "timeBodyGyroscopeJerkMeanZ"  
\#\# \[29\] "timeBodyGyroscopeJerkStdX"  
\#\# \[30\] "timeBodyGyroscopeJerkStdY"  
\#\# \[31\] "timeBodyGyroscopeJerkStdZ"  
\#\# \[32\] "timeBodyAccelerometerMagnitudeMean"  
\#\# \[33\] "timeBodyAccelerometerMagnitudeStd"  
\#\# \[34\] "timeGravityAccelerometerMagnitudeMean"  
\#\# \[35\] "timeGravityAccelerometerMagnitudeStd"  
\#\# \[36\] "timeBodyAccelerometerJerkMagnitudeMean"  
\#\# \[37\] "timeBodyAccelerometerJerkMagnitudeStd"  
\#\# \[38\] "timeBodyGyroscopeMagnitudeMean"  
\#\# \[39\] "timeBodyGyroscopeMagnitudeStd"  
\#\# \[40\] "timeBodyGyroscopeJerkMagnitudeMean"  
\#\# \[41\] "timeBodyGyroscopeJerkMagnitudeStd"  
\#\# \[42\] "frequencyBodyAccelerometerMeanX"  
\#\# \[43\] "frequencyBodyAccelerometerMeanY"  
\#\# \[44\] "frequencyBodyAccelerometerMeanZ"  
\#\# \[45\] "frequencyBodyAccelerometerStdX"  
\#\# \[46\] "frequencyBodyAccelerometerStdY"  
\#\# \[47\] "frequencyBodyAccelerometerStdZ"  
\#\# \[48\] "frequencyBodyAccelerometerMeanFreqX"  
\#\# \[49\] "frequencyBodyAccelerometerMeanFreqY"  
\#\# \[50\] "frequencyBodyAccelerometerMeanFreqZ"  
\#\# \[51\] "frequencyBodyAccelerometerJerkMeanX"  
\#\# \[52\] "frequencyBodyAccelerometerJerkMeanY"  
\#\# \[53\] "frequencyBodyAccelerometerJerkMeanZ"  
\#\# \[54\] "frequencyBodyAccelerometerJerkStdX"  
\#\# \[55\] "frequencyBodyAccelerometerJerkStdY"  
\#\# \[56\] "frequencyBodyAccelerometerJerkStdZ"  
\#\# \[57\] "frequencyBodyAccelerometerJerkMeanFreqX"  
\#\# \[58\] "frequencyBodyAccelerometerJerkMeanFreqY"  
\#\# \[59\] "frequencyBodyAccelerometerJerkMeanFreqZ"  
\#\# \[60\] "frequencyBodyGyroscopeMeanX"  
\#\# \[61\] "frequencyBodyGyroscopeMeanY"  
\#\# \[62\] "frequencyBodyGyroscopeMeanZ"  
\#\# \[63\] "frequencyBodyGyroscopeStdX"  
\#\# \[64\] "frequencyBodyGyroscopeStdY"  
\#\# \[65\] "frequencyBodyGyroscopeStdZ"  
\#\# \[66\] "frequencyBodyGyroscopeMeanFreqX"  
\#\# \[67\] "frequencyBodyGyroscopeMeanFreqY"  
\#\# \[68\] "frequencyBodyGyroscopeMeanFreqZ"  
\#\# \[69\] "frequencyBodyAccelerometerMagnitudeMean"  
\#\# \[70\] "frequencyBodyAccelerometerMagnitudeStd"  
\#\# \[71\] "frequencyBodyAccelerometerMagnitudeMeanFreq"  
\#\# \[72\] "frequencyBodyAccelerometerJerkMagnitudeMean"  
\#\# \[73\] "frequencyBodyAccelerometerJerkMagnitudeStd"  
\#\# \[74\] "frequencyBodyAccelerometerJerkMagnitudeMeanFreq" \#\#
\[75\] "frequencyBodyGyroscopeMagnitudeMean"  
\#\# \[76\] "frequencyBodyGyroscopeMagnitudeStd"  
\#\# \[77\] "frequencyBodyGyroscopeMagnitudeMeanFreq"  
\#\# \[78\] "frequencyBodyGyroscopeJerkMagnitudeMean"  
\#\# \[79\] "frequencyBodyGyroscopeJerkMagnitudeStd"  
\#\# \[80\] "frequencyBodyGyroscopeJerkMagnitudeMeanFreq"  
\#\# \[81\] "activity"
