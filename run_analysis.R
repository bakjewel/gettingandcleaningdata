#read in data for training
trainset <- read.table("train/X_train.txt")
trainlabel <- read.table("train/y_train.txt")
trainsubject <- read.table("train/subject_train.txt")

#read in data for test
testset <- read.table("test/X_test.txt")
testlabel <- read.table("test/y_test.txt")
testsubject <- read.table("test/subject_test.txt")

#label the variable names
features <- read.table("features.txt")
names(trainset) <- features[,2]
names(testset) <- features[,2]

#add subject and activity data to the dataset
train <- cbind(trainsubject, trainlabel, trainset)
names(train)[1:2] <- c("Subject", "Activity")
test <- cbind(testsubject, testlabel, testset)
names(test)[1:2] <- c("Subject", "Activity")

#Name the activities
activitylabels <- read.table("activity_labels.txt")
trans <- as.character(activitylabels[,2])
names(trans) <- as.character(activitylabels[,1])
train$Activity <- trans[as.character(train$Activity)]
test$Activity <- trans[as.character(test$Activity)]

#Merge train and test
merge <- rbind(train, test)

#select only mean and std
varnames <- names(merge)
meanstd <- (grepl("Subject" , varnames) | 
                grepl("Activity" , varnames) | 
                grepl("mean" , varnames) | 
                grepl("std" , varnames))
meanstdset <- merge[,meanstd==TRUE]

# create 2nd tidy data set with  the average of each variable for each activity and each subject
tidyset2nd <- aggregate(. ~Subject + Activity, meanstdset, mean)
tidyset2nd <- secTidySet[order(tidyset2nd$Subject, tidyset2nd$Activity),]

write.table(tidyset2nd, "tidyset2nd.txt", row.name=FALSE)
