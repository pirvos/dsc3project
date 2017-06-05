## This R script processes the dataset from:  
##   Human Activity Recognition Using Smartphones DataSet
##   Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, 
##   and Luca Oneto
##   DITEN - Universitá degli Studi di Genova
##   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles
##           %2FUCI%20HAR%20Dataset.zip
## 
## Script for C3 Project - Data Science 
## Generates a final table containing average of measured values for 
## a set of variables already in the data set for each activity
## and each subject. 


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
##   subject - id number for the subject
##   act_name - name of the activity being measured
## followed by one column (culumns 3..68) for each one of 
## the target measurements (66 columns in total). The values 
## for each one of these 66 columns are the measurement that 
## were obtained for that particular measurement (variable)
## in one of the intances when the given subject was performing 
## the given activity.
final_table1 <- cbind(all_subjects, all_activities$act_name)
final_table1 <- cbind(final_table1, all_measurements)
final_table1 <- tbl_df(final_table1)
names(final_table1)[2] <- "act_name"

## -----------------------------------------------------------
## COMPUTE AVERAGE FOR EACH ONE OF THE 66 VARIABLES FOR EACH
## ACTIVITY AND EACH SUBJECT - gather, group_by, summarise, 
## arrange, and spread....
## -----------------------------------------------------------
## This can be easily done by the following steps: 
##  1. From final_table1, create a new temporary table in which 
##     the 66 variables corresponding to the target measurements  
##     are now inserted as values. Hence, the final table will 
##     have 5 columns: 
##        subject_group
##        subject
##        act_name
##        measurement_type - describes the target measurement
##        measurement_value - the value of the target measurement
temp_table <- gather(final_table1, measurement_type, 
                      measurement_value, 3:68)

##  2. Group the tempporary table by subject, act_name, 
##     and measurement_type.
temp_table <- tbl_df(temp_table)
gtemp_table <- group_by(temp_table, subject, 
                         act_name, measurement_type)

##  3. Apply summarize to the temporary table computing the
##     mean value of each measurement per group
summary_of_means <- 
      dplyr::summarise(gtemp_table, 
                       mean_value = mean(measurement_value))

##  4. Sort the previous table by subject, act_name, measumrement_type
summary_of_means <- arrange(summary_of_means, 
                            subject, act_name, measurement_type)

##  5. Spread the content of sumary_or_means back as a table of 68 
##     columns in which the value for each target variable is now the mean
final_table2 <- spread(summary_of_means, measurement_type, mean_value)

## -----------------------------------------------------------
## SAVE FINAL TIDY DATASET TO DISK
## -----------------------------------------------------------
## rname the columns in final_table2 -- those for the measurements (3:68)
names(final_table2)[3:68] <- paste("avg", target_measurement_names, sep="_")

## save summary table to disk 
write.table(final_table2, "average_of_variables.txt", 
            row.names = FALSE)

