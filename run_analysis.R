library(dplyr)

old.dir <- getwd()
dataset_folder <- file.path('UCI HAR Dataset')
setwd(dataset_folder)

#Step 1- Merges the training and the test sets to create one data set

training_set <- read.table('train/X_train.txt')
test_set <- read.table('test/X_test.txt')
merged_dataset <- rbind(training_set, test_set)

#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table('features.txt')
mean_sd_coll <- c(grep('mean\\(\\)', features$V2), grep('std\\(\\)', features$V2)) %>% sort
merged_dataset2 <- select(merged_dataset, all_of(mean_sd_coll))

#Step 3 - Uses descriptive activity names to name the activities in the data set

training_label <- read.table('train/y_train.txt')
test_label <- read.table('test/y_test.txt')
merged_label <- rbind(training_label, test_label)
activity_label <- read.table('activity_labels.txt')
merged_label2 <- merge(merged_label, activity_label, sort = FALSE)
merged_dataset3 <- cbind(merged_label2$V2, merged_dataset2)

#Step 3 - Appropriately labels the data set with descriptive variable names.

names(merged_dataset3) <- c('activity', features[mean_sd_coll, 2])

#Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.

subject_train <- read.table('train/subject_train.txt')
subject_test <- read.table('test/subject_test.txt')
merged_subject <- rbind(subject_train, subject_test)
names(merged_subject) <- 'subject'
merged_dataset4 <- cbind(merged_subject, merged_dataset3)
tidy_dataset <- merged_dataset4 %>% group_by(subject, activity) %>% summarise(across(everything(),mean))

#Step 6 - Output the tidy dataset as a txt file. 
setwd(old.dir)
write.table(tidy_dataset, file = 'UCI_HAR_tidy_dataset.txt', row.names = FALSE)
        

        


