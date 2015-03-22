# SET THE WORKING DIRECTORY FOR THE PROJECT
library('dplyr')
setwd("~/datasciencecoursera/GettingAndCleaningData")

# OPEN THE TRAINING X VALUES DATASET 
trainingX = read.table('UCI HAR Dataset/train/X_train.txt')

# OPEN THE TESTING X VALUES DATASET 
testingX = read.table('UCI HAR Dataset/test/X_test.txt')

# COMBINE THE TESTING AND TRAINING X DATASETS ROW-WISE
trainingTestingX = rbind(trainingX, testingX)

# OPEN THE TRAINING SUBJECTS DATASET
trainingS = read.table('UCI HAR Dataset/train/subject_train.txt')

# OPEN THE TESTING SUBJECTS DATASET
testingS = read.table('UCI HAR Dataset/test/subject_test.txt')

# COMBINE THE TESTING AND TRAINING SUBECTS DATASETS ROW-WISE
trainingTestingS = rbind(trainingS, testingS)

# OPEN THE TRAINING Y DATASET (ACTIVITIES)
trainingY = read.table('UCI HAR Dataset/train/y_train.txt')

# OPEN THE TESTING Y DATASET (ACTIVITIES)
testingY = read.table('UCI HAR Dataset/test/y_test.txt')

# COMBINE THE TESTING AND TRAINING Y DATASETS ROW-WISE(ACTIVITIES)
trainingTestingY = rbind(trainingY, testingY)

# OPEN THE ACTIVITY LABELS DATASET
activityLabels = read.table('UCI HAR Dataset/activity_labels.txt')

# REPLACE ACTIVITY NUMBERS WITH DESCRIPTIVE LABELS
trainingTestingY$V1 <- activityLabels[trainingTestingY[,1],2]

# COMBINE THE SUBJECTS, THE ACTIVITIES, AND THE VARIOUS MEASUREMENTS COLUMN-WISE
combinedDS <- cbind(trainingTestingS, trainingTestingY, trainingTestingX)

# OPEN THE FEATURES DATA TABLE; CONVERT IT TO A VECTOR & INSERT LABELS FOR SUBJECTS AND ACTIVITIES
featuresDT <- read.table('UCI HAR Dataset/features.txt')
featuresV <- c('Subject', 'Activity', as.character(featuresDT$V2))

# REPLACE THE COLNAMES ON THE COMBINED DATASET
colnames(combinedDS) <- featuresV

# REMOVE THE OBSERVATIONS THAT AREN'T MEANS OR STANDARD DEVIATIONS
#   1) KEEP THE FIRST 2 COLUMNS ('Subject', and Activity', in that order')
keepTheseVariables <- c(1, 2)
#   2) ALSO, KEEP COLUMNS WITH EITHER '-mean()' or '-std()', SOMEWHERE IN THE VARIABLE NAME.
#       GREP RETURNS THE COLUMN INDICES WE WANT.  '-' IS ALSO PART OF THE SEARCH STRING, 
#       ALONG WITH THE ROUND BRACKETS, WHICH NEED TO BE ESCAPED WITH '\\'
keepTheseVariables <- c(keepTheseVariables, grep('-mean\\(\\)|-std\\(\\)', names(combinedDS)))
#   3) REPLACE THE ORIGINAL DS WITH THE 'keepTheseVariables' SUBSET
combinedDS <- combinedDS[keepTheseVariables]

#   CREATE A NEW DATASET THAT SUMMARIZES THE combinedDS  
summarizedDS <- combinedDS %>% group_by(Subject, Activity) %>% summarise_each(funs(mean)
write.table(summarizedDS, 'uci har tidy summarized dataset.txt', row.name=FALSE)
                                                                              