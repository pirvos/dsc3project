## This R script processes the dataset from:  
##   Human Activity Recognition Using Smartphones DataSet
##   Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, 
##   and Luca Oneto
##   DITEN - Universitá degli Studi di Genova
##   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles
##           %2FUCI%20HAR%20Dataset.zip
## 
## Script for C3 Project - Data Science 
## Generates a final table containing mean of measured values for 
## a set of variables already in the data set. 


## -----------------------------------------------------------
## LOAD NEEDED PACKAGES
## -----------------------------------------------------------
library(stringr)
library(dplyr)
library(plyr)
library(tidyr)

## -----------------------------------------------------------
## LOAD THE DIFFERENT DATASETS TO BE PROCESSED
## -----------------------------------------------------------
measurements_train <- read.table("X_train.txt")
# each row contains one instance of measurements for a particular
# subject

subjects_train <- read.table("subject_train.txt")
# each element in data frame subjects_train is a number 
# indentifying a subject establishing the link between subjects  
# in the train sets and sequences of measurements in  
# measurements_train. In particular, subjects_train[i] identifies 
# the subject that the sequence of measurements in 
# measurements_train[i,] corresponds to.

activities_train <- read.table("y_train.txt")
# each element in data frame activities_train contains a number
# that identifies the activity establishing a link between 
# the different activities and the measurements in vector
# measurements_train. In particular, activities_train[i]
# identifies the activity that the sequence of measurements
# in measurements_train[i,] corresponds to, and which were 
# performed by subject subjects_train[i. 

# read data from the test datasets
# the description of each of the following three vectors 
# is analogous to the description given above for the 
# train vector with equal prefix name, respectively.  
measurements_test <- read.table("X_test.txt")
subjects_test <- read.table("subject_test.txt")
activities_test <- read.table("y_test.txt")

features <- readLines("features.txt")
# the features vector contains the name identifying what
# features were measured. In particular, on each of the 
# sequences in measuremts_train and in measurements_test
# the i-th value corresponds to feature in features[i]

# read the labels and names of each activity
activity_labels <- read.table("activity_labels.txt", sep=" ")
names(activity_labels) <- c("act_index", "act_name")

## -----------------------------------------------------------
## PREPROCESS EACH DATA FRAME THAT WAS READ ABOVE
## -----------------------------------------------------------
## extract the indexes of those measurements corresponding
## to means: those names containing "mean()" as a substring
mean_measurements_indexes <- grep("mean\\(\\)", features)

## extract the indexes of those measurements corresponding
## to stds: those names containing "std()" as a substring
std_measurements_indexes <- grep("std\\(\\)", features)

## concanetate all target measurements' indexes into just one 
## vector
measurements_indexes <- c(mean_measurements_indexes, 
                          std_measurements_indexes)

## in measurements_train and in measurements_test, keep only 
## the columns corresponding to targetted measurements
measurements_train <- measurements_train[measurements_indexes]
measurements_test <- measurements_test[measurements_indexes]

## get all measurement names
target_measurement_names <- gsub("[^aA-zZ^-]", "", 
                                 features[measurements_indexes])
target_measurement_names <- gsub("-", "_", 
                                 target_measurement_names)

## -----------------------------------------------------------
## APPEND EACH CORRESPONDING TRAINING AND TEST DATASETS, IN 
## THAT ORDER, CREATING NEW TABLES AS DESCRIBED
## -----------------------------------------------------------

all_measurements <- rbind(measurements_train, measurements_test)
# table of all rows in measurements_train followed by all rows
# in measurements_test

all_subjects <- rbind(subjects_train, subjects_test)
# table of all rows in subjects_train followed by all rows
# in subjects_test

all_activities <- rbind(activities_train, activities_test)
# table of all activities in activities_train followed by 
# all activities in activities_test

## give name to the column in all_acitivities table
names(all_activities) <- "act_index"

## match each activity with its name in all_activities. 
## Since the merge does not guarantee that the original
## order of the tables is kept, I am introducing a rank
## attribute to guarantee that the rows of the final table 
## are in the same order as in the original all_activities
## table. 
all_activities$rank <- 1:nrow(all_activities)
all_activities <- merge(all_activities, activity_labels, 
                        sort = FALSE)
all_activities <- arrange(all_activities, rank)  #sort back
all_activities$rank <- NULL  # remove the rank attribute

## properly name column names on each data frame
names(all_measurements) <- target_measurement_names
names(all_subjects) <- "subject"

## -----------------------------------------------------------
## BUILD FINAL TABLES
## -----------------------------------------------------------
## build the final table with columns: 
##   subject_group - what group the subject belongs to
##   subject - id number for the subject
##   act_name - name of the activity being measured
## followed by one column (culumns 4..69) for each one of 
## the target measurements (66 columns in total). The values 
## of these 66 columns are the measurement that was obtained 
## for that variable in one of the intances when the given 
## subject was performing the given activity.
final_table <- 
      data_frame(c(rep("train", nrow(measurements_train)), 
                   rep("test", nrow(measurements_test))))
names(final_table) <- "subject_group"
final_table <- cbind(final_table, all_subjects)
final_table$act_name <- all_activities$act_name
final_table <- cbind(final_table, all_measurements)

## Transfor the final table in one in which the 66 columns
## corresponding to the target measurements are now inserted
## as values. Hence, the final table will have 5 columns: 
##  subject_group
##  subject
##  act_name
##  measurement_type - describes the target measurement
##  measurement_value - the value of the target measurement
final_table <- gather(final_table, "measurement_type", 
                      "measurement_value", 4:69)

## At this moment, each row of final_table has the 
## the measurement value (measurement_value) that was
## obtained for the particular measurement (measurement_type)
## in one instance in which the particular subject (subject)
## was performing the given activity (act_name). 

## Now group final_table the attributes subject_group, subject, 
## act_name, measurement_type
final_table <- tbl_df(final_table)
gfinal_table <- group_by(final_table, subject_group, subject, 
                         act_name, measurement_type)

## -----------------------------------------------------------
## GENERATE THE FINAL TIDY DATASET WITH THE AVERAGE OF EACH 
## TARGET VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
## -----------------------------------------------------------
## extract the final tidy data set corresponding to the summary 
## of mean values of each variable different type of measurement 
## for each activity and each subject
summary_of_means <- 
      dplyr::summarise(gfinal_table, 
                       mean_value = mean(measurement_value))

## sort the previous table by subject, act_name, measumrement_type
summary_of_means <- arrange(summary_of_means, 
                            subject, act_name, measurement_type)

## -----------------------------------------------------------
## SAVE FINAL TIDY DATASET TO DISK
## -----------------------------------------------------------
## save summary table to disk 
write.table(summary_of_means, "summary_of_means.txt", 
            row.names = FALSE)

