##Code Book

### Raw data used in the R script 
The training (test) dataset includes the following files: 

-"X_train.txt" ("X_test.txt"): Each row represents a 561-feature vector with time and frequency domain variables for a single measurement    

-"y_train.txt" ("y_test.txt"): Each row identifies the class label of different activity. Its ranges is from 1 to 6.        

-"subject_train.txt" ("subject_test.txt"): Each row identifies the subject who performed the activity for each window sample. 
Its range is from 1 to 30. 

The following files are also used in the R script: 

-"features.txt": List of all 561 features.    

-"activity_labels.txt": Links the class labels from 1 to 6  with their activity name.                                         

### What does the R script do
1. Merges the training and the test sets to create one data set. For example, it merges variables X_train and X_test to X_data.
2. Extracts only the measurements on the mean and standard deviation for each measurement. In this setp, 
   66 out of 561 features are selected.  
3. By using 'activity_lables.txt', replaces the class labels with their activity names in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each subject.  And finally, the txt file "results.txt" is created with write.table() using row.name=FALSE

### Tidy data
The final tidy data contain 180 rows (30 volunteers, 6 activities) and 68 columns ()
