Human Activity Recognition Using Smartphones DataSet
     as published by: 
     Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto; 
     DITEN - Universitá degli Studi di Genova
     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## General Description of the Source Data


** Generalities
The above site contains the data sets for the observations of experiments that consisted of reading smartphone sensor data as an individual was performing one of six possible activities. At each instance of the experiments several measurements were collected, each consisting of sensor values for 128 different variables. A total of 30 individuals participated in the experimentations, which were randomly partitioned in two sets: the training set and the test set. From each set of the 128 values measured on a particular instance, after proper processing, a sequence of 561 new values was obtained. The data of interest is distributed among several files as described next. 


 * features.txt        - List of features that were obtained after proper processing of the values measured from device sensors at each instance of the experiments. The file contains one feature name per line, for a total of 561 lines. 
 * activity_labels.txt - List of activities that were performed, including the name of each, as well as an id number
 * X_train.txt - Contains a list of 7352 sequences (one sequence per line), each containing the 562 measurements that were derived from each instance of the experimentation. Each such sequence corresponds to the results derived at one particular instance in which a particular subject was performing a particular activity. 
* y_train.txt - contains  a list of 7352 numbers in the range 1..6, identifying the particular activity that was being performed at a particular instance of the experimentations. The i-th number in this file corresponds to the activity that was performed at that instance of the experiments to which the i-th sequence in file X_train.txt corresponds to. 
* subject_train.txt - Contains a list of 7532 numbers, in the range 1..30, each identifying a particular subject (person participating in the experimentations). The i-th number in this file identifies the subject who was involved in the particular experimentation instance to which the i-th sequence in file X_train.txt corresponds to. 
* X_test.txt - Description is analogous to that of X_train.txt but for the testing portion of the data at the particular instance of the experimentation that the row corresponds to.
* y_test.txt  - Description is analogous to that of y_train.txt but for the testing portion of the data at the particular instance of the experimentation that the row corresponds to.
* subject_test.txt - Description is analogous to that of subject_train.txt but for the testing portion of the data at the particular instance of the experimentation that the row corresponds to.


All the above files are used as input in R script named “run_analysis.R”. The script generates merges the training and test data sets to form a tidy single tidy data set consisting of only one table. For each instance of the experimentation, the table contains the subject involved on that particular instance (column 1), the activity that the subject was performing at that instance (column 2), and the value that for than instance was derived on each of the following 66 measurements out of the 561 in the original data sets (columns 3:68): 
  "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
  "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
 "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
"tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
"tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"     
"tBodyAccMag-mean()"          "tGravityAccMag-mean()"       "tBodyAccJerkMag-mean()"     
"tBodyGyroMag-mean()"         "tBodyGyroJerkMag-mean()"     "fBodyAcc-mean()-X"          
"fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAccJerk-mean()-X"      
"fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"       "fBodyGyro-mean()-X"         
"fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyAccMag-mean()"         
"fBodyBodyAccJerkMag-mean()"  "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroJerkMag-mean()"
"tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
"tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
"tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
"tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
"tBodyAccMag-std()"           "tGravityAccMag-std()"        "tBodyAccJerkMag-std()"      
"tBodyGyroMag-std()"          "tBodyGyroJerkMag-std()"      "fBodyAcc-std()-X"           
"fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-std()-X"       
"fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-std()-X"          
"fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-std()"          
"fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-std()" 


These measures correspond to mean and standard deviation values that were determined for other measurements at instances of the experimentations. Hence this first table has 7352 rows and 68 columns, where columns 3:68 respective correspond to the the measurements listed above. 


