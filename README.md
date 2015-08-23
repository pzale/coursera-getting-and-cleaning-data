# Getting and Cleaning Data

### Goals

An R script called run_analysis.R was created that does the following.

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Code Dependancies

The script must be run from your working directory and assumes the the UCI HAR Dataset is in your working directory.

The tidy data output is written to a file named tidy_data.txt and is placed in your current working directory.

### run_analysis.R Walkthrough

1. Reads all train and test data into R
2. Reads the features and activity labels data into R
3. Extracts the mean and standard deviation data from the features table
4. Processes the data
5. Merges the data and creates a separate data set of the tidy data
6. Writes tidy data set to a .txt file




