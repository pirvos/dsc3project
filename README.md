# General description script run_analysis.R
 
The main component of this project is an R script to process the dataset from:  
     Human Activity Recognition Using Smartphones DataSet
     as published by: 
     Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto; 
     DITEN - Universitá degli Studi di Genova
     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
The R script run_analysis.R merges the training and the test data sets generated from several instances of the experiment. An instance 
of the experimentations represents a particular point in time when one individual is performing one of six possible activities.
At each such instances, several sensor measurements are collected, which are used 
to generate values for 561 variables. More details about how those 561 values are derived are given in the above reference. 
 
## Instructions for Execution

Once loaded, the execution is initiated by typing ‘run_analysis()’. 

## Input 
All the input comes from text files; which are read from the current working directory. The input files, as well as the internal objects where their contents are read are described next. 

* file X_train.txt - each line contains a sequence of 561 measurements corresponding to the different variables
whose values are produced by the observations measured at each instance of the experiments. Data in this file corresponds to subjects in the training group only. 

* file subject_train.txt - each line contains one integer number identifying one of the 30 subjects. The 
subject in line i of this file is the subject who was the actor at the experimentation instance that the values in line i of file X_train.txt corresponds to. Data in this file corresponds to subjects in the training group only.  

* file y_train.txt - each line contains one integer number identifying one of the activities. The 
activity in line i of this file is the activity that was being performed at the experimentation instance that the values in line i of file X_train.txt corresponds to. 

* file X_test.txt - Description is analogous to that of X_train.txt, but for subjects in the test
group. 

* file subject_test.txt - Description is analogous to 
that of subject_train.txt, but for subjects in the test group.

* file y_test.txt - Description is 
analogous to that of y_train.txt, but for subjects in the test group.

* file features.txt into the data frame features - each row contains the descriptive name of each of the features that were measured 
from the data collected at each instance of the experimentations. Feature in line i is the feature whose values are stored as the i-th element in each line of files X_train.txt and X_test.txt. 

* file activity_labels.txt Each row contains the id of the activity, as well as its descriptive name. 
 


## Output 
Text file in which each line contains one row of a table with 68 columns (variables). These variables are: 

   * Column 1: ’subject’. Value: Number identifying one subject (one of the participants in the experimentations) in the range 1…30. Type: Integer. 
   * Columns 2: ’act_name’. Value: Name of one of the six possible activities that were performed by subjects during the experimentations. Type: String. 
   * Columns 3..64: Names of these 66 columns are, respectively, "avg_fBodyAcc_mean_X”,           "avg_fBodyAcc_mean_Y”,          "avg_fBodyAcc_mean_Z”,           "avg_fBodyAcc_std_X”,            "avg_fBodyAcc_std_Y”,            "avg_fBodyAcc_std_Z”,           "avg_fBodyAccJerk_mean_X”,       "avg_fBodyAccJerk_mean_Y”,       "avg_fBodyAccJerk_mean_Z”,       "avg_fBodyAccJerk_std_X”,       
