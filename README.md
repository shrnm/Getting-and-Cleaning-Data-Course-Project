# Getting-and-Cleaning-Data-Course-Project
Peer graded assignment for Coursera: Getting and Cleaning Data Course Project

First, the folder 'UCI HAR Dataset' must be placed in the working directory for the run_analysis.R to work. The codes have comments (step 1 - 6) that describes its function.

In step 1, the training set and test set are loaded and combined. 

In step 2, the names for all the 561 features are extracted from the features.txt and the features containing the term 'mean()' and 'std()' are identified to select specific columns from the large dataset to produce a smaller dataset. 

In step 3, the training labels and test labels are combined and added to the dataset. The activity label is added as a new column to identify specific activities based on their number. 

In step 4, the descriptive name for the columns on mean and standard deviation are extracted and used as column names for the measurements. 

In step 5, a column to identify subject is extracted and added to the data frame. The average of each of the mean and standard deviation columns grouped by each activity and each subject is calculated and a tidy summary dataset is produced using the wide format. 

In step 6, the resulting tidy data frame is exported as UCI_HAR_tidy_dataset.txt. 

