## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Read all the data
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Step 1. Merge the training and test sets to create one data set
#combine each matching set of data (train vs. test)
data <- rbind(train_data, test_data)
labels <- rbind(train_labels, test_labels)
subjects <- rbind(train_subjects, test_subjects)

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement
#Read features table
features <- read.table("./UCI HAR Dataset/features.txt")
# Add friendly names to columns of features table
names(features) <- c('feat_id', 'feat_name')
# Extract only mean and standard deviation records from features table
extract_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
data <- data[, extract_features]
# Replace all matches to the extracted features
names(data) <- gsub("\\(|\\)", "", (features[extract_features, 2]))

## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
# Read activity table
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Add friendly names to activity table
names(activities) <- c('act_id', 'act_name')
labels[, 1] = activities[labels[, 1], 2]

names(labels) <- "Activity"
names(subjects) <- "Subject"

# Combine data tables into one table by columns
tidyDataSet <- cbind(subjects, labels, data)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
p <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataAVGSet <- aggregate(p,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)

# Add friendly Activity and Subject name of columns 
names(tidyDataAVGSet)[1] <- "Subject"
names(tidyDataAVGSet)[2] <- "Activity"

# Write data to txt file for course upload
write.table(tidyDataAVGSet, file = "./tidy_data.txt", row.name=FALSE)