The final names of each one of the columns in that first table are: 
1. subject      : its values are single integer numbers in the range from 1 to 30, each identifying the subject  that participated in the experimentation instance for which the other data in the particular row corresponds to. 
2. act_name   : its values are strings representing the name of the activity that was being performed at the moment of the particular experimentation instance that the particular row in the table corresponds to.          
3. tBodyAcc_mean_X : its values are the values of            tBodyAcc-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
4. tBodyAcc_mean_Y : its values are the values of            tBodyAcc-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
5. tBodyAcc_mean_Z : its values are the values of            tBodyAcc-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
6. tGravityAcc_mean_X : its values are the values of         tGravityAcc-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
7. tGravityAcc_mean_Y : its values are the values of         tGravityAcc-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
8. tGravityAcc_mean_Z : its values are the values of         tGravityAcc-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
9. tBodyAccJerk_mean_X : its values are the values of        tBodyAccJerk-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
10. tBodyAccJerk_mean_Y : its values are the values of        tBodyAccJerk-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
11. tBodyAccJerk_mean_Z : its values are the values of        tBodyAccJerk-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
12. tBodyGyro_mean_X : its values are the values of           tBodyGyro-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
13. tBodyGyro_mean_Y : its values are the values of           tBodyGyro-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
14. tBodyGyro_mean_Z : its values are the values of           tBodyGyro-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
15. tBodyGyroJerk_mean_X : its values are the values of       tBodyGyroJerk-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
16. tBodyGyroJerk_mean_Y : its values are the values of       tBodyGyroJerk-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
17. tBodyGyroJerk_mean_Z : its values are the values of       tBodyGyroJerk-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
18. tBodyAccMag_mean : its values are the values of           tBodyAccMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
19. tGravityAccMag_mean : its values are the values of        tGravityAccMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
20. tBodyAccJerkMag_mean : its values are the values of       tBodyAccJerkMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
21.  tBodyGyroMag_mean : its values are the values of          tBodyGyroMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
22. tBodyGyroJerkMag_mean : its values are the values of      tBodyGyroJerkMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
23. fBodyAcc_mean_X : its values are the values of            fBodyAcc-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
24. fBodyAcc_mean_Y : its values are the values of            fBodyAcc-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
25. fBodyAcc_mean_Z : its values are the values of            fBodyAcc-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
26. fBodyAccJerk_mean_X : its values are the values of        fBodyAccJerk-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
27. fBodyAccJerk_mean_Y : its values are the values of        fBodyAccJerk-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
28. fBodyAccJerk_mean_Z : its values are the values of        fBodyAccJerk-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
29. fBodyGyro_mean_X : its values are the values of           fBodyGyro-mean()-X from the original data at the particular instance of the experimentation that the row corresponds to.
30. fBodyGyro_mean_Y : its values are the values of           fBodyGyro-mean()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
31. fBodyGyro_mean_Z : its values are the values of           fBodyGyro-mean()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
32. fBodyAccMag_mean : its values are the values of           fBodyAccMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
33. fBodyBodyAccJerkMag_mean : its values are the values of   fBodyBodyAccJerkMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
34. fBodyBodyGyroMag_mean : its values are the values of      fBodyBodyGyroMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
35. fBodyBodyGyroJerkMag_mean : its values are the values of  fBodyBodyGyroJerkMag-mean() from the original data at the particular instance of the experimentation that the row corresponds to.
36. tBodyAcc_std_X : its values are the values of             tBodyAcc-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
37. tBodyAcc_std_Y : its values are the values of             tBodyAcc-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
38. tBodyAcc_std_Z : its values are the values of             tBodyAcc-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
39. tGravityAcc_std_X : its values are the values of          tGravityAcc-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
40. tGravityAcc_std_Y : its values are the values of          tGravityAcc-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
41. tGravityAcc_std_Z : its values are the values of          tGravityAcc-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
42. tBodyAccJerk_std_X : its values are the values of         tBodyAccJerk-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
43. tBodyAccJerk_std_Y : its values are the values of         tBodyAccJerk-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
44. tBodyAccJerk_std_Z : its values are the values of         tBodyAccJerk-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
45. tBodyGyro_std_X : its values are the values of            tBodyGyro-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
46. tBodyGyro_std_Y : its values are the values of            tBodyGyro-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
47. tBodyGyro_std_Z : its values are the values of            tBodyGyro-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
48. tBodyGyroJerk_std_X : its values are the values of        tBodyGyroJerk-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
49. tBodyGyroJerk_std_Y : its values are the values of        tBodyGyroJerk-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
50. tBodyGyroJerk_std_Z : its values are the values of        tBodyGyroJerk-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
51. tBodyAccMag_std : its values are the values of            tBodyAccMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
52. tGravityAccMag_std : its values are the values of         tGravityAccMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
53. tBodyAccJerkMag_std : its values are the values of        tBodyAccJerkMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
54. tBodyGyroMag_std : its values are the values of           tBodyGyroMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
55. tBodyGyroJerkMag_std : its values are the values of       tBodyGyroJerkMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
56. fBodyAcc_std_X : its values are the values of             fBodyAcc-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
57. fBodyAcc_std_Y : its values are the values of             fBodyAcc-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
58. fBodyAcc_std_Z : its values are the values of             fBodyAcc-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
59. fBodyAccJerk_std_X : its values are the values of         fBodyAccJerk-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
60. fBodyAccJerk_std_Y : its values are the values of         fBodyAccJerk-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
61. fBodyAccJerk_std_Z : its values are the values of         fBodyAccJerk-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
62. fBodyGyro_std_X : its values are the values of            fBodyGyro-std()-X from the original data at the particular instance of the experimentation that the row corresponds to.
63. fBodyGyro_std_Y : its values are the values of            fBodyGyro-std()-Y from the original data at the particular instance of the experimentation that the row corresponds to.
64. fBodyGyro_std_Z : its values are the values of            fBodyGyro-std()-Z from the original data at the particular instance of the experimentation that the row corresponds to.
65. fBodyAccMag_std : its values are the values of            fBodyAccMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
66. fBodyBodyAccJerkMag_std : its values are the values of    fBodyBodyAccJerkMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
67. fBodyBodyGyroMag_std : its values are the values of       fBodyBodyGyroMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.
68. fBodyBodyGyroJerkMag_std : its values are the values of   fBodyBodyGyroJerkMag-std() from the original data at the particular instance of the experimentation that the row corresponds to.




