# Getting and Cleaning Data
### Overview

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

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




