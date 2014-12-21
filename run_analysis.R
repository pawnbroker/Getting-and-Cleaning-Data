# R version 3.1.1 (2014-07-10) -- "Sock it to Me"
#Copyright (C) 2014 The R Foundation for Statistical Computing
#Platform: x86_64-apple-darwin13.1.0 (64-bit)

library(plyr)

########################################### step 1 ###########################################
###### Merges the training and the test sets to create one data set. #######

#read train data sets
X_train<-read.table("train/X_train.txt")   # dim: 7352*561
y_train<-read.table("train/y_train.txt")   # dim: 7352*1
subject_train<-read.table("train/subject_train.txt") # dim: 7352*1

#read test data sets
X_test<-read.table("test/X_test.txt")   # dim: 2947*561
y_test<-read.table("test/y_test.txt")   # dim: 2947*1
subject_test<-read.table("test/subject_test.txt")   # dim: 2947*1

#combinde 
X_data<-rbind(X_train,X_test)   # dim: 10299*66
y_data<-rbind(y_train,y_test)   # dim: 10299*1
subject_data<-rbind(subject_train,subject_test) # dim: 10299*1

########################################### step 2 ###########################################
###Extracts only the measurements on the mean and standard deviation for each measurement. ###

#find the index of measurements on the mean and std
features<-read.table("features.txt")   
mean_and_std_index<-grep("-(mean|std)\\(\\)",features[,2])  # length: 66
 
#Extracts only the measurements on the chosen columns 
X_data<-X_data[,mean_and_std_index] # dim becomes: 10299*66

########################################### step 3 ###########################################
###### Uses descriptive activity names to name the activities in the data set #######

lables<-read.table("activity_labels.txt")  # Links the class labels with their activity name
y_data[,1]<-lables[y_data[,1],2] # replace labels with activity name

########################################### step 4 ###########################################
###### Appropriately labels the data set with descriptive variable names. ######

names(y_data) <- "activity"
names(subject_data)<-"subject"
names(X_data)<-features[mean_and_std_index,2]
all_data <- cbind(X_data, y_data, subject_data) # bind all data into a single set


########################################### step 5 ###########################################
### From all_data, creates a second, independent tidy data set with the average of each 
### variable for each activity and each subject.

#average each activity (6) and each subject (30), create a 180*66 data set
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Create the "results.txt" with write.table() using row.name=FALSE
write.table(averages_data,"results.txt",row.name=FALSE) 

