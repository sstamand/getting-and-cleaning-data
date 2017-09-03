Coursera Data Science Specialization: Getting and Cleaning Data Course Project
Version 1.0
==============================================================================

The dataset includes the following files:

- 'README.txt'

- 'CodeBook.txt': Shows information about the data, describes the variables, 
		  and transformations performed to cleanup the data.

- 'run_analysis.R': The R script used for the analysis of the raw dataset.

==============================================================================

To run the analysis, first import the Human Activity Recognition Using 
Smartphones Dataset (Version 1.0) from smartlabs. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A link to the raw dataset is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The analysis begins by loading the appropriate datasets, their labels, and the 
subject identifiers. 

Part 1 of the dataset merges the training and test set to create one dataset
using the rbind function. The new dataset is called 'master_set'.

Part 2 extracts the mean and standard deviations for each measurement, creating
a new dataset called 'narrow_set'. This information is retrieved by searching
for the mean and standard deviation (std) in the variable names and subsetting
the master set with variables that include these patterns.

Part 3 changes the activity indicator to a factor variable and replaces the
numeric indicators with descriptive names. The six activites are labelled
'walking', 'walking_upstairs', 'walking_downstairs', 'sitting', 'standing',
and 'laying'.

Part 4 labels the data set with descriptive variable names by removing
unecessary characters including the periods, the 'Mag' descriptor which did
not provide a unique identifier as it applied to all variable names, and 
duplicated indicator 'body'. The variables and the pattern of their names
is explained in the CodeBook.md file.

Part 5 creates a tidy dataset by taking the mean of columns for each activity 
and each subject. First it splits the data by subject and activity, and then it 
take colMeans of each numeric row in every element of the split list, bind rows 
to create full set.