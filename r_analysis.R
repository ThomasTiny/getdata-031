library(dplyr)
library(reshape2)

## 1 Merges the training and the test sets to create one data set.
##***************************************************************##

# load data from folder 'test' and 'train'.
x_test <- read.table('test/X_test.txt')
x_train <- read.table('train/X_train.txt')

y_test <- read.table('test/y_test.txt')
y_train <- read.table('train/y_train.txt')

subject_test <- read.table('test/subject_test.txt')
subject_train <- read.table('train/subject_train.txt')

# merge data of 'x', 'y' and 'subject' relevant.
# tables used for merging should have identical variables.
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)

# clean up tables
rm(x_test, x_train, y_test, y_train, subject_test, subject_train)


## Extracts only the measurements on the mean and standard deviation for each measurement.
##***************************************************************##

# to extract mean and standard deviation of measurement, refer to 'features.txt'.
features <- read.table('features.txt')

# extract useful columns using pattern matching.
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset mean and standard deviation relevant columns from 'x_data' dataset.
x_data_subset <- x_data[, mean_and_std_features]


## 3 Uses descriptive activity names to name the activities in the data set.
##***************************************************************##

# extract activity labels from 'activity_labels.txt'
act_labels <- read.table('activity_labels.txt')

# match activities to 'y_data' dataset
y_data[, 1] <- act_labels[y_data[, 1], 2]

## 4 Appropriately labels the data set with descriptive variable names.
##***************************************************************##

# dataset 'x_data_subset' = measurements on the mean and standard deviation for each measurement.
names(x_data_subset) <- features[mean_and_std_features, 2]

# datdset 'y_data' = activity,
# (walking, walking upstairs, walking downstairs, sitting, standing, laying).
names(y_data) <- "activity"

#dataset 'subject_data' = subject (1 - 30)
names(subject_data) <- 'subject'

# create a combined dataset
combined_data <- cbind(x_data_subset, y_data, subject_data)

## 5 From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# melt dataset to reshape later 
melt_data <- reshape2::melt(combined_data, id=c('activity', 'subject'))

# reshape dataset by casting to create a tidy dataset by
# calculating average of each variable for each activity and each subject
tidy_data <- reshape2::dcast(melt_data, subject + activity ~ variable, mean)

# arrange dataset
tidy_data <- dplyr::arrange(tidy_data, subject, activity)