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
 
#Instructions for Execution
Once loaded, the execution is initiated by typing ‘run_analysis()’. 

#Input: All the input comes from text files; which are read from the current working directory. In particular: It then reads the following data from the current working directory as described next. 
 
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
 


Output: Text file in which each line contains one row of a table with 68 columns (variables). These variables are: 

Column 1: ’subject’. Value: Number identifying one subject (one of the participants in the experimentations) in the range 1…30. Type: Integer. 
Columns 2: ’act_name’. Value: Name of one of the six possible activities that were performed by subjects during the experimentations. Type: String. 
Columns 3..64: Names of these 66 columns are, respectively, "avg_fBodyAcc_mean_X”,           "avg_fBodyAcc_mean_Y”,          
"avg_fBodyAcc_mean_Z”,           "avg_fBodyAcc_std_X”,            "avg_fBodyAcc_std_Y”,            "avg_fBodyAcc_std_Z”,           
"avg_fBodyAccJerk_mean_X”,       "avg_fBodyAccJerk_mean_Y”,       "avg_fBodyAccJerk_mean_Z”,       "avg_fBodyAccJerk_std_X”,       
"avg_fBodyAccJerk_std_Y”,        "avg_fBodyAccJerk_std_Z”,        "avg_fBodyAccMag_mean”,          "avg_fBodyAccMag_std”,          
"avg_fBodyBodyAccJerkMag_mean”,  "avg_fBodyBodyAccJerkMag_std”,   "avg_fBodyBodyGyroJerkMag_mean”, "avg_fBodyBodyGyroJerkMag_std”, 
"avg_fBodyBodyGyroMag_mean”,     "avg_fBodyBodyGyroMag_std”,      "avg_fBodyGyro_mean_X”,          "avg_fBodyGyro_mean_Y”,         
"avg_fBodyGyro_mean_Z”,          "avg_fBodyGyro_std_X”,           "avg_fBodyGyro_std_Y”,           "avg_fBodyGyro_std_Z”,          
"avg_tBodyAcc_mean_X”,           "avg_tBodyAcc_mean_Y”,           "avg_tBodyAcc_mean_Z”,           "avg_tBodyAcc_std_X”,           
"avg_tBodyAcc_std_Y”,            "avg_tBodyAcc_std_Z”,            "avg_tBodyAccJerk_mean_X”,       "avg_tBodyAccJerk_mean_Y”,      
"avg_tBodyAccJerk_mean_Z”,       "avg_tBodyAccJerk_std_X”,        "avg_tBodyAccJerk_std_Y”,        "avg_tBodyAccJerk_std_Z”,       
"avg_tBodyAccJerkMag_mean”,      "avg_tBodyAccJerkMag_std”,       "avg_tBodyAccMag_mean",         "avg_tBodyAccMag_std”,          
"avg_tBodyGyro_mean_X”,          "avg_tBodyGyro_mean_Y”,          "avg_tBodyGyro_mean_Z”,          "avg_tBodyGyro_std_X”,          
"avg_tBodyGyro_std_Y”,           "avg_tBodyGyro_std_Z”,           "avg_tBodyGyroJerk_mean_X”,      "avg_tBodyGyroJerk_mean_Y”,     
"avg_tBodyGyroJerk_mean_Z”,      "avg_tBodyGyroJerk_std_X”,       "avg_tBodyGyroJerk_std_Y”,       "avg_tBodyGyroJerk_std_Z”,      
"avg_tBodyGyroJerkMag_mean”,     "avg_tBodyGyroJerkMag_std”,      "avg_tBodyGyroMag_mean”,         "avg_tBodyGyroMag_std”,         
"avg_tGravityAcc_mean_X”,        "avg_tGravityAcc_mean_Y”,        "avg_tGravityAcc_mean_Z”,        "avg_tGravityAcc_std_X”,        
"avg_tGravityAcc_std_Y”,         "avg_tGravityAcc_std_Z”,         "avg_tGravityAccMag_mean”,       "avg_tGravityAccMag_std”. Each of these value are real numbers, representing the computed average of the corresponding measurement of their respective variables in the original data that were measured for the experimentation instance in which the particular subject was performing the particular activity. See the codebook for more details about these variables. The content of this table is finally saved to a text file names “average_of_variables.txt”, which is created in the current working directory. 

The general process of this script is as follow:         
The script begins executing automatically once it is loaded. The first thing it does is to load 
the needed packages: stringr, dplyr, plyr and tidyr.

It then reads the following data from the current working directory as described next. 
 
* file X_train.txt into the data frame measurements_train - each row contains 561 measurements corresponding to the different variables
whose values are produced by the observations measured at each instance of the experiments. 
* file subject_train.txt into the data frame subjects_train - each row contains id number of one subject. The subject at subjects_train[i]
is the subject who was the actor at the experimentation instance at measurements_train[i,].  
* file y_train.txt into the data frame activities_train - each row contains id number identifying one of the activities. Activity at 
activities_train[i] is corresponds to the activity that the individual at subject_train[i] was performing at the experimentation 
instance that the values at measurement_train[i,] correspond to. 
* file X_test.txt into the data frame measurements_test - each row contains 561 measurements. Description is analogous to that of X_train.txt. 
* file subject_test.txt into the data frame subjects_test - each row contains id number of one subject. Description is analogous to 
that of subject_train.txt.
* file y_test.txt into the data frame activities_train - each row contains id number identifying one of the activities, Description is 
analogous to that of y_train.txt.
* file features.txt into the data frame features - each row contains the descriptive name of each of the features that were measured 
from the data collected at each instance of the experimentations. Feature at features[i] is the feature whose values are stored at 
column i in measurements_train and measurements_test. 
* file activity_labels.txt into the data frame activity_labels - each row contains the id of the activity, as well as its descriptive name. 
 

