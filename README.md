Human Activity Recognition Using Smartphones DataSet
     as published by: 
     Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto; 
     DITEN - Universitá degli Studi di Genova
     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## General Description of the Source Data
 
# Generalities
The above site contains the data sets for the observations of experiments that consisted of reading smartphone sensor data as an individual was performing one of six possible activities. At each instance of the experiments several measurements were collected, each consisting of sensor values for 128 different variables. A total of 30 individuals participated in the experimentations, which were randomly partitioned in two sets: the training set and the test set. From each set of the 128 values measured on a particular instance, after proper processing, a sequence of 561 new values was obtained. The data of interest is distributed among several files as described next. 
 
 * features.txt	- List of features that were obtained after proper processing of the values measured from device sensors at each instance of the experiments. The file contains one feature name per line, for a total of 561 lines. 
 * activity_labels.txt - List of activities that were performed, including the name of each, as well as an id number
 * X_train.txt - Contains a list of 7352 sequences (one sequence per line), each containing the 562 measurements that were derived from each instance of the experimentation. Each such sequence corresponds to the results derived at one particular instance in which a particular subject was performing a particular activity. 
* y_train.txt - contains  a list of 7352 numbers in the range 1..6, identifying the particular activity that was being performed at a particular instance of the experimentations. The i-th number in this file corresponds to the activity that was performed at that instance of the experiments to which the i-th sequence in file X_train.txt corresponds to. 
* subject_train.txt - Contains a list of 7532 numbers, in the range 1..30, each identifying a particular subject (person participating in the experimentations). The i-th number in this file identifies the subject who was involved in the particular experimentation instance to which the i-th sequence in file X_train.txt corresponds to. 
* X_test.txt - Description is analogous to that of X_train.txt but for the testing portion of the data.
* y_test.txt  - Description is analogous to that of y_train.txt but for the testing portion of the data.
* subject_test.txt - Description is analogous to that of subject_train.txt but for the testing portion of the data.
 
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

1. subject                          ...                         ...       

2. act_name                          ...                         ...    

3. tBodyAcc_mean_X : its value is the value of tBodyAcc-mean()-X from the original data.

