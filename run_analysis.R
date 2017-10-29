library(dplyr)

#Read and load features for the data and remove untidy brackets from features data
features<-gsub("\\(\\)","",as.vector(read.table("UCI HAR Dataset/features.txt")[,2]))
activ_labels<-as.vector(read.table("UCI HAR Dataset/activity_labels.txt")[,2])

# mean and standard diviation columns to keep
col_nums<-c(1:5, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 253,254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)

#Read and load files
Xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")[col_nums]
train_full<-cbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/train/y_train.txt"), Xtrain)
Xtest<-read.table("UCI HAR Dataset/test/X_test.txt")[col_nums]
test_full<-cbind(read.table("UCI HAR Dataset/test/subject_test.txt"), read.table("UCI HAR Dataset/test/y_test.txt"), Xtest)

#Combine training and testing data into one dataframe
data_full<-rbind(train_full, test_full)
colnames(data_full)<-c("subject", "activity", features[col_nums])

#rename the variables for the activities to their original activity names
for(number in c(1:6)){data_full$activity[data_full$activity == number]<-activ_labels[number]}

#Remove no longer needed dataframes from the environment
#rm(Xtest, Xtrain, test_full, train_full, features, activ_labels)

#group the data by the subject and activity
grouped_data<-group_by(data_full, subject, activity)

#Average all the values for each variable for each subject for each activity
grouped_mean_data<-summarise_all(grouped_data, funs(mean))

#Write the grouped mean data to a text file in table format
write.table(grouped_mean_data, "tidy_data.txt", row.name = FALSE)
