## Install dplyr and use for perfoming vairous operation 

library(dplyr)
setwd("C:/Users/sriji/Desktop/AWS/Datascience/CleanData/UCI HAR Dataset/")


testDataSet <- read.table("./test/subject_test.txt")
colnames(testDataSet) <- sub("V1","subject",colnames(testDataSet))

test_set <- read.table("./test/X_test.txt")
colnames(test_set) <- sub("V","data_set",colnames(test_set))

test_labels <- read.table("./test/y_test.txt")
colnames(test_labels) <- sub("V1","activity",colnames(test_labels))

test_body_accelerator_x_info <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
colnames(test_body_accelerator_x_info) <- sub("V","body_acceleratorX",colnames(test_body_accelerator_x_info))

test_body_accelerator_y_info <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
colnames(test_body_accelerator_y_info) <- sub("V","body_acceleratorY",colnames(test_body_accelerator_y_info))

test_body_accelerator_z_info <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
colnames(test_body_accelerator_z_info) <- sub("V","body_acceleratorZ",colnames(test_body_accelerator_z_info))

test_body_gyro_x_info <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
colnames(test_body_gyro_x_info) <- sub("V","gyro_acceleratorX",colnames(test_body_gyro_x_info))

test_body_gyro_y_info <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
colnames(test_body_gyro_y_info) <- sub("V","gyro_acceleratorY",colnames(test_body_gyro_y_info))

test_body_gyro_z_info <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
colnames(test_body_gyro_z_info) <- sub("V","gyro_acceleratorZ",colnames(test_body_gyro_z_info))

test_total_accelerator_x_info <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
colnames(test_total_accelerator_x_info) <- sub("V","total_acceleratorX",colnames(test_total_accelerator_x_info))

test_total_accelerator_y_info <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
colnames(test_total_accelerator_y_info) <- sub("V","total_acceleratorY",colnames(test_total_accelerator_y_info))


test_total_accelerator_z_info <- read.table("./test/Inertial Signals/total_acc_z_test.txt")
colnames(test_total_accelerator_z_info) <- sub("V","total_acceleratorZ",colnames(test_total_accelerator_z_info))

testDataSet <- mutate(testDataSet,test_labels,test_set,test_body_accelerator_x_info,test_body_accelerator_y_info,test_body_accelerator_z_info,
                    test_body_gyro_x_info,test_body_gyro_y_info, test_body_gyro_z_info,test_total_accelerator_x_info,
                    test_total_accelerator_y_info,test_total_accelerator_z_info)

# data reading for train 
trainDataSet <- read.table("./train/subject_train.txt")
colnames(trainDataSet) <- sub("V1","subject",colnames(trainDataSet))

train_set <- read.table("./train/X_train.txt")
colnames(train_set) <- sub("V","data_set",colnames(train_set))

train_labels <- read.table("./train/y_train.txt")
colnames(train_labels) <- sub("V1","activity",colnames(train_labels))

train_body_accelerator_x_info <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
colnames(train_body_accelerator_x_info) <- sub("V","body_acceleratorX",colnames(train_body_accelerator_x_info))

train_body_accelerator_y_info <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
colnames(train_body_accelerator_y_info) <- sub("V","body_acceleratorY",colnames(train_body_accelerator_y_info))

train_body_accelerator_z_info <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
colnames(train_body_accelerator_z_info) <- sub("V","body_acceleratorZ",colnames(train_body_accelerator_z_info))

train_body_gyro_x_info <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
colnames(train_body_gyro_x_info) <- sub("V","gyro_acceleratorX",colnames(train_body_gyro_x_info))

train_body_gyro_y_info <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
colnames(train_body_gyro_y_info) <- sub("V","gyro_acceleratorY",colnames(train_body_gyro_y_info))

train_body_gyro_z_info <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
colnames(train_body_gyro_z_info) <- sub("V","gyro_acceleratorZ",colnames(train_body_gyro_z_info))

train_total_accelerator_x_info <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
colnames(train_total_accelerator_x_info) <- sub("V","total_acceleratorX",colnames(train_total_accelerator_x_info))

train_total_accelerator_y_info <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
colnames(train_total_accelerator_y_info) <- sub("V","total_acceleratorY",colnames(train_total_accelerator_y_info))


train_total_accelerator_z_info <- read.table("./train/Inertial Signals/total_acc_z_train.txt")
colnames(train_total_accelerator_z_info) <- sub("V","total_acceleratorZ",colnames(train_total_accelerator_z_info))

trainDataSet <- mutate(trainDataSet,train_labels, train_set,train_body_accelerator_x_info,train_body_accelerator_y_info,train_body_accelerator_z_info,
                      train_body_gyro_x_info,train_body_gyro_y_info, train_body_gyro_z_info,train_total_accelerator_x_info,
                      train_total_accelerator_y_info,train_total_accelerator_z_info)


# merge and creation of new table with test and train data ,Data is merged with common subject .
mergedDataSet <- rbind(testDataSet,trainDataSet)


## mean and standard deviation for each measurement


data_set_mean <- mergedDataSet[,3:length(mergedDataSet)] %>% sapply(mean)
data_set_std <- mergedDataSet[,3:length(mergedDataSet)] %>% sapply(sd)



### descriptive name for activity set in merged data set

activity_labels <- read.table("./activity_labels.txt")
activityMergedData <- mergedDataSet
activityMergedData$activity[mergedDataSet$activity==1] <- activity_labels[1,2]
activityMergedData$activity[mergedDataSet$activity==2] <- activity_labels[2,2]
activityMergedData$activity[mergedDataSet$activity==3] <- activity_labels[3,2]
activityMergedData$activity[mergedDataSet$activity==4] <- activity_labels[4,2]
activityMergedData$activity[mergedDataSet$activity==5] <- activity_labels[5,2]
activityMergedData$activity[mergedDataSet$activity==6] <- activity_labels[6,2]


## proper descriptive name for variable name for feature set

features <- read.table("./features.txt")
features[,2] <- sub("^t","time",features[,2]) 
features[,2] <- sub("^f","frequency",features[,2])
features[,2] <- sub("\\(\\)","",features[,2])
features[,2] <- sub("-","",features[,2])
features[,2] <- sub("BodyBody","Body",features[,2])
features[,2] <- sub("Mag","Magnitude",features[,2])



### creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)

colMergedNames <- colnames(mergedDataSet)


dataMelt <- melt(mergedDataSet,id=c("subject","activity"),measure.vars = colMergedNames[!(colMergedNames %in%  c("subject","activity"))])

avgTidySet <- dcast(dataMelt, subject+activity ~ variable,mean)

print(avgTidySet)

