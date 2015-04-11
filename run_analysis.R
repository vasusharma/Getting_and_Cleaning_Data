install.packages("doBy")
library(doBy)


X_train <- read.table("C:/Users/arpita/Desktop/coursera/getting_data/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("C:/Users/arpita/Desktop/coursera/getting_data/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_train <- read.table("C:/Users/arpita/Desktop/coursera/getting_data/UCI HAR Dataset/train/y_train.txt", quote="\"")
y_test <- read.table("C:/Users/arpita/Desktop/coursera/getting_data/UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_train <- read.table("C:/Users/arpita/Desktop/coursera/getting_data/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("C:/Users/arpita/Desktop/coursera/getting_data/UCI HAR Dataset/test/subject_test.txt", quote="\"")

data<-X_train;
data[,562]<-y_train
X_test[,562]<-y_test
data[7353:10299,]<-X_test
data[1:7352,563]<-subject_train
data[7353:10299,563]<-subject_test

means<-apply(data[,1:561],2,mean)
standard_dev<-apply(data[,1:561],2,sd)
for (i in 1:10299 )
{
  if(data[i,562]==1)
  {
    data[i,564]="WALKING"
  }
  else if(data[i,562]==2)
  {
    data[i,564]="WALKING_UPSTAIRS"
  }
  else if(data[i,562]==3)
  {
    data[i,564]="WALKING_DOWNSTAIRS"
  }
  else if(data[i,562]==4)
  {
    data[i,564]="SITTING"
  }
  else if(data[i,562]==5)
  {
    data[i,564]="STANDING"
  }
  else if(data[i,562]==6)
  {
    data[i,564]="LAYING"
  }
}

colnames(data)[562]<-"activity_code"
colnames(data)[563]<-"subject_code"
colnames(data)[564]<-"activity_name"

myfun1 <- function(x){c(mean=mean(x), std_dev=sd(x))}
summary<-summaryBy( . ~ activity_code + subject_code, data=data, FUN=myfun1)

write.table(summary, file = "summary.txt", row.names = FALSE)