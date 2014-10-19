library(dplyr)

## 1. Merge the training and test sets to create one data set
## read in training and test data 
## the data read is the subject, activity and the 561 varibles measured
## data is read from the UCIHAR directory within the working directory

## read test data
xtest<- read.table("UCIHAR/test/X_test.txt")
subject_test<-read.table("UCIHAR/test/subject_test.txt")
names(subject_test)<-"Subject"
y_test<-read.table("UCIHAR/test/y_test.txt")
names(y_test)<-"Act"

## read training data
xtrain<- read.table("UCIHAR/train/X_train.txt")
subject_train<-read.table("UCIHAR/train/subject_train.txt")
names(subject_train)<-"Subject"
y_train<-read.table("UCIHAR/train/y_train.txt")
names(y_train)<-"Act"

## read variable names
features<- read.table("UCIHAR/features.txt")

## After the data is read into individual files, it is combined into one file
test<- data.frame(subject_test,y_test,xtest)
train<- data.frame(subject_train,y_train,xtrain)
ucihar<- rbind(test,train)

## 2. Extract only the measurements on the mean and standard deviation for each measurement
## figure out which vars have "mean" or "std"
mean <- grep("mean\\()", features$V2)
std <- grep("std\\()",features$V2)
meanstd <- c(mean,std)
smeanstd<- sort(meanstd)

## pull out only the variables that represent a  "mean" or "std" 
## variables used had mean() or std() indications in the variable names
ms_index<-c(1,2,smeanstd+2)
mshar<- ucihar[,ms_index]

## 3. Use descriptive activity names to name the activities in the data set
## recode the activity to be a label rather than number
for (i in 1:nrow(mshar)) {if (mshar$Act[i]==1) {mshar$Activity[i]<-"Walking"}
                    else if (mshar$Act[i]==2) {mshar$Activity[i]<-"Walking Upstairs"}
                    else if (mshar$Act[i]==3) {mshar$Activity[i]<-"Walking Downstairs"}
                    else if (mshar$Act[i]==4) {mshar$Activity[i]<-"Sitting"}
                    else if (mshar$Act[i]==5) {mshar$Activity[i]<-"Standing"}
                    else {mshar$Activity[i]<-"Laying"}
}

ind<-3:(ncol(mshar)-1)
indd<-c(1,ncol(mshar),ind)
new_mshar<-mshar[,indd]

## 4. Label the data set with descriptive variable names
## Remove the "()-" and "()" from the variable names and change "BodyBody" to "Body"

names<-features$V2[smeanstd]
temp<-sub("\\()-","",names)
ttemp<-sub("\\()","",temp)
names<-sub("fBodyBody","fBody",ttemp)
names(new_mshar)<-c("Subject", "Activity", as.character(names))

## 5. From the data set in step 4, create a second, independent tidy data set with the 
##  average of each variable for each activity and each subject.
bymshar <- group_by(new_mshar,Activity,Subject)
tidy_har <- summarise_each(bymshar,funs(mean))

## write tidy data to text file
write.table(tidy_har,file="tidy_read_data_novickds.txt")
