##Code Book

### Raw data
The dataset includes the following files: 
training sets: X_train.txt, y_train.txt, subject_train.txt
test sets: X_test.txt, y_test.txt, subject_test.txt
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.

### What does the R script do
1. Merges the training and the test sets to create one data set 'x_data', 'y_data','subject_train_data'.
2. Extracts only the measurements on the mean and standard deviation for each measurement. In this setp, 
   66 out of 561 features are selected 
3. By using 'activity_lables.txt', replaces the class labels with their activity names in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each subject.

### Tidy data
The final tidy data contain 180 rows (30 volunteers, 6 activities) and 68 columns ()
