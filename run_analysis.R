## 0. Download the data from the web and extract them into your home directory
# Important : This step is omitted if the original Samsung data is already in your working directory (UCI HAR Dataset)

if (!file.exists("UCI HAR Dataset.zip")) {
  zipfileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(zipfileUrl, destfile = "UCI HAR Dataset.zip")                   # downlaod the zip file into the created directory
}
unzip("UCI HAR Dataset.zip", overwrite = TRUE)                                  # Unzip the zip file

# Read text files in order to create the relevant sets
features <- read.table("./UCI HAR Dataset\\features.txt", sep="")               # list of features id
activity_labels <- read.table("./UCI HAR Dataset\\activity_labels.txt", sep="")

subject_test <- read.table("./UCI HAR Dataset\\test\\subject_test.txt", sep="")
x_test <- read.table("./UCI HAR Dataset\\test\\x_test.txt", sep="")
y_test <- read.table("./UCI HAR Dataset\\test\\y_test.txt", sep="")

subject_train <- read.table("./UCI HAR Dataset\\train\\subject_train.txt", sep="")
x_train <- read.table("./UCI HAR Dataset\\train\\x_train.txt", sep="")
y_train <- read.table("./UCI HAR Dataset\\train\\y_train.txt", sep="")

## 1. Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
subject <- rbind(subject_train, subject_test)
y <- rbind(y_train,y_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
patn <- c("mean()","std()")
selection <- unique(grep(paste(patn, collapse = "|"), features$V2, value = FALSE))
sub_data <- x[,selection]

## 3. Uses descriptive activity names to name the activity_labels in the data set
y <- merge(y, activity_labels, by.all = V1, sort = FALSE) 
sub_data <- cbind(subject, y$V2, sub_data)                                        # Adding the subjects' id and the activities'label columns

## 4. Appropriately labels the data set with descriptive variable names.
names(sub_data) <- c("subject","activity", as.character(features$V2[selection]))  # Renaming the columns

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_ds <-  aggregate(sub_data[, -c(1,2)], by = list(subject = sub_data$subject, activity = sub_data$activity), mean)
# create a text file using write.table() with the option row.name set to FALSE
write.table(tidy_ds, file = "./UCI HAR Dataset\\tidy_ds_ouput.txt", row.name = FALSE)
