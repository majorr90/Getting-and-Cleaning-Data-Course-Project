# Introduction

## Script
1. Once the data is loaded, column names for `xTrain` and `xTest` are provided from `features`. Column names for other data frames are created in the script.
2. `cbind` is used to create one data frame for data pulled from the `train` directory and another table for data from the `test` directory. Then, the two new data frames are merged into a single `allTogether` data frame using `rbind`.
3. A new vector containing all column names is created, and using `grepl`, a logical vector is generated to help identify relevant variables. The new logical vector `meanAndStd` is used to create a subset from the `allTogether` data frame.
4. The new subsetted data frame is then merged with the `activityLabels` data frame in order to name the activities.
5. `aggregate` is applied to the new data frame and finds the mean in conjunction between `subjectId` and `activityId` producing the final data frame `tidyDataSet`, which is then ordered first by `subjectId` then by `activityId`.
6. An independent tidy data set is created using `write.table`.

## Variables
* `xTrain`, `yTrain`, `subjectTrain`, `xTest`, `yTest`, `subjectTest`, `features` and `activityLabels` contain the data from the downloaded files.
* `allTrain` merges `xTrain`, `xTest` and `subjectTrain` for further analysis.
* `allTest` `allTrain` merges `xTrain`, `xTest` and `subjectTrain` for further analysis.
* `allTogether` merges `allTrain` and `allTest`.
* `columnNames` contains a vector of all the column labels in `allTogether`.
* `meanAndStd` contains a logical vector to index relevant variables.
* `forMeanStd` checks against `meanAndStd` and subsets a new data frame from `allTogether` containing only relevant variables.
* `withActivityNames` merges `activityLabels` and `forMeanStd` using `activityID`.
* `tidyDataSet` contains the final, tidy data frame containing, ordered by `subjectId` then `activityId` and containing the average of each variable.