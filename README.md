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
 
The script begins executing automatically once it is loaded. The first thing it does is to load 
the needed packages: stringr, dplyr, plyr and tidyr. It then reads the following data from the current working directory as described next. 
 
* file X_train.txt into the data frame measurements_train - each row contains 561 measurements corresponding to the different variables
whose values are produced by the observations measured at each instance of the experiments. 
* file subject_train.txt into the data frame subjects_train - each row contains id number of one subject. The subject at subjects_train[i]
is the subject who was the actor at the experimentation instance at measurements_train[i,].  
* file y_train.txt into the data frame activities_train - each row contains id number fidentifying one of the activities. Activity at 
activities_train[i] is corrresponds to the activity that the individual at subject_train[i] was performing at the experimentation 
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
 


Output: Text file containing, on each line, a row of a table with 68 values, The first value is an integer identifying a subject (one of the participants in the experimentations). The second value (second column) is a string corresponding to the name of one of the six possible activities that we performed by subjects during the experimentations. Columns 3..64 contains the average value of different measurements that where captured during the experimentation while one subject was performing a particular activity. In particular, each row of the table contains the average value of each variable computed from the values captured for that particular variable in all instances in which the particular subject was performing the particular activity. 