"avg_fBodyAccJerk_std_Y”,        "avg_fBodyAccJerk_std_Z”,        "avg_fBodyAccMag_mean”,          "avg_fBodyAccMag_std”,          "avg_fBodyBodyAccJerkMag_mean”,  "avg_fBodyBodyAccJerkMag_std”,   "avg_fBodyBodyGyroJerkMag_mean”, "avg_fBodyBodyGyroJerkMag_std”, "avg_fBodyBodyGyroMag_mean”,     "avg_fBodyBodyGyroMag_std”,      "avg_fBodyGyro_mean_X”,          "avg_fBodyGyro_mean_Y”,         
"avg_fBodyGyro_mean_Z”,          "avg_fBodyGyro_std_X”,           "avg_fBodyGyro_std_Y”,          "avg_fBodyGyro_std_Z”,          "avg_tBodyAcc_mean_X”,           "avg_tBodyAcc_mean_Y”,           "avg_tBodyAcc_mean_Z”,           "avg_tBodyAcc_std_X”,           "avg_tBodyAcc_std_Y”,            "avg_tBodyAcc_std_Z”,            "avg_tBodyAccJerk_mean_X”,       "avg_tBodyAccJerk_mean_Y”,      
"avg_tBodyAccJerk_mean_Z”,       "avg_tBodyAccJerk_std_X”,        "avg_tBodyAccJerk_std_Y”,       "avg_tBodyAccJerk_std_Z”,       "avg_tBodyAccJerkMag_mean”,      "avg_tBodyAccJerkMag_std”,       "avg_tBodyAccMag_mean",         "avg_tBodyAccMag_std”,          "avg_tBodyGyro_mean_X”,          "avg_tBodyGyro_mean_Y”,          "avg_tBodyGyro_mean_Z”,          "avg_tBodyGyro_std_X”,          "avg_tBodyGyro_std_Y”,           "avg_tBodyGyro_std_Z”,           "avg_tBodyGyroJerk_mean_X”,      "avg_tBodyGyroJerk_mean_Y”,     "avg_tBodyGyroJerk_mean_Z”,      "avg_tBodyGyroJerk_std_X”,       "avg_tBodyGyroJerk_std_Y”,       "avg_tBodyGyroJerk_std_Z”,      "avg_tBodyGyroJerkMag_mean”,     "avg_tBodyGyroJerkMag_std”,      "avg_tBodyGyroMag_mean”,         "avg_tBodyGyroMag_std”,         "avg_tGravityAcc_mean_X”,        "avg_tGravityAcc_mean_Y”,        "avg_tGravityAcc_mean_Z”,        "avg_tGravityAcc_std_X”,        "avg_tGravityAcc_std_Y”,         "avg_tGravityAcc_std_Z”,         "avg_tGravityAccMag_mean”,       "avg_tGravityAccMag_std”. 

All these 66 values (columns 3..68 of output table) are real numbers, each representing the computed average of the corresponding measurement of their respective variables in the original data that were measured for the experimentation instance in which the particular subject was performing the particular activity. See the codebook for more details about these variables. The content of this table is finally saved to a text file names “average_of_variables.txt”, which is created in the current working directory. 

## Outline of the Actions of the Script

The general process of this script is as follows:         
1. The script begins executing automatically once it is loaded. The first thing it does is to load 
the needed packages: stringr, dplyr, plyr and tidyr.

2. It then reads the following data from the current working directory as described next. 
 
    * file X_train.txt into the data frame measurements_train. Table contains one row for each line in the given file and 561 columns, one for each value extracted from the particular line (j-th value in the i-th line is in measurements_train[i, j]).
    * file subject_train.txt into the data frame subjects_train - Table consists of same number of rows as table measurements_train, and 1 column. The subject at subjects_train[i,]
is the subject who was the actor at the experimentation instance at measurements_train[i,].  
    * file y_train.txt into the data frame activities_train - Table consists of  the same number of rows as measurements_train. Activity at 
activities_train[i] corresponds to the activity that the individual at subject_train[i] was performing at the experimentation 
instance that the values at measurement_train[i,] correspond to. 
    * file X_test.txt into the data frame measurements_test - each row contains 561 measurements. Description is analogous to that of X_train.txt, but for the test group. 
    * file subject_test.txt into the data frame subjects_test - each row contains integer number of one subjects. Description is analogous to 
that of subject_train.txt, but for the test group.
    * file y_test.txt into the data frame activities_train - each row contains id number identifying one of the activities, Description is 
analogous to that of y_train.txt, but for the test group.
    * file features.txt into the data frame features - each row contains the descriptive name of each of the features that were measured 
from the data collected at each instance of the experimentations. Feature at features[i,] is the feature whose values are stored at 
column i in measurements_train and measurements_test. In particular, the values in column j of tables measurements_train and measurements_test correspond to feature[j,]. 
    * file activity_labels.txt into the data frame activity_labels - each row contains the number that identifies the activity (1..6), as well as its descriptive name. 
 

