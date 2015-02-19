## required package "reshape2"


library(reshape2)

## this block of code reads all required data sets from your working directory

trainY <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
trainX <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
trainSubject <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
features <- read.table(file = "UCI HAR Dataset/features.txt")
activity <- read.table(file = "UCI HAR Dataset/activity_labels.txt")

testY <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
testX <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
testSubject <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")

## this block of code prepares the labels for the test and training data columns 
features$V1 <- NULL
features <- t(features)
features <- as.list(features)


## this block of code combines the training and test data with the Subject and Activity data

train <- cbind(trainSubject,trainY,trainX)
names(train) <- c(V1 = "Subject", V1.1 = "Activity", features)
test <- cbind(testSubject,testY,testX)
names(test) <- c(V1 = "Subject", V1.1 = "Activity", features)
ttcombined <- rbind(train,test)
ttcombined <- ttcombined[order(ttcombined$Subject),]

## this block of code subsets the combined data to only include std dev and mean results

ttsub <- ttcombined[,grep("Subject|Activity|mean|std", colnames(ttcombined), ignore.case=FALSE)]
ttsub <- ttsub[,-grep("q", colnames(ttsub), ignore.case = TRUE)]

## this block of code converts the activity code to the activity description

activity$V1 <- NULL
activity <- t(activity)
activitylabels <- as.list(activity)
ttsub$Activity <- factor(ttsub$Activity, levels = c(1,2,3,4,5,6), labels = activitylabels)

## this block of code creates and saves a new dataset with the average of each variable for each activity and each subject.

ttsublong<- melt(ttsub, id = c("Subject", "Activity"))
dim(ttsublong)
ttaverages <- dcast(ttsublong, Subject + Activity ~ variable,mean)
write.table(ttaverages, file = "tt_stddev_and_mean_averages.txt", row.name = FALSE, sep = " ")
dim(ttaverages)
