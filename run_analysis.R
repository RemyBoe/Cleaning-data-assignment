#Read the readme for a description of the thought proces.

#step 1
setwd("c:/Users/remyb/OneDrive/Documenten/Data Science/R Coursera/UCI HAR Dataset")

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

#step 2
features <- read.table('features.txt')[,2]
extractfeatures <- grepl("mean|std", features)
activitylabels <- read.table('activity_labels.txt')[,2]

#step3
testx <- read.table('test/X_test.txt')
testy <- read.table('test/y_test.txt')
subject_test <- read.table("./test/subject_test.txt")


names(testx) = features

testx <- testx[, extractfeatures]


testy[,2] = activity_labels[testy[,1]]
names(testy) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

testdata <- cbind(as.data.table(subjecttest), testy, testx)

#step 4
trainingx <- read.table('train/X_train.txt')
trainingy <- read.table("train/y_train.txt")

subjecttrain <- read.table("./train/subject_train.txt")

names(trainingx) <- features

trainingx <- trainingx[,extract_features]


trainingy[,2] <- activity_labels[trainingy[,1]]
names(trainingy) <- c("Activity_ID", "Activity_Label")
names(subjecttrain) <- "subject"

traindata <- cbind(as.data.table(subjecttrain), trainingy, trainingx)

#Step 5
completedata <- rbind(testdata, traindata)

#step 6
idlabels   <- c("subject", "Activity_ID", "Activity_Label")
datalabels <- setdiff(colnames(completedata), idlabels)
meltdata  <- melt(completedata, id = idlabels, measure.vars = datalabels)

tidydata   <- dcast(meltdata, subject + Activity_Label ~ variable, mean)

#step 7
write.table(tidydata, file = "./tidy_data.txt")

