
### Notes on setting up the Working Directory
# This script should be placed in a working directory that includes the "UCI HAR Dataset" downloaded from:

#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# and unzipped.

# Please see the README.md file for further details.
# The file created at the end of this script will be written to the same working directory and named: "tidy_data.txt"

### Step 1: Merges the training and the test sets to create one data set.
# From our initial exploration of the training and test data, and from reading the README.txt we know:

#   1. The training and test data both have 561 columns
#   2. The variables recorded in the columns in the training data correspond to the variables recorded in the data in the test data
#   3. The features.txt file tells us what variables are recorded in each of the columns for both files, and can therefore be used as the headers or names of those columns
#   4. The values recorded in the columns of both training and test files are of class "numeric" - we'll use this information to speed up the process of importing both files

# This gives us a couple of options for achieving the first step, looking ahead to Step 2. 
# We're going to take the following approach:

#   1. Use the "Reading Large Table" approach to read in both training and test data - we know the columns are the same so we only need to establish the colclasses once.
#   2. Row Bind the test data onto the train data in a dataframe named "X_all"
#   3. Collect the column names from features.txt file - these are stored in the "V2" column
#   4. The column names are duplicated - so we're going to make them unique to allow us to use "dplyr" later on
#   5. Apply the column names to the data

# Establish the class of each column to speed up reading the tables of data
X_test_initial <- read.table("UCI HAR Dataset/test/X_test.txt", nrows=100)
classes <- sapply(X_test_initial,class)

# Read in both datasets explicitly setting the class of the column
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses=classes)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses=classes)

# Bind the two datasets together - we're going to put "train" first and "test" second.
# The order is important later when applying the Activity Description Names
X_all <- rbind(X_train, X_test)

# Read in the features labels - we know they are stored in the "V2" column
features_table <- read.table("UCI HAR Dataset/features.txt")
features <- features_table$V2

# Make the features unique
features <- make.names(features, unique = TRUE)

# Apply the feature to the names of the columns in data - at this point we are completing, in advance, work required in Step 4 below
names(X_all) <- features

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Based on our reading of the features_info.txt and features.txt files we see that the columns which measure mean and standard deviation 
# contain the strings "mean", "Mean" and "std". We're going to collect all columns that make a reference to these strings. 
# To do this we're going to use library(dplyr) and the select() function to select only columns where the name of the column matches
# these strings. We'll use matches() special function to check for the strings. matches() will ignore case by default.

# Load library(dplyr)
library(dplyr)

# Select only the columns with the string 'mean' or 'std' in the name - case is ignored by default
X_select <- select(X_all, matches("mean|std"))

### Step 3: Uses descriptive activity names to name the activities in the data set
# The reference to the activities is in the y_train.txt and y_test.txt files. During our exploration of the data
# we say that the number of rows in each file is equivalent to the number of rows in the "X_" files. 
# We will use the following process to collect the two sets of data togehter and associate activities with each
#   1. Read in y_train.txt and y_test.txt and rbind the files into y_all data frame
#   2. Read in the activity_labels.txt file 
#   3. Each number in V1 of y_all references an activity in V1 of activity_labels which is described by the corresponding value in V2 of activity_labels
#   4. We will join y_all and activity_labels on the basis of id V1
#   5. Using the plyr function join() will maintain the order of activities in the y_all file this is important when they are later applied to the X_all file
#   6. Column bind colum V

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
activity_labels <- read.table("UCI HAR Dataset//activity_labels.txt")

# Bind y_train and y_test. Remember, the bind order is important here. 
y_all <- rbind(y_train, y_test)

# Join the y_all and activity_labels by the "V1" column in both, put y_all first to preserve the order in y_all
# We need to load the plyr library to use join
library(plyr)
y_join <- join(y_all, activity_labels)

# Column bind the Activity labels to the left of X_select
# First get just the Activity labels (which are in the correct order)
Activity <- y_join$V2

# Then column bind Activity to X_select
X_select <- cbind(Activity, X_select)

### Step 4: Appropriately labels the data set with descriptive variable names. 
# We have already labeled the variable names as part of Step 1. Originally the variable names that came with the data would have been 
# V1, V2, etc. We used the features.txt file to apply more meaningful and descriptive names to each Variable in Step 1 above
# so we could later select only columns that included "mean" or "std" in their name using the select() function in the
# dplyr library.
# We will also do some further tidy up work on the names later in Step 5. 
# As a result this step has already been completed.


### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# To complete this step we must first associate each row of the X_select dataframe with the subject performing the activity.
# The subject information is recorded in subject_test.txt and subject_train.txt. Similarly to Step 3 above we must complete the following:
#   1. Collect the data from subject_test.txt and subject_train.txt
#   2. rbind() the data in the correct order, used throughout this script: train first and then test
#   3. Apply the subject data to the rows in the X_select data frame.

# Read the data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Bind the rows in the correct order
subject_all <- rbind(subject_train, subject_test)
# Collect the data in a vector named Subject - this will name the column tidily when bound
Subject <- subject_all$V1
# Bind the column to the left of X_select
X_select <- cbind(Subject, X_select)

# At this point we have a dataframe with Subject and Activity values for each row. We can use
# chaining in dplyr to group_by() Subject and Activity and then use the summarise_each() to get a mean 
# summary of each column grouped by Subject and Activity.
# This results in a dataset that has a mean value for each measurement and for each subject and activity. 
# There are 30 subjects and 6 activities so we have 180 rows in the dataframe. There is a column each for subject
# and activity, and we have 86 average mean and std measurements so we have 88 columns in the dataset.

tidy_data <- X_select %>%
              group_by(Subject, Activity) %>%
              summarise_each(funs(mean))

# Finally to add a little extra clarity we'll rename the measurements with "Average.Of" to show they are averages and 
# replace triple dots with a single dot
# Later all punctuation would be replaced by dots by default during the write.table() command so we'll leave these as they are


headers <- names(tidy_data)
headers <- paste("Average.Of.", headers, sep = "")
headers[1:2] <- c("Subject", "Activity")
headers <- gsub("...", ".", headers, fixed = TRUE)
names(tidy_data) <- headers

# And write the tidy data set to a local .txt file using the write.table() command with row.name=FALSE

write.table(tidy_data, file="tidy_data.txt", row.names = FALSE)

# To read back in the data and view it use the following commands:
# df <- read.table("tidy_data.txt", header=TRUE); View(df)
