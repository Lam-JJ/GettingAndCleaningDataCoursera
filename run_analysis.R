##Set parent directory
setwd("C:/Users/User/Desktop/Coursera/Part7/UCI HAR Dataset")
parent <- getwd()

##Initialise data.table 
library(data.table)
library(dplyr)

##Get test data into a DF
setwd("./test")
subtest <- read.table("subject_test.txt",header = FALSE)
xtest <- read.table("X_test.txt",header = FALSE)
ytest <- read.table("Y_test.txt",header = FALSE)
test  <- rep("test",nrow(ytest))
test.df <- data.table(subtest,ytest,test,xtest)
setwd(parent)

##Get training data into a DF
setwd("./train")
subtrain <- read.table("subject_train.txt",header = FALSE)
xtrain <- read.table("X_train.txt",header = FALSE)
ytrain <- read.table("Y_train.txt",header = FALSE)
train  <- rep("train",nrow(ytrain))
train.df <- data.table(subtrain,ytrain,train,xtrain)
setwd(parent)

##Replace names of column for datatable variable
featurename <- read.table("features.txt",header = FALSE)

names(test.df)[1] <- "subject"
names(test.df)[2] <- "activity"
names(test.df)[3] <- "type"
names(test.df)[4:564] <- featurename[,2]

names(train.df)[1] <- "subject"
names(train.df)[2] <- "activity"
names(train.df)[3] <- "type"
names(train.df)[4:564] <- featurename[,2]

##Replace numeric for descriptive activity names
actname <- read.table("activity_labels.txt",header = FALSE)

for(i in 1:6){
    test.df$activity[test.df$activity %in% i] <- actname[i,2]
    train.df$activity[train.df$activity %in% i] <- actname[i,2]
}

##Merge both data table
merge.df <- rbind(test.df,train.df)

##Select mean and standard deviation variables
tomatch <- names(merge.df)[grepl("mean()|std()",names(merge.df))]
match.df <- select(merge.df,"subject","activity",
                    "type",all_of(tomatch))

##Create data set with average of each variable for 
##each activity and each subject
mean.df <- aggregate(match.df[,4:ncol(match.df)],
                     by=list(subject=match.df$subject,
                             activity=match.df$activity),
                     FUN=mean)

