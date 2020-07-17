# Getting-and-Cleaning-Data-Course-Project
Peer graded assignment for Coursera: Getting and Cleaning Data Course Project

First, the folder 'UCI HAR Dataset' must be placed in the working directory for the run_analysis.R to work. The codes have comments (step 1 - 6) the describes what is going on. 

In step 1, the text files containing the training set and test set are loaded as data frames and combined vertically into a single data frame using rbind() as merged_dataset. This dataset contains all the observations for 561 features that were measured. 

In step 2, the names for all the 561 features are extracted from the features.txt as a data frame. From this data frame, all the feature names containing the term ‘mean()’ and std()’, which represents the average and standard deviation respectively, are identified based on their row positions. These positions are used to select out the respective columns from merged_dataset into a slimmer merged_dataset2. 

In step 3, the text files containing the training labels and test labels are loaded as data frames and combined vertically into a single data frame using rbind() as merged_label. Each row in merged_label corresponds to the respective row in merged_dataset2. Since the merged_label only contains numbers 1-6, another file which contains information on what activity each number represents is loaded as activity_label. Then, merge() is used to match the numbers in merged_label with the descriptive activity in activity_label to form merged_label2. The column in merged_label2 containing the descriptive activity names is then horizontally combined with merged_dataset2 using cbind() to produce merged_dataset3, which now contains activity names in the first column followed by measurements of mean and standard deviation. 

In step 4, the descriptive name for the columns on mean and standard deviation are extracted from the features data frame and applied to merged_dataset3 as column names, after ensuring the first column from step 3 is named ‘activity’. 

In step 5, a data frame to identify the subject for each row is created similar to the training and test labels and merged into merged_subject. The column which contains numbers uniquely identifying subjects is named as ‘subject’ and combined with merged_dataset3 to form merged_dataset4. The average of each of the mean and standard deviation columns grouped by each activity and each subject is calculated by first using group_by() function followed by summarise() from the dplyr package into merged_dataset5 data frame. To create a tidy dataset which only has one observation per row, pivot_longer() from tidyr package is used on merged_dataset5 to combine all the columns names except for subject and activity into 'variable' columns and their corresponding values into the 'average' column. 

In step 6, the resulting tidy data frame is exported as tidy_dataset.txt. 

