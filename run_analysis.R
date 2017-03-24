setwd("c:/Users/remyb/OneDrive/Documenten/Data Science/R Coursera/UCI HAR Dataset")

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

extractfeatures <- grepl("mean|std", features)
features <- read.table('features.txt')[,2]
activitylabels <- read.table('activity_labels.txt')[,2]


testx <- read.table('train/X_train.txt')
testy <- read.table('test/y_test.txt')
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


names(testx) = features

testx <- testx[, extractfeatures]


testy[,2] = activity_labels[testy[,1]]
names(testy) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

testdata <- cbind(as.data.table(subjecttest), testy, testx)


trainingx <- read.table('train/X_train.txt')
trainingy <- read.table("train/y_train.txt")

subjecttrain <- read.table("./train/subject_train.txt")

names(trainingx) <- features

trainingx <- trainingx[,extract_features]


trainingy[,2] <- activity_labels[trainingy[,1]]
names(trainingy) <- c("Activity_ID", "Activity_Label")
names(subjecttrain) <- "subject"

traindata <- cbind(as.data.table(subjecttrain), trainingy, trainingx)


completedata <- rbind(testdata, traindata)

idlabels   <- c("subject", "Activity_ID", "Activity_Label")
datalabels <- setdiff(colnames(data), idlabels)
meltdata  <- melt(data, id = idlabels, measure.vars = datalabels)

tidydata   <- dcast(meltdata, subject + Activity_Label ~ variable, mean)

write.table(tidydata, file = "./tidy_data.txt")

