# Getting and Cleaning Data Course Project
## How to create a tidy data from raw data collected from the accelerometers from the Samsung Galaxy S smartphone
This is a repository created for the Course Project: Getting and Cleaning Data (Coursera)

## What to do?
1. Step1: The first thing to do is to download the Samsung data file which is available at the following link : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Step2: Rename the downloaded zip file as "UCI HAR Dataset.zip" and move it into your work directory if necessary
3. Step3: Launch Rstudio (v 0.98.1103 or above) and execute the script containing in "run_analysis.R" file (You can create an identical R script into your work directory and execute it with RStudio : source("run_analysis.R")

## Execution steps of the script "run_analysis.R" :
- the source file is downloaded into your work directory if not present (this step is skipped if you have correctly passed the steps 1 and 2)
- the content of the zip file (UCI HAR Dataset.zip) is extracted to obtain the folder containing the raw data (text files)
- the execution of some operations in order to create the final tidy dataset :
  - the training and the test sets are merged to create one data set
  - Only the measurements on the mean and standard deviation for each measurement are extracted
  - the activities in the data set are named using descriptive activity names (using activity_labels.txt) 
  - the data set is appropriately labels with descriptive variable names (using features.txt)
- the creation of a text file containing the tidy data (tidy_ds_output.txt) ==> please read the code book for more details on this output.

### Contibutor:
* Laciné Coulibaly - Wrote the initial version
