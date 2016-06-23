##Read and download the file; and decompress it as well  
filename <- "DS.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileURL, filename, method="curl")
unzip(filename) 

##Load the datasets
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")
training_set_Activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainining_set_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_set_extract <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

##Load activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

##Extract data based only on occurences of "mean" and "standard deviation (std)" anywhere 
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

#Merge datasets 
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)
colnames(allData) = toupper(colnames(allData))

##Melt and apply the linear model to the casted data  
allData.melted <- melt(allData, id = c("SUBJECT", "ACTIVITY"))
allData.mean <- dcast(allData.melted, SUBJECT + ACTIVITY ~ variable, mean)

##Write the table to the text file 
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)


