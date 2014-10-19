The tidy dataset has 180 observations and 68 variables
The first variable is the Activity which can be one of six values: walking, walking upstairs, 
walking downstairs, sitting, standing or laying. This was calculated from the activity variable in the dataset which was 
numeric values of 1-6. These were changed to descriptive values using the activity_labels.txt file.
The second variable is the subject number, which can be between 1 and 30.
The remaining 66 variables correspond to the mean motion calculations recorded for each subject and activity combination. 
The original variables where normalized to between -1 and 1. The variables in the resulting data set 
are the means of the mean and standard deviation calculations of these variables:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The variable names were derived from the features.txt and features_info.txt files.

Note that from the original dataset, the variable names containing “fBodyBody” were changed to “fBody”.
