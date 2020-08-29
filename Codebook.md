# Getting-and-Cleaning-Data-Course-Project
# Dataset
The data can be downloaded at the following link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Get the dataset
The code first downloads the zip package in which the data is stored locally via the URL. The packet is then unzipped by the unzip method. Unzip and you get a bunch of folders and TXT files. The files are then read separately using read.table.

# Variables in the code
thesubject_train, theY_train, theX_train, thesubject_test, theY_test, theX_test they are read from the subject_train.txt, y_train.txt, x_train.txt,  subject_test.txt, y_test.txt and x_test.txt files, respectively. active_labels and feature are read from activity_labels.txt and features.txt files.

train_set is the integration of training data, test_set is the integration of test data. Finally, combine the two data points above to final_set

Extracts only the measurements on the mean and standard deviation for each measurement. than creat new set data_set
