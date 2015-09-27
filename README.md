# Getting-CleaningData_Project
This is a repository created for the Course Project: Getting and Cleaning Data (Coursera)

it describes how the script works

* (1) The first thing to do is to download the Samsung data file which is available at the following link : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* (2) Rename the downloaded zip file as "UCI HAR Dataset.zip" and move it into your work directory if necessary
* (3) Launch Rstudio (v 0.98.1103 or above)
* (4) execute the script containing in the run_analysis.R file (You can create an identical R script into your work directory and execute it with : source("run_analysis.R")

What does the script do:
- the source file is downloaded into your work directory if not present (this step is skipped if you have correctly done the task 1/ and 2/)
- the content of the zip file (UCI HAR Dataset.zip) is extracted to obtain the folder containing the raw data (text files)
- the execution of some operations in order to create the final tidy dataset
- the creation of a text file containing the tidy data (tidy_ds_output.txt) ==> please read the code book for more details on this output.

