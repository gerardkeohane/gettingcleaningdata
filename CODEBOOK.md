---
title: "CODEBOOK.md"
author: "Gerard Keohane"
date: "24 May 2015"
---

###### *Repository*: gettingcleaningdata

Please see the README.md file for more detailed information regarding this repository.

This is the CODEBOOK for the data that is produced by the *run_analysis.R*, which is recorded in a file named *tidy_data.txt*

#### File Details

The file stores a table with 180 rows and 88 columns. To read, and view, the table use the following command:

```df <- read.table("tidy_data.txt", header=TRUE); View(df)```


Each row is a set of the average measurements of a set of features for a particular subject completing a particular activity.

---

- Subject
    - Reference for the subject partaking in the experiment
    - 1
        - 1..30

- Activity
    - The activity participated in
    - 1
        - LAYING
        - SITTING
        - STANDING
        - WALKING
        - WALKING_DOWNSTAIRS
        - WALKING_UPSTAIRS
                
- Average.Of.tBodyAcc.mean.X
    - An average measurement of the named feature
    - 1
    - Integer

- Average.Of.tBodyAcc.mean.Y
		- An average measurement of the named feature
		- 1
		- Integer

- Average.Of.tBodyAcc.mean.Z
    - An average measurement of the named feature
  	- 1
  	- Integer

- Average.Of.tBodyAcc.std.X
		- An average measurement of the named feature
		- 1
		- Integer

- Average.Of.tBodyAcc.std.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyAcc.std.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tGravityAcc.mean.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tGravityAcc.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tGravityAcc.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tGravityAcc.std.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tGravityAcc.std.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tGravityAcc.std.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccJerk.mean.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccJerk.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccJerk.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccJerk.std.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyAccJerk.std.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccJerk.std.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyro.mean.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyro.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyro.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyro.std.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyro.std.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyro.std.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyroJerk.mean.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyroJerk.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyroJerk.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyroJerk.std.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyroJerk.std.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyroJerk.std.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyAccMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccMag.std..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tGravityAccMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tGravityAccMag.std..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyAccJerkMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyAccJerkMag.std..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyroMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyroMag.std..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.tBodyGyroJerkMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.tBodyGyroJerkMag.std..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAcc.mean.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAcc.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAcc.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAcc.std.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAcc.std.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAcc.std.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAcc.meanFreq.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAcc.meanFreq.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAcc.meanFreq.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccJerk.mean.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAccJerk.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccJerk.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer 

- Average.Of.fBodyAccJerk.std.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccJerk.std.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAccJerk.std.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccJerk.meanFreq.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAccJerk.meanFreq.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccJerk.meanFreq.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyGyro.mean.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyGyro.mean.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyGyro.mean.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyGyro.std.X
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyGyro.std.Y
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyGyro.std.Z
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyGyro.meanFreq.X
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyGyro.meanFreq.Y
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyGyro.meanFreq.Z
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyAccMag.std..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyAccMag.meanFreq..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyBodyAccJerkMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyBodyAccJerkMag.std..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyBodyAccJerkMag.meanFreq..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyBodyGyroMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyBodyGyroMag.std..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyBodyGyroMag.meanFreq..
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.fBodyBodyGyroJerkMag.mean..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyBodyGyroJerkMag.std..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.fBodyBodyGyroJerkMag.meanFreq..
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.angle.tBodyAccMean.gravity.
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.angle.tBodyAccJerkMean..gravityMean.
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.angle.tBodyGyroMean.gravityMean.
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.angle.tBodyGyroJerkMean.gravityMean.
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.angle.X.gravityMean.
	- An average measurement of the named feature
	- 1
	- Integer

- Average.Of.angle.Y.gravityMean.
	- An average measurement of the named feature
	- 1
	- Integer
	
- Average.Of.angle.Z.gravityMean.
	- An average measurement of the named feature
	- 1
	- Integer
