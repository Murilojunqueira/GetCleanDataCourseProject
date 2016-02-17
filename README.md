---
title: "README"
author: "Murilo Junqueira"
date: "15 de fevereiro de 2016"
output: html_document
---

## Overview


This README file is a activity of [Getting and Cleaning Data](https://www.coursera.org/learn/data-cleaning "title") course project of John Hopking University, hosted by [Coursera](https://www.coursera.org "title").

## General Description

Human Activity Recognition Using Smartphones Dataset
Version 1.0

The data come from experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.



## Authors:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws



## Source Data

A full description of the data used in this project can be found at The [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "title")

The data merge two previously separated dataset training data and test data. The original dataset is intendified by "TrainTest" variable.

This dataset is a subset of a broader dataset. Only measurements of means and standard deviations were selected. The variables were grouped by subject and activity and then the mean were calculated.

[Complet data for this project can be found here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "title").

The label of the variables come from the following files:

* 'activity_labels.txt': Links the class labels with their activity name.
* 'y_train.txt': Training labels.
* 'y_test.txt':  Test labels.
* 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 



## The Dataset Includes the Following Files:


* 'README.md'
* 'CODEBOOK.md': variable description
*  run_analysis.R: R scrip used to manipulate data.
* 'averageData.txt': Average data of mean and standart deviation measurements, grouped by subject and activity.



## License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