* final_table1
* final_table2


The script merges the training and the test sets to create one data set. Such data set will contain, all instances are: 
of the experiments in which measurements were collected ed forcontain results from experiments carried out with a group of 30 subjects; which are partitioned in two groups: 
the training group and the test group. Data collectect for each of these two groups are stored in subdirectories respectively 
named: train and test. 




NOTE : I should make clear the following: the order of the attributes in the final table does not necessarily correspond to their relative order in the original table. The columns are shown in increasing order of the name of the attributes if the added prefix “avg_” is discarded. 








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


features <- read.table("features.txt", stringsAsFactors = FALSE)
names(features) <- c("index", "fname")
features <- arrange(features, index)
features <- features$fname
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
## Start getting the target measurements.
## Extract the indexes of those measurements corresponding
## to means: those names containing "mean()" as a substring
target_mean_measurements_indexes <- grep("mean\\(\\)", features)


## Extract the indexes of those measurements corresponding
## to stds: those names containing "std()" as a substring
target_std_measurements_indexes <- grep("std\\(\\)", features)


## concanetate all target measurements' indexes into just one 
## vector
target_measurements_indexes <- c(target_mean_measurements_indexes, 
                          target_std_measurements_indexes)


## in measurements_train and in measurements_test, KEEP ONLY 
## the COLUMNS CORRESPONDING TO THE TARGET MEASUREMENTS
measurements_train <- measurements_train[target_measurements_indexes]
measurements_test <- measurements_test[target_measurements_indexes]


## get the names of the target measurements
target_measurement_names <- gsub("[^aA-zZ^-]", "", 
                                 features[target_measurements_indexes])
## raplace '-' by '_' in each of the target names
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
##        measurement_value - the values of the target measurement
temp_table <- gather(final_table1, measurement_type, 
                      measurement_value, 3:68)


##  2. Group the tempporary table by subject, act_name, 
##     and measurement_type.
temp_table <- tbl_df(temp_table)
gtemp_table <- group_by(temp_table, subject, 
                         act_name, measurement_type)


##  3. Apply summarize to the temporary table computing the
##     mean values of each measurement per group
summary_of_means <- 
      dplyr::summarise(gtemp_table, 
                       mean_value = mean(measurement_value))


##  4. Sort the previous table by subject, act_name, measumrement_type
#summary_of_means <- arrange(summary_of_means, 
#                            subject, act_name, measurement_type)


##  5. Spread the content of sumary_or_means back as a table of 68 
##     columns in which the value for each target variable is now the mean
final_table2 <- spread(summary_of_means, measurement_type, mean_value)


## -----------------------------------------------------------
## SAVE FINAL TIDY DATASET TO DISK
## -----------------------------------------------------------
## rename the columns in final_table2 -- those for the measurements (3:68)
names(final_table2)[3:68] <- paste("avg", names(final_table2[3:68]), sep="_")


## save summary table to disk 
write.table(final_table2, "average_of_variables.txt", 
            row.names = FALSE)