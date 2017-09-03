Coursera Data Science Specialization: Getting and Cleaning Data Course Project
Version 1.0
==============================================================================

The original dataset is the Human Activity Recognition Using Smartphones 
Dataset (Version 1.0) from smartlabs. The data represent data collected from 
accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A link to the raw dataset is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==============================================================================

The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals. These time domain signals were captured at a 
constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd 
order low pass Butterworth filter with a corner frequency of 20 Hz to remove 
noise. Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals using another low pass Butterworth filter with 
a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and 
angular velocity were derived in time to obtain Jerk signals. Also the 
magnitude of these three-dimensional signals were calculated using the 
Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some 
of these signals (prefix 'f' to indicate frequency domain signals). 

The variable names have up to 5 components:
1. t and f refer to the time domain and frequency domain signals, respectively.
2. body and gravity refer to body and gravity acceleration signals, respectively.
3. acc and gyro refer to acceloromter and gyroscope signals, respectively.
4. optional jerk refers to jerk signal.
5. mean and std refer to the mean and standard deviation of the measurement, respectively.

There are a total of 20 variables:
  suject : an identifer for the 30 subjects of the experiment
  activity : is a factor variable for the six types of activities performed
		(walking, walking upstairs, walking downstairs, sitting
		 standing, and laying)
18 variables capturing the data from these activities, as described above:
  tbodyaccmean 
  tbodyaccstd
  tgravityaccmean
  tgravityaccstd
  tbodyaccjerkmean
  tbodyaccjerkstd
  tbodygyromean
  tbodygyrostd
  tbodygyrojerkmean
  tbodygyrojerkstd
  fbodyaccmean
  fbodyaccstd
  fbodyaccjerkmean
  fbodyaccjerkstd
  fbodygyromean
  fbodygyrostd
  fbodygyrojerkmean
  fbodygyrojerkstd

==============================================================================

The transformed data in data.csv is the mean of each variable listed above for 
each subject and each activity.