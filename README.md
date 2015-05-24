---
title: "README.md"
author: "Gerard Keohane"
date: "24 May 2015"
---

###### *Repository*: gettingcleaningdata

Assignment files for the Coursera "Getting and Cleaning Data" Course

## About the Assignment

The assignment is to collect and tidy data according to the tidy data principles set out by Hadley Wickham in this paper:

http://vita.had.co.nz/papers/tidy-data.pdf

The basic principles of tidy data are:

1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. If you have multiple tables, they should include a column in the table that allows them to be linked

The data used comes from the *UCI HAR Dataset*, and after processing with *run_analysis.R* is delivered into your working directory as a tidy data table named *tidy_data.txt*.

## The Files

This repository contains the following files:

1. run_analysis.R
2. README.md
3. CODEBOOK.md

To work with the files in this repository you will also need the following:

1. The Raw Data: UCI HAR DATASET
2. A correct setup of the working directory

The run_analysis.R file operates on data in the UCI HAR Dataset.

### The Raw Data: UCI HAR Dataset

This dataset can be collected from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For more details on the project please see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You will need to download the file and unzip it into your working directory. After it is unzipped you will have a directory named *UCI HAR Dataset* which will contain further directories of data as well as a README.txt file and other information files.

If you are not familiar with this dataset it would be worth reading the README.txt file that comes with the dataset.

### Installation and A Correct Setup of the Working Directory

The best approach to setting up your working directory is to clone this repository and then download the zip of *UCI HAR Dataset* into the repository directory and unzip it there.

The *run_analysis.R* file must be in the same directory as the *UCI HAR Dataset* directory to function correctly.

### CODEBOOK.md 

The *CODEBOOK.md* file is the Codebook for the data that is processed, tidied, and recorded in *tidy_data.txt* file produced by running the *run_analysis.R* script. 

After running the *run_analysis.R* script, you will have a *tidy_data.txt* file in your working directory. 

To view this file in RStudio use the following commands:

```df <- read.table("tidy_data.txt", header = TRUE); View(df)```

### run_analysis.R

This file processes the *UCI HAR Dataset*, tidies the data as laid out below:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Upon completing these steps the script produces a tidy data set file saved to the working directory.

To run the file, ensure you are in the correct working directory as explained above and run this command in R:

`source('run_analysis.R')`

The *run_analysis.R* is heavily commented. Here follows a synopsis of the script's process:

#### Overview of run_analysis.R

##### Step 1: Merges the training and the test sets to create one data set.

From our initial exploration of the training and test data, and from reading the README.txt we know:

1. The training and test data both have 561 columns
2. The variables recorded in the columns in the training data correspond to the variables recorded in the data in the test data
3. The features.txt file tells us what variables are recorded in each of the columns for both files, and can therefore be used as the headers or names of those columns
4. The values recorded in the columns of both training and test files are of class "numeric" - we'll use this information to speed up the process of importing both files

This gives us a couple of options for achieving the first step, looking ahead to Step 2. We're going to take the following approach:

1. Use the "Reading Large Table" approach to read in both training and test data - we know the columns are the same so we only need to establish the colclasses once.
2. Row Bind the test data onto the train data in a dataframe named "X_all"
3. Collect the column names from features.txt file - these are stored in the "V2" column
4. The column names are duplicated - so we're going to make them unique to allow us to use "dplyr" later on
5. Apply the column names to the data

##### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

Based on our reading of the features_info.txt and features.txt files we see that the columns which measure mean and standard deviation contain the strings "mean", "Mean" and "std". We're going to collect all columns that make a reference to these strings. 

To do this we're going to use library(dplyr) and the select() function to select only columns where the name of the column matches these strings. We'll use matches() special function to check for the strings. matches() will ignore case by default.

##### Step 3: Uses descriptive activity names to name the activities in the data set

The reference to the activities is in the y_train.txt and y_test.txt files. During our exploration of the data we say that the number of rows in each file is equivalent to the number of rows in the "X_" files. 

We will use the following process to collect the two sets of data togehter and associate activities with each

1. Read in y_train.txt and y_test.txt and rbind the files into y_all data frame
2. Read in the activity_labels.txt file 
3. Each number in V1 of y_all references an activity in V1 of activity_labels which is described by the corresponding value in V2 of activity_labels
4. We will join y_all and activity_labels on the basis of id V1
5. By using the plyr function join() we will maintain the order of activities in the y_all file this is important when they are later applied to the X_all file
6. Column bind colum V2 to the X_select data frame

##### Step 4: Appropriately labels the data set with descriptive variable names. 
We have already labeled the variable names as part of Step 1. Originally the variable names that came with the data would have been V1, V2, etc. We used the features.txt file to apply more meaningful and descriptive names to each Variable in Step 1 above so we could later select only columns that included "mean" or "std" in their name using the select() function in the dplyr library.

We will also do some further tidy up work on the names later in Step 5. 

As a result this step has already been completed.


##### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To complete this step we must first associate each row of the X_select dataframe with the subject performing the activity.

The subject information is recorded in subject_test.txt and subject_train.txt. Similarly to Step 3 above we must complete the following:

1. Collect the data from subject_test.txt and subject_train.txt
2. rbind() the data in the correct order, used throughout this script: train first and then test
3. Apply the subject data to the rows in the X_select data frame.

At this point we have a dataframe with Subject and Activity values for each row. We can use chaining in dplyr to group_by() Subject and Activity and then use the summarise_each() to get a mean summary of each column grouped by Subject and Activity.

This results in a dataset that has a mean value for each measurement and for each subject and activity. There are 30 subjects and 6 activities so we have 180 rows in the dataframe. There is a column each for subject and activity, and we have 86 average mean and std measurements so we have 88 columns in the dataset.

Finally to add a little extra clarity we'll rename the measurements with "Average.Of" to show they are averages and 
replace triple dots with a single dot. Later all punctuation would be replaced by dots by default during the write.table() command so we'll leave these as they are

## The Resulting File: tidy_data.txt

The file that we get is a dataframe which has a mean value for each measurement for each subject and activity. There are 30 subjects and 6 activities so we have 180 rows in the dataframe. There is a column each for subject and activity, and we have 86 average mean and std measurements so we have a total of 88 columns in the dataset.

For more information on the file please read the *CODEBOOK.md* file.


