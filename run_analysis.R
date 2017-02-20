library(dplyr)

# Downloads zipped file.
temp <- tempfile()
download.file(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
  temp,
  method="curl")
dateDownloaded <- date()


# Loads relevant data frames.
xTest <- read.table(
  unz(temp, "UCI HAR Dataset/test/X_test.txt"))
yTest <- read.table(
  unz(temp, "UCI HAR Dataset/test/y_test.txt"))
subjectTest <- read.table(
  unz(temp, "UCI HAR Dataset/test/subject_test.txt"))

xTrain <- read.table(
  unz(temp, "UCI HAR Dataset/train/X_train.txt"))
yTrain <- read.table(
  unz(temp, "UCI HAR Dataset/train/y_train.txt"))
subjectTrain <- read.table(
  unz(temp, "UCI HAR Dataset/train/subject_train.txt"))

features <- read.table(
  unz(temp, "UCI HAR Dataset/features.txt"))
activityLabels <- read.table(
  unz(temp, "UCI HAR Dataset/activity_labels.txt"))

unlink(temp)


# Provides column names.
colnames(xTrain) <- features[,2] 
colnames(yTrain) <-"activityId"
colnames(subjectTrain) <- "subjectId"

colnames(xTest) <- features[,2] 
colnames(yTest) <- "activityId"
colnames(subjectTest) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')


# Merges the training and the test sets to create one data set.
allTrain <- cbind(subjectTrain, yTrain, xTrain)
allTest <- cbind(subjectTest, yTest, xTest)
allTogether <- rbind(allTrain, allTest)


# Extracts only the measurements on the mean and standard deviation for each
# measurement.
columnNames <- colnames(allTogether)
meanAndStd <- grepl("subjectId", columnNames) |
  grepl("activityId", columnNames) |
  grepl("mean..", columnNames) |
  grepl("std..", columnNames)
forMeanStd <- allTogether[, meanAndStd == TRUE]


# Uses descriptive activity names to name the activities in the data set.
withActivityNames <- merge(activityLabels, forMeanStd,
                              by='activityId',
                              all.x=TRUE)


# Appropriately labels the data set with descriptive variable names.
tidyDataSet <- aggregate(. ~subjectId + activityId, withActivityNames, mean)
tidyDataSet <- tidyDataSet[order(tidyDataSet$subjectId, tidyDataSet$activityId),]


# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
write.table(tidyDataSet, "tidyDataSet.txt", row.name=FALSE)

