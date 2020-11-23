test<-read.table("./UCI HAR Dataset/test/X_test.txt")
train<-read.table("./UCI HAR Dataset/train/X_train.txt")

#pull data from test set and training set

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#pull subject id numbers

features<-read.table("./UCI HAR Dataset/features.txt")

#pull names for data from features

activities_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
activities_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

#activities numbered 1-6 that correspond with data

mergedset<-rbind(test,train)

#merge test set and training set into one data frame

names(mergedset)<-features[,2]

#match names of features to data

library(dplyr)

culledset<-mergedset %>% select(matches(c("mean()", "std()"))) %>% select(-("angle(tBodyAccMean,gravity)":"angle(Z,gravityMean)"))

#these columns are the mean and standard deviation measurements for each measurement
#the last 6 columns include mean in their name but contain angles so they were excluded

#names of the columns are already in place from naming the mergedset cols with features

subjects<-rbind(subject_test,subject_train)
activities<-rbind(activities_test, activities_train)

#consolidate subject and activity data

activitieslist<-c("Walking", "Walking Upstairs", "Walking Downstairs", 
                  "Sitting", "Standing", "Laying")
activity<-activitieslist[activities[,1]]

culledsetmod<-cbind(subjects, activity, culledset)
names(culledsetmod)[1]<-"subjectID"

names(culledsetmod)<-gsub("-", "", names(culledsetmod))
names(culledsetmod)<-gsub("\\(", "", names(culledsetmod))
names(culledsetmod)<-gsub(")", "", names(culledsetmod))

#match subjects and activities with data, renames columns appropriately
#remove tricky characters

tidydataset <- culledsetmod %>% group_by(subjectID, activity) %>% summarize_all(mean)

write.table(tidydataset, "./courseprojectdata.txt", row.names = FALSE)

#create text file containing the data set