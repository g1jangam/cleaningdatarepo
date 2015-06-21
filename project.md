<h1>Codebook for extracting Tidy dataset from Samsung Mobile use data</h1>
<h2>Introduction</h2>
<p> This codebook will describe the steps used to extract the tidy data set from the UCI HAR Dataset acquired by measuring various factors and sensors on the mobile devices as subjects undertook various activities. It is important to note that the data used is in the working directory and that the dimensions of the carious data sets strictly match. Lastly, the script does not require any inputs and will run autonomously.<\p>
<h2>Code Process</h2>
<p>The following section describes the high level process used to attain the tidy data set and analysis conducted on the data provided. Implementation notes can be found as comments in the code file *run_analysis.R*. It is advised that readers of this markdown file read script file concurrently to fully understand the process.</p>
<ol>
<li>First, extract the data from the text files. Read in *.\\UCI HAR Dataset\\test\\subject_test.txt*, *.\\UCI HAR Dataset\\test\\X_test.txt*, *.\\UCI HAR Dataset\\test\\Y_test.txt*, *.\\UCI HAR Dataset\\train\\subject_train.txt*, *.\\UCI HAR Dataset\\train\\X_train.txt*, *.\\UCI HAR Dataset\\train\\Y_train.txt* as data tables </li>
<li>Read in *.\\UCI HAR Dataset\\features.txt* also as a data table to get information on what the fields mean and to use the information to determine data columns that will need to be filtered out.</li>
<li>Search the data extracted from *.\\UCI HAR Dataset\\features.txt* to find descriptions that contain the strings *'mean'* or *'std'*. These fields are of interest to us and the index will be recorded to determine which columns to keep.</li>
<li>Once the necessary columns are filtered out, use column bind to merge the *'Subject_ID'* and *'Activity_ID'* columns from their respective data files.</li>
<li>Now the *Test* and *Train* data sets can be horizontally concatenated. As both these data sets have the same number of data points, its is acceptable to use row bind to merge these two data sets.</li>
<li>The labels for each of the columns can be attached to the merged dataset. The columns names can be extracted from *.\\UCI HAR Dataset\\features.txt*</li>
<li>To add more detail to the dataset, the activity Ids can be mapped to strings that describe the activity for each observation more explicitly.</li>
<li>Once this is done, the filtered data can be summarized using the *aggregate* function. Here the column means can be organised in terms of *Subject_ID* and *Activity*. Furthermore, the Tidy dataset can be reordered according the *Subject_ID* so that the data set is easier to read</li>
<li>This is then saved to a file in the working directory called *run_analysis.R_output.txt*</li>
</ol>

<h2>Codebook: Description of Columns in Tidy dataset</h2>
This is section will briefly describe the contents of the columns in the tidy dataset.
|Col| Variable Averaged for each subject per activity.|
|Group.1| This column contains the SubjectID. Pair this with the next column|
|Group.2| This column contains the Activity that the subject is doing. when measurements were taken to be averaged|
|1 |              tBodyAcc-mean()-X|
|2   |            tBodyAcc-mean()-Y|
|3  |             tBodyAcc-mean()-Z|
|4 |               tBodyAcc-std()-X|
|5  |              tBodyAcc-std()-Y|
|6 |               tBodyAcc-std()-Z|
|7  |          tGravityAcc-mean()-X|
|8  |          tGravityAcc-mean()-Y|
|9  |          tGravityAcc-mean()-Z|
|10 |            tGravityAcc-std()-X|
|11 |            tGravityAcc-std()-Y|
|13  |           tGravityAcc-std()-Z|
|14 |          tBodyAccJerk-mean()-X|
|15  |         tBodyAccJerk-mean()-Y|
|16  |         tBodyAccJerk-mean()-Z|
|17 |           tBodyAccJerk-std()-X|
|18 |           tBodyAccJerk-std()-Y|
|19 |           tBodyAccJerk-std()-Z|
|20 |             tBodyGyro-mean()-X|
|21 |             tBodyGyro-mean()-Y|
|22 |             tBodyGyro-mean()-Z|
|23 |              tBodyGyro-std()-X|
|24 |              tBodyGyro-std()-Y|
|25 |              tBodyGyro-std()-Z|
|26 |         tBodyGyroJerk-mean()-X|
|27  |        tBodyGyroJerk-mean()-Y|
|28  |        tBodyGyroJerk-mean()-Z|
|29  |         tBodyGyroJerk-std()-X|
|30  |         tBodyGyroJerk-std()-Y|
|31 |          tBodyGyroJerk-std()-Z|
|32 |             tBodyAccMag-mean()|
|33 |              tBodyAccMag-std()|
|34 |          tGravityAccMag-mean()|
|35  |          tGravityAccMag-std()|
|36 |         tBodyAccJerkMag-mean()|
|37 |          tBodyAccJerkMag-std()|
|38 |            tBodyGyroMag-mean()|
|39 |             tBodyGyroMag-std()|
|40 |        tBodyGyroJerkMag-mean()|
|41 |         tBodyGyroJerkMag-std()|
|42 |              fBodyAcc-mean()-X|
|43 |              fBodyAcc-mean()-Y|
|44 |              fBodyAcc-mean()-Z|
|45 |               fBodyAcc-std()-X|
|46 |               fBodyAcc-std()-Y|
|47 |               fBodyAcc-std()-Z|
|48 |          fBodyAcc-meanFreq()-X|
|49 |          fBodyAcc-meanFreq()-Y|
|50 |          fBodyAcc-meanFreq()-Z|
|51 |          fBodyAccJerk-mean()-X|
|52 |          fBodyAccJerk-mean()-Y|
|53 |          fBodyAccJerk-mean()-Z|
|54 |           fBodyAccJerk-std()-X|
|55 |           fBodyAccJerk-std()-Y|
|56 |           fBodyAccJerk-std()-Z|
|57 |      fBodyAccJerk-meanFreq()-X|
|58 |      fBodyAccJerk-meanFreq()-Y|
|59 |      fBodyAccJerk-meanFreq()-Z|
|60 |             fBodyGyro-mean()-X|
|61 |             fBodyGyro-mean()-Y|
|62 |             fBodyGyro-mean()-Z|
|63 |              fBodyGyro-std()-Y|
|64 |              fBodyGyro-std()-Z|
|65 |         fBodyGyro-meanFreq()-X|
|66 |         fBodyGyro-meanFreq()-Y|
|67 |         fBodyGyro-meanFreq()-Z|
|68 |             fBodyAccMag-mean()|
|69 |              fBodyAccMag-std()|
|70 |         fBodyAccMag-meanFreq()|
|71 |     fBodyBodyAccJerkMag-mean()|
|72 |      fBodyBodyAccJerkMag-std()|
|73 | fBodyBodyAccJerkMag-meanFreq()|
|74 |        fBodyBodyGyroMag-mean()|
|75 |         fBodyBodyGyroMag-std()|
|76 |    fBodyBodyGyroMag-meanFreq()|
|77 |    fBodyBodyGyroJerkMag-mean()|
|78 |     fBodyBodyGyroJerkMag-std()|
|79 | fBodyBodyGyroJerkMag-meanFreq()|



