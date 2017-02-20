# Getting and Cleaning Data: Course Project
This repo was created as a project for the Coursera course Getting and Cleaning Data as part of the Data Science 10-course Specialization with Johns Hopkins University.

The source data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Original Data Set
The original data sets used in this project include:
(Main directory)
* `features.txt` — List of all features
* `activity_labels.txt` — Links the class labels with their activity name
(`train` directory)
* `train/X_train.txt` — Training set
* `train/y_train.txt` — Training labels
* `train/subject_train.txt` — Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
(`test` directory)
* `test/X_test.txt` — Test set
* `test/y_test.txt` — Test labels
* `test/subject_test.txt` — Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

More information on all files can be found in the `README.txt` file included with the original source files.

## Files
### run_analysis.R
The R script `run_analysis.R` does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### CodeBook.md
`CodeBook.md` is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

### tidyDataSet.txt
`tidyDataSet.txt` is the output file from the R script `run_analysis.R`.

##Libraries
`dplyr` is required to run this script.
