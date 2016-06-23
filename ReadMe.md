This course project contains two files:

run_analysis.R
tidy.txt

The R file reads the UCI HAR Dataset and unzips it. And then:

Loads the training and test data sets with Subjects and ACtivities as teh features

Loads activity labels and features 

Greps the features data frame for occurences of the words mean and std anywhere in the text file and then assigns the names 

Then, it merges the training and the test sets to create one data set.

Then, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Writes the table of means to the tidy.txt 