# Introduction

This codebook describes the variables in _r_analysis.R_ script.

### Training and Test set data

`x_test`: read from '_test/X_test.txt_'  
`x_train`: read from '_train/X_train.txt_'  
`x_data`: Merge data of `x_test` and `x_train`  

`y_test`: read from '_test/X_test.txt_'  
`y_train`: read from '_train/X_train.txt_'  
`y_data`: Merge data of `y_test` and `y_train`  

`subject_test`: read from '_test/subject_test.txt_'  
`subject_train`: read from '_train/subject_train.txt_'  
`subject_data`: Merge data of `subject_test` and `subject_train`  

`features`: read from '_features.txt_', List of all features.

`act_labels`: read from '_activity_labels.txt_',  Links the class labels with their activity name.

`mean_and_std_features`: Columns of `features`, relevant to mean and standard deviation of measurement.

`x_data_subset`: Subset of `x_data`, extract columns relevant to mean an standard deviation of measurement.

`combined_data`: Merge data of 'x_data_subset', 'y_data', 'subject_data'.

`melt_data`: Melt (using Reshape2) of combined_data, for further processing.

'tidy_data': Independent tidy data set with the average of each variable for each activity and each subject.
