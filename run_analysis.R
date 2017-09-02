
##### Coursera Data Science Specialization: Getting and Cleaning Data Course Project

#### Repo: coursera-getting-and-cleaning-data


### Setting working directory, loading data, and cleaning train & test set

setwd("./Coursera/Assignments/Course 3, 
      Week 4/coursera-getting-and-cleaning-data")

## the features.txt file contains the rownames for the training and test sets
features <- read.table("./UCI HAR Dataset/features.txt", row.names = 1)
rnames <- as.character(features[,1])

## the subject_x.txt files contain the id of the subject
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.name = "subject", colClasses = "factor")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.name = "subject", colClasses = "factor")

## the x_labels.txt files contain the activity being performed by the subject
training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt",
                              col.name = "activity", colClasses = "factor")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt",
                          col.name = "activity", colClasses = "factor")

## load datasets and merge with subject and activity identifiers
training_set <- cbind(subject_train, training_labels, 
                      read.table("./UCI HAR Dataset/train/X_train.txt",
                                    col.names = rnames))
test_set <- cbind(subject_test, test_labels, 
                  read.table("./UCI HAR Dataset/test/X_test.txt",
                             col.names = rnames))


### 1. Merge the training and the test sets to create one data set

master_set <- rbind(training_set, test_set)


### 2. Extract only mean and standard deviation for each measurement

narrow_set <- master_set[,c(1, 2, 
                            grep(pattern = "mean..$|std..$", 
                                 names(master_set)))]

### 3. Use descriptive activity names to name the activities in the data set

narrow_set$activity <- factor(narrow_set$activity,
                              levels = 1:6,
                              labels = tolower(c("WALKING", 
                                                 "WALKING_UPSTAIRS", 
                                                 "WALKING_DOWNSTAIRS", 
                                                 "SITTING", 
                                                 "STANDING", 
                                                 "LAYING")))

### 4. Appropriately labels the data set with descriptive variable names

#all lower case, remove dots and unecessary 'mag' descriptor
names(narrow_set) <- gsub("\\.|[Mm]ag", "", tolower(names(narrow_set)))
# remove duplicated 'body' descriptor
names(narrow_set) <- gsub("bodybody", "body", tolower(names(narrow_set)))

### 5. Create data set w/ average of each variable for each activity & subject

# split the dataset by subject and by activity
split_subj_acti <- split(narrow_set, paste(narrow_set$subject, 
                                           narrow_set$activity))

# take mean of columns for each activity and each subject, take colMeans of
# each numeric row in every element of the split list, bind rows to create
# full set
tidy_data <- data.frame()
for(i in 1:length(split_subj_acti)) {
    tidy_data <- rbind(tidy_data, cbind(split_subj_acti[[i]][1,1:2], 
                        t(data.frame(colMeans(split_subj_acti[[i]][, 
                        sapply(split_subj_acti[[i]], is.numeric)])))))
}

write.csv()