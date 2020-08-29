# Getting-and-Cleaning-Data-Course-Project
The project data is downloaded via the following link, but the code to download and unzip is written in the R file.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Files
1.run_analysis.R Includes the code needed to complete the project

2.CodeBook.md Describes and explains the meaning of variables in code.

3.second_data.txt Is the second clean file that is generated

# How script works
The code first downloads the zip package in which the data is stored locally via the URL.The packet is then unzipped by the unzip method.Unzip and you get a bunch of folders and TXT files.The files are then read separately using read.table.The data is then sorted out in the following steps.

1Merges the training and the test sets to create one data set.

2Extracts only the measurements on the mean and standard deviation for each measurement.

3Uses descriptive activity names to name the activities in the data set

4Appropriately labels the data set with descriptive variable names.

5From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally, the sorted data is written out through the write.table method.
