## This script is to be run in the working directory
## which contains the "UCI HAR Dataset" folder

## First, extract the data from the text files.
allsubjects_test<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
allX_test<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
allY_test<-read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")

allsubjects_train<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
allX_train<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
allY_train<-read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")

## Read the data information to determine which fields to keep
lables<-read.table(".\\UCI HAR Dataset\\features.txt")

## Extract the indicies where data corresponds to 
## mean or a standard deviation (std)
key<-rbind(lables[grep('mean',lables[,2]),],lables[grep('std',lables[,2]),])
key<-key[order(key$V1),]

## Filter data from all test and train files that matches the 
## mean or std. Note it is critical that each of the observations
## must have the same number of data points. 
refined_test<-allX_test[,key[,1]]
refined_train<-allX_train[,key[,1]]

## Combine the different columns for test and train data
## Note that it is critical that the subjects list, dataset,
## and activity list must have the same number of observations
filtered_test<-cbind(allsubjects_test, refined_test, allY_test)
filtered_train<-cbind(allsubjects_train, refined_train, allY_train)

## Combine the two datasets 
fullDataset<-rbind(filtered_test, filtered_train)

## Extract column titles from 'features.txt' provided and add in 
## 'SubjectID' field and 'Activity'
columndetails<-c('SubjectID', levels(droplevels(key$V2)), 'Activity')
colnames(fullDataset)<-columndetails

## Add in descriptive Activity information
## Note that the Activity IDs must strictly meet the range provided.
## Step 4 Result
fullDataset$Activity <- factor(fullDataset$Activity,levels = c(1,2,3,4,5,6),labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Summarizing
tidyData<-aggregate.data.frame(fullDataset, list(fullDataset$SubjectID,fullDataset$Activity), "mean")

## Order by subjectID to understand Data easier. Write it to text file.
tidyData_ordered<-tidyData[order(tidyData$Group.1),]
write.table(tidyData_ordered, ".\\run_analysis.R_output.txt")