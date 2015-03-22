###  TIDIED DATA FROM THE "HUMAN ACTIVITY RECOGNITION USING SMARTPHONES" DATASET

#### STEPS TAKEN TO PROCESS THE DATA

1.  SET THE WORKING DIRECTORY FOR THE PROJECT, & LOAD THE 'dplyr' PACKAGE
    * 'setwd()' to the folder which contains the 'UCI HAR Dataset' folder
2.  OPEN, USING 'read.table()', AND COMBINE THE TRAINING VALUES DATASETS for both X and Y
    * combine the datasets by row using 'rbind()'    
3.  OPEN, USING 'read.table()', AND COMBINE THE TESTING SUBJECT DATASETS for both X and Y
    * combine the datasets by row using 'rbind()'  
4.  OPEN, USING 'read.table()', AND COMBINE THE ACTIVITY LABELS DATASETS for both X and Y
    * combine the datasets by row using 'rbind()'
5.  OPEN THE FEATURES DATA TABLE; CONVERT IT TO A VECTOR & INSERT LABELS FOR SUBJECTS AND ACTIVITIES
    * don't forget to insert the first 2 column names into the vector before replacing the rownames.
6.  REMOVE THE OBSERVATIONS THAT AREN'T MEANS OR STANDARD DEVIATIONS
    * KEEP THE FIRST 2 COLUMNS ('Subject', and 'Activity', in that order)
    * ALSO, KEEP COLUMNS WITH EITHER '-mean()' or '-std()', SOMEWHERE IN THE VARIABLE NAME.
    * GREP RETURNS THE COLUMN INDICES WE WANT.  '-' IS ALSO PART OF THE SEARCH STRING, ALONG WITH THE ROUND BRACKETS, WHICH NEED TO BE ESCAPED WITH '\\'
    * REPLACE THE ORIGINAL DS WITH THE 'keepTheseVariables' SUBSET
7.  USING 'dplyr' CREATE A NEW DATASET THAT SUMMARIZES THE combinedDS; WRITE THE SUMMARIZED DATASET OUT
    * use 'group_by' and 'summarise_each'
    
#### See the 'run_Analysis.R' script for the processing steps taken.    
