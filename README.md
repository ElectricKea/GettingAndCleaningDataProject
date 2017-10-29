# Getting and cleaning data course project

Completed as part of the Getting and Cleaning Data course.
The data was collected from accelerometers from the Samsung Galaxy S smartphone.  
Data downloaded from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


### Files included
* run_analysis.R - R script to read, tidy and summerise the data.
* CodeBook.md - listing of all variables used in the data. 
* README.md - This file you're currently reading.
* tidy_data.txt - The output file from run_analysis.R


### How to
1. Download the data from the link above. Keep the data in it's original "UCI HAR Dataset" format.
2. Read through the comments in the run_analysis.R file to understand how the data is being tidied up.
3. Read though the CodeBook.md to understand what variables are being used.
4. Run the run_analysis.R file.

### What the run_analysis.R does
1. Loads the data features and activcity labels into R, removing () to make the features easier to read. 
2. Loads the training and testing data into R keeping only the mean and std features from the original data set. 
3. Combines both the training and testing data into one dataset.
4. Groups the data by subjects and the activities. 
5. Averages the data collected for each subjects' activites.
6. Exports the averaged data as "tidy_data.txt".
