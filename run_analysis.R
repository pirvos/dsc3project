
run_analysis <- function() {
      
      # load needed libraries
      loadpackages()
      
      measurements_train <- read.table("X_train.txt")
      ## each row contains one instance of measurements for a particular
      ## subject

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
      subject_test <- read.table("subject_test.txt")
      activities_test <- read.table("y_test.txt")

      features <- readLines("features.txt")
      # the features vector contains the name identifying what
      # features were measured. In particular, on each of the 
      # sequences in measuremts_train and in measurements_test
      # the i-th value corresponds to feature in features[i]

      # read the labels and names of each activity
      activity_labels <- read.table("activity_labels.txt", sep=" ")
      names(activity_labels) <- c("act_index", "act_name")

      # preprocess each vector read
      
      #exxtract the indexes of those measurements corresponding
      # to means
      mean_measurements_indexes <- grep("mean\\(\\)", features)
      
      #exxtract the indexes of those measurements corresponding
      # to stds
      std_measurements_indexes <- grep("std\\(\\)", features)
      
      # concanetate all target measurements' indexes into just one 
      # vector
      measurements_indexes <- c(mean_measurements_indexes, 
                                std_measurements_indexes)
      
      # in measurements_train and in measurements_test, keep only 
      # the columns corresponding to targetted measurements
      measurements_train <- measurements_train[measurements_indexes]
      measurements_test <- measurements_test[measurements_indexes]
      
      # get all measurement names
      target_measurement_names <- gsub("[^aA-zZ^-]", "", 
                                       features[measurements_indexes])
      target_measurement_names <- gsub("-", "_", 
                                       target_measurement_names)

      ## append train datasets to corresponding test dataset (in 
      ## that order)
      all_measurements <- rbind(measurements_train, measurements_test)
      all_subjects <- rbind(subjects_train, subject_test)
      all_activities <- rbind(activities_train, activities_test)
      names(all_activities) <- "act_index"
      
      ## match each activity with its name in all_acitivites
      all_activities$rank <- 1:nrow(all_activities)
      all_activities <- merge(all_activities, activity_labels, 
                              sort = FALSE)
      all_activities <- arrange(all_activities, rank)
      all_activities$rank <- NULL
      
      ## properly name column names on each data frame
      names(all_measurements) <- target_measurement_names
      names(all_subjects) <- "subject"

      ## build the final table
      final_table <- 
            data_frame(c(rep("train", nrow(measurements_train)), 
                         rep("test", nrow(measurements_test))))
      names(final_table) <- "subject_group"
      final_table <- cbind(final_table, all_subjects)
      final_table$act_name <- all_activities$act_name
      final_table <- cbind(final_table, all_measurements)
      
      final_table <- gather(final_table, "measurement_type", 
                            "measurement_value", 4:69)

      final_table <- tbl_df(final_table)
      gfinal_table <- group_by(final_table, type_of_data, subject, 
                               act_name, measurement_type)

      ## extract the final tidy data set corresponding to the summary 
      ## of mean values of each variable different type of measurement 
      ## for each activity and each subject
      summary_of_means <- 
            dplyr::summarise(gfinal_table, 
                             mean_value = mean(measure_value))

      ## save summary table to disk 
      write.table(summary_of_means, "summary_of_means.txt", 
                  row.names = FALSE)


}


## functions
loadpackages <- function() { 
   library(stringr)
   library(dplyr)
   library(plyr)
   library(tidyr)
}

