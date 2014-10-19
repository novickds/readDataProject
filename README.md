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
