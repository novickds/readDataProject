readDataProject
===============

This tidy data program reads data from the UCIHAR test and training data sets. 
It assumes that the UCIHAR directory is in the current working directory and contains the datasets 
in a subdirectory test and train as well as the features.txt data set in the UCIHAR directory. 
This directory structure is as unzipped when the data is downloaded.
This program also assumes that the dplyr program is installed. 
Output is a table called tidy_har with 180 rows and 68 columns. 
The rows correspond to subject/activity combinations and the columns correspond 
to the means of the 66 movement measurement variables in addition to the subject and activity.
This table is written out to the file tidy_read_data_novickds.txt.

Read Data Course Project Files

This project includes the R script called run_analysis.R which reads in the UCIHAR data and 
creates a tidy data set of means of the mean and standard devation data.
A codebook called Codebook.md

Program Highlights
1. Merge the training and test sets to create one data set
The program reads in the training and test data. 
The data read is the subject, activity and the 561 varibles measured.
The data is read from the UCIHAR directory within the current working directory.

2. Extract only the measurements on the mean and standard deviation for each measurement
The program figures out which variables are means or standard deviation calculations by searching for
mean() or std(). Other variables that contain the words mean/Mean or std are not used.
A new table is created with only these variables and the subject and activity variables.

3. Use descriptive activity names to name the activities in the data set
The activity is recoded to be a label rather than number. Values are walking, walking upstairs,
walking downstairs, sitting, standing and laying.

4. Label the data set with descriptive variable names
The symbols "()-" and "()" were removed from the variable names and "BodyBody" was changed to "Body".

5. From the data set in step 4, create a second, independent tidy data set with the 
average of each variable for each activity and each subject.

To do this, the summarise_each function was used thanks to Peter Sali who suggested this in the Forum.
