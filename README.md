# Getting-and-Cleaning-Data-Course-Project

This repository contains run_analysis.R, courseprojectdata.txt, and CodeBook.md

run_analysis.R contains code used to collect and clean data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
for analysis. This data was collected with the accelerometers and gyroscopes in Samsung Galaxy S smartphones during six particular activities
among 30 subjects, of which parameters pertaining to the mean and standard deviation were pulled, with some tidying up being done
to the names of the parameters and being arranged so that the mean of all relevant parameters per subject per activity could be 
displayed on one table.

The tidy data set is found in courseprojectdata.txt, and can be read with the following code:

data<-read.table("https://raw.githubusercontent.com/vifalcon/Getting-and-Cleaning-Data-Course-Project/main/courseprojectdata.txt", header = TRUE)

CodeBook.md contains information about the parameters found in the data set.