3. The data frames are preliminary processed as follows: 
    * Names of table features are set to: “index” and “fname”. 
    * Names of table activity_labels are set to: “act_index” and “act_name”. 
    * Indexes of those targeted measurements are determine; these are those measurements in table features which contain “mean()” or “std()” as substring. The target names are stored
in data frame: target_measurements_indexes. 
    * The names of those target measurements are extracted to data frame target_measurement_names. The names are cleaned to remove “()” and to change occurrences of character ‘-‘ by character ‘_’. 
    * Name of the single column in all_activities is set to “act_index”. 

4. Combine corresponding training and test data. This is achieved by appending the content of the test data frame to the corresponding training data frame. In particular, the following is done: 
    * all_measurements <- rbind(measurements_train, measurements_test) 
    * all_subjects <- rbind(subjects_train, subjects_test)
    * all_activities <- rbind(activities_train, activities_test). 

5. Convert the numbers in data frame all_activities to the name of the activity each corresponds to. The process is as follows: 
   * Add a column “rank” with values 1, 2, …, so that row i has value i under this column. This is done to guarantee maintaining the original order after the merging operation that follows. 
   * Merge table all_activities and activity_labes by column act_index, leaving the result in all_activities. 
   * Just in case, recover the original order by sorting by column rank. 
   * Remove column rank from data frame all_activities. 

6. Assign dummy ordered names to columns 3:68 in data frame all_measurements. Names assigned are: a101, … , a166 (they are alphabetically ordered). This is done to guarantee that the order of columns is kept in the operations that will follow. 

7. Set the name of columns in all_subject to “subject”. 

8. Build table final_table1 whose columns and content are the columns in all_subjects, followed by the column under “act_name” in all_activities, followed by columns in all_measurements. The name of column 2 of this table is set to “act_name”. 

9. Compute the average for each of the 66 variables for each activity and each subject. This is as follows: 
* From final_table1, create a new temporary table in which the 66 variables corresponding to the target measurements are now inserted as values. This is done by the following: 
     
       temp_table <- gather(final_table1, measurement_type, 
                           measurement_value, 3:68)
Hence temp_table has 4 columns: subject, act_name, measurement_type, and measurement_value. This table contains one row for each combination of subject, activity, and measurement value. That is, from each line in final_table1, there are 66 rows in temp_table.       
    * Group the temporary table by subject, act_name, and measurement_type. This is done by first converting temp_table to a table: temp_table <- tbl_df(temp_table). Then, group temp_table by columns “subject”, “act_name”, and “measurement_type”. The grouped version is placed in new table “gtemp_table”. 

    * Summarise the gtemp_table by computing the mean of the measurement_value in each group, and place the results in new data frame summary_of_means. This is done by executing 
      
      summary_of_means <- 
            dplyr::summarise(gtemp_table, 
                             mean_value = mean(measurement_value))

Hence, row i of summary_of_means contain one subject, one activity, one measurement type, and the value corresponding to the average of all measurements that we recorded on the particular activity while the particular subject was performing the particular activity. 

    * Convert back the content of the table summary_of_means to a table with the same format as   final_table1. This new table is named final_table2. Each row in final_table2 has 68 columns as final_table1. However, in value stored in final_table2[i, j] is now the average value of all those values in column final_table1[, j] in rows having subject = final_table1[i, 1] and act_name = final_table1[i, 2]. This is done by executing: 

      final_table2 <- spread(summary_of_means, measurement_type, mean_value)
      
    * Rename columns 3:68 to have the same names as their respective column in final_table1, but adding prefix “avg_” to each one of them. 

10. The content of table final_table2 are written to text file: “average_of_variables.txt” in the working directory. 
11. At the end of execution, the work space of left with only two objects: final_table1 and final_table2. 