4. tBodyAcc_mean_Y : its value is the value of tBodyAcc-mean()-Y from the original data.
5. tBodyAcc_mean_Z : its value is the value of tBodyAcc-mean()-Z from the original data.
6. tGravityAcc_mean_X : its value is the value of tGravityAcc-mean()-X from the original data.
7. tGravityAcc_mean_Y : its value is the value of         tGravityAcc-mean()-Y from the original data.
8. tGravityAcc_mean_Z : its value is the value of         tGravityAcc-mean()-Z from the original data.
9. tBodyAccJerk_mean_X : its value is the value of        tBodyAccJerk-mean()-X from the original data.
10. tBodyAccJerk_mean_Y : its value is the value of        tBodyAccJerk-mean()-Y from the original data.
11. tBodyAccJerk_mean_Z : its value is the value of        tBodyAccJerk-mean()-Z from the original data.
12. tBodyGyro_mean_X : its value is the value of           tBodyGyro-mean()-X from the original data.
13. tBodyGyro_mean_Y : its value is the value of           tBodyGyro-mean()-Y from the original data.
14. tBodyGyro_mean_Z : its value is the value of           tBodyGyro-mean()-Z from the original data.
15. tBodyGyroJerk_mean_X : its value is the value of       tBodyGyroJerk-mean()-X from the original data.
16. tBodyGyroJerk_mean_Y : its value is the value of       tBodyGyroJerk-mean()-Y from the original data.
17. tBodyGyroJerk_mean_Z : its value is the value of       tBodyGyroJerk-mean()-Z from the original data.
18. tBodyAccMag_mean : its value is the value of           tBodyAccMag-mean() from the original data.
19. tGravityAccMag_mean : its value is the value of        tGravityAccMag-mean() from the original data.
20. tBodyAccJerkMag_mean : its value is the value of       tBodyAccJerkMag-mean() from the original data.
21. tBodyGyroMag_mean : its value is the value of          tBodyGyroMag-mean() from the original data.
22. tBodyGyroJerkMag_mean : its value is the value of      tBodyGyroJerkMag-mean() from the original data.
23. fBodyAcc_mean_X : its value is the value of            fBodyAcc-mean()-X from the original data.
24. fBodyAcc_mean_Y : its value is the value of            fBodyAcc-mean()-Y from the original data.
25. fBodyAcc_mean_Z : its value is the value of            fBodyAcc-mean()-Z from the original data.
26. fBodyAccJerk_mean_X : its value is the value of        fBodyAccJerk-mean()-X from the original data.
27. fBodyAccJerk_mean_Y : its value is the value of        fBodyAccJerk-mean()-Y from the original data.
28. fBodyAccJerk_mean_Z : its value is the value of        fBodyAccJerk-mean()-Z from the original data.
29. fBodyGyro_mean_X : its value is the value of           fBodyGyro-mean()-X from the original data.
30. fBodyGyro_mean_Y : its value is the value of           fBodyGyro-mean()-Y from the original data.
31. fBodyGyro_mean_Z : its value is the value of           fBodyGyro-mean()-Z from the original data.
32. fBodyAccMag_mean : its value is the value of           fBodyAccMag-mean() from the original data.
33. fBodyBodyAccJerkMag_mean : its value is the value of   fBodyBodyAccJerkMag-mean() from the original data.
34. fBodyBodyGyroMag_mean : its value is the value of      fBodyBodyGyroMag-mean() from the original data.
35. fBodyBodyGyroJerkMag_mean : its value is the value of  fBodyBodyGyroJerkMag-mean() from the original data.
36. tBodyAcc_std_X : its value is the value of             tBodyAcc-std()-X from the original data.
37. tBodyAcc_std_Y : its value is the value of             tBodyAcc-std()-Y from the original data.
38. tBodyAcc_std_Z : its value is the value of             tBodyAcc-std()-Z from the original data.
39. tGravityAcc_std_X : its value is the value of          tGravityAcc-std()-X from the original data.
40. tGravityAcc_std_Y : its value is the value of          tGravityAcc-std()-Y from the original data.
41. tGravityAcc_std_Z : its value is the value of          tGravityAcc-std()-Z from the original data.
42. tBodyAccJerk_std_X : its value is the value of         tBodyAccJerk-std()-X from the original data.
43. tBodyAccJerk_std_Y : its value is the value of         tBodyAccJerk-std()-Y from the original data.
44. tBodyAccJerk_std_Z : its value is the value of         tBodyAccJerk-std()-Z from the original data.
45. tBodyGyro_std_X : its value is the value of            tBodyGyro-std()-X from the original data.
46. tBodyGyro_std_Y : its value is the value of            tBodyGyro-std()-Y from the original data.
47. tBodyGyro_std_Z : its value is the value of            tBodyGyro-std()-Z from the original data.
48. tBodyGyroJerk_std_X : its value is the value of        tBodyGyroJerk-std()-X from the original data.
49. tBodyGyroJerk_std_Y : its value is the value of        tBodyGyroJerk-std()-Y from the original data.
50. tBodyGyroJerk_std_Z : its value is the value of        tBodyGyroJerk-std()-Z from the original data.
51. tBodyAccMag_std : its value is the value of            tBodyAccMag-std() from the original data.
52. tGravityAccMag_std : its value is the value of         tGravityAccMag-std() from the original data.
53. tBodyAccJerkMag_std : its value is the value of        tBodyAccJerkMag-std() from the original data.
54. tBodyGyroMag_std : its value is the value of           tBodyGyroMag-std() from the original data.
55. tBodyGyroJerkMag_std : its value is the value of       tBodyGyroJerkMag-std() from the original data.
56. fBodyAcc_std_X : its value is the value of             fBodyAcc-std()-X from the original data.
57. fBodyAcc_std_Y : its value is the value of             fBodyAcc-std()-Y from the original data.
58. fBodyAcc_std_Z : its value is the value of             fBodyAcc-std()-Z from the original data.
59. fBodyAccJerk_std_X : its value is the value of         fBodyAccJerk-std()-X from the original data.
60. fBodyAccJerk_std_Y : its value is the value of         fBodyAccJerk-std()-Y from the original data.
61. fBodyAccJerk_std_Z : its value is the value of         fBodyAccJerk-std()-Z from the original data.
62. fBodyGyro_std_X : its value is the value of            fBodyGyro-std()-X from the original data.
63. fBodyGyro_std_Y : its value is the value of            fBodyGyro-std()-Y from the original data.
64. fBodyGyro_std_Z : its value is the value of            fBodyGyro-std()-Z from the original data.
65. fBodyAccMag_std : its value is the value of            fBodyAccMag-std() from the original data.
66. fBodyBodyAccJerkMag_std : its value is the value of    fBodyBodyAccJerkMag-std() from the original data.
67. fBodyBodyGyroMag_std : its value is the value of       fBodyBodyGyroMag-std() from the original data.
68. fBodyBodyGyroJerkMag_std : its value is the value of   fBodyBodyGyroJerkMag-std() from the original data.
 
 
 The idea is that from such table we can extract information such as the following: 
* who was the subject involved in a particular instance of te experimentation
* what was the activity that the subject 
* final_table1
* final_table2
 
The script merges the training and the test sets to create one data set. Such data set will contain, all instances are: 
of the experiments in which measurements were collected ed forcontain results from experiments carried out with a group of 30 subjects; which are partitioned in two groups: 
the training group and the test group. Data collectect for each of these two groups are stored in subdirectories respectively 
named: train and test. 
 
 
NOTE : I should make clear the following: the order of the attributes in the final table does not necessarily correspond to their relative order in the original table. The columns are shown in increasing order of the name of the attributes if the added prefix “avg_” is discarded. 
 
