library(dplyr)
##Download and unzip the installation package
theurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")){
  dir.create("./data")
} 
download.file(theurl, destfile = "./data/project_data.zip")
listZip <- unzip("./data/project_data.zip", exdir = "./data")

##Read the relevant data inside
theX_train<- read.table("./data/UCI HAR Dataset/train/X_train.txt")
theX_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
theY_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
theY_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
thesubject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
thesubject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
active_labels<- read.table("./data/UCI HAR Dataset/activity_labels.txt")
feature <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

##1.Merges the training and the test sets to create one data set.
train_set <- cbind( thesubject_train,theY_train, theX_train)
test_set <- cbind(thesubject_test,theY_test, theX_test)
final_set <- rbind(train_set, test_set)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
feature <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
newname<-grep(("mean\\(\\)|std\\(\\)"), feature[,2],value = TRUE)
newindex<-grep(("mean\\(\\)|std\\(\\)"), feature[,2])
newindex<-c(1,2,newindex+2)
data_set<-final_set[,newindex]
names(data_set)[c(1,2)]<-c("subject", "activity")
names(data_set)[c(3:ncol(data_set))]<-newname

##3.Uses descriptive activity names to name the activities in the data set
names(active_labels[1])<-"activity"
data_set<-inner_join(data_set,active)
data_set$activity<-data_set$V2
data_set$V2 <- NULL

##4.Appropriately labels the data set with descriptive variable names.
names(data_set) <- gsub("\\()", "", names(data_set))

##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
second_data <- data_set %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(second_data, "./second_data.txt",row.names = FALSE)
