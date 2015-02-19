# Analysis of Smart Phone Dataset
As part of Coursea.org - Getting and collecting data course project

Data sourced from UCI MAchine Learning Repository - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Human Activity Recognition Using Smartphones Data Set - 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Intention of this script is to merge, clean and summarize multiple datasets and output a .txt file named "tt_stddev_and_mean_averages.txt". This file returns the average for each Subject and Activity of all Mean and Std deviation data gathered.   This returned a total of 66 variables for each Subjects(30) activities(6) analysed.  Freqmean and angle(of mean) variables were not included.


#Requirements and assumptions:

It is assumed the above data is downloaded and stored in your working directory

The "reshape2" package is installed

#run_analysis.R Script summary

run_analysis.R Script is broken into 5 blocks of code

1. this block of code reads all required data sets from your working directory
2. this block of code prepares the labels for the test and training data columns 
3. this block of code subsets the combined data to only include std dev and mean results
4. this block of code converts the activity code to the activity description
5. this block of code creates and saves a new dataset with the average of each variable for each activity and each subject.







