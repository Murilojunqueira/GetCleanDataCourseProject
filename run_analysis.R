# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# 
# Good luck!


#preparing workspace

rm(list=ls(all=TRUE)) #will remove ALL objects and clean memory

library(data.table)
library(dplyr)

# Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip") # I use Windows, so 'method="curl"' is unecessary.

# Clean memory
rm(fileUrl)

# Unzip file
unzip(zipfile="Dataset.zip")


# task 1: Merges the training and the test sets to create one data set.

#Load separete data frames for test and train
testdata <- data.frame(read.table("UCI HAR Dataset/test/X_test.txt"))
testtrain <- data.frame(read.table("UCI HAR Dataset/train/X_train.txt"))


# Create variable Traintest to assign the source of the data
## The select command is to place the variable as first column

testdata <- testdata %>% 
            mutate(TrainTest="test") %>% 
            select(TrainTest, everything())

testtrain <- testtrain %>% 
             mutate(TrainTest="train") %>% 
             select(TrainTest, everything())

#checking data frames:
head(testdata)
names(testdata)

head(testtrain)
names(testtrain)

# Use rbindlist command, from data.table, faster than rbind.
data <- rbindlist(list(testdata, testtrain), use.names = TRUE)

#free memory
rm(testdata, testtrain)

#task 4: Appropriately labels the data set with descriptive variable names.

# Is better rename the variables now in order to avoid misunderstanding 
# in the next steps

# load the descriptive name of the variables
features <- read.table("UCI HAR Dataset/features.txt")

#Rename the variables names
names(data) <- c("TrainTest", as.character(features[,2]))

#free memory
rm(features)


# task 3: Uses descriptive activity names to name the activities in the data set.

# Load activities data
labelstest <- read.table("UCI HAR Dataset/test/y_test.txt")
labelstrain <- read.table("UCI HAR Dataset/train/y_train.txt")

# Merge activiti datasets
labelsData <- rbindlist(list(labelstest, labelstrain), use.names = TRUE)
rm(labelstest, labelstrain) #free memory

# Load activity labels
activitiLabel <- read.table("UCI HAR Dataset/activity_labels.txt")

# Inserte a label variable for activity data 
labelsData <- merge(labelsData, activitiLabel, by = "V1", sort = FALSE)

# Rename the label variables
names(labelsData) <- c("activity_number", "activity_label")

# bind actitity variable in the main dataset
data <- cbind(labelsData, data)

#free memory
rm(activitiLabel, labelsData) 

# Checking the variables
names(data)

## For task 5 is necessary append the subject variable

# Load subject data
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Merge subject datasets
subjectData <- rbindlist(list(subjecttest, subjecttrain), use.names = TRUE)

# Insert a proper variable name
names(subjectData) <- "subject"

# Append subject data
data <- cbind(subjectData, data)

#free memory
rm(subjecttest, subjecttrain, subjectData) 

names(data)



# task 2: Extracts only the measurements on the mean and standard deviation for 
#         each measurement.


varnames <- names(data)

MeanStr <- grep("mean\\()|std\\()", varnames)

# Preserv the subject, activity label and name, and Traintest
MeanStr <- c(1, 2, 3, 4, MeanStr) 

selectData <- select(data, MeanStr)

#free memory
rm(varnames, MeanStr)

#Check the variable
names(selectData)

# task 5: From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.

# I use summarize_each, that apply a function to each variable
averageData <- selectData %>% 
               group_by(subject, activity_label, TrainTest) %>%
               summarize_each(funs(mean))

# Remove active number, that is unnecessary here.
averageData[[4]] <- NULL

# Check the data
head(averageData)

# Write a text file with summary data
write.table(averageData, "averageData.txt", sep="\t", row.names = FALSE)