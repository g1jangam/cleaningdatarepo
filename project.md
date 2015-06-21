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

<h5>Group.1</h5> This column contains the SubjectID. Pair this with the next column
<h5>Group.2</h5> This column contains the Activity that the subject is doing. when measurements were taken to be averaged
<h5>1 </h5>              tBodyAcc-mean()-X
<h5>2   </h5>            tBodyAcc-mean()-Y
<h5>3  </h5>             tBodyAcc-mean()-Z
<h5>4 </h5>               tBodyAcc-std()-X
<h5>5  </h5>              tBodyAcc-std()-Y
<h5>6 </h5>               tBodyAcc-std()-Z
<h5>7  </h5>          tGravityAcc-mean()-X
<h5>8  </h5>          tGravityAcc-mean()-Y
<h5>9  </h5>          tGravityAcc-mean()-Z
<h5>10 </h5>            tGravityAcc-std()-X
<h5>11 </h5>            tGravityAcc-std()-Y
<h5>13  </h5>           tGravityAcc-std()-Z
<h5>14 </h5>          tBodyAccJerk-mean()-X
<h5>15  </h5>         tBodyAccJerk-mean()-Y
<h5>16  </h5>         tBodyAccJerk-mean()-Z
<h5>17 </h5>           tBodyAccJerk-std()-X
<h5>18 </h5>           tBodyAccJerk-std()-Y
<h5>19 </h5>           tBodyAccJerk-std()-Z
<h5>20 </h5>             tBodyGyro-mean()-X
<h5>21 </h5>             tBodyGyro-mean()-Y
<h5>22 </h5>             tBodyGyro-mean()-Z
<h5>23 </h5>              tBodyGyro-std()-X
<h5>24 </h5>              tBodyGyro-std()-Y
<h5>25 </h5>              tBodyGyro-std()-Z
<h5>26 </h5>         tBodyGyroJerk-mean()-X
<h5>27  </h5>        tBodyGyroJerk-mean()-Y
<h5>28  </h5>        tBodyGyroJerk-mean()-Z
<h5>29  </h5>         tBodyGyroJerk-std()-X
<h5>30  </h5>         tBodyGyroJerk-std()-Y
<h5>31 </h5>          tBodyGyroJerk-std()-Z
<h5>32 </h5>             tBodyAccMag-mean()
<h5>33 </h5>              tBodyAccMag-std()
<h5>34 </h5>          tGravityAccMag-mean()
<h5>35  </h5>          tGravityAccMag-std()
<h5>36 </h5>         tBodyAccJerkMag-mean()
<h5>37 </h5>          tBodyAccJerkMag-std()
<h5>38 </h5>            tBodyGyroMag-mean()
<h5>39 </h5>             tBodyGyroMag-std()
<h5>40 </h5>        tBodyGyroJerkMag-mean()
<h5>41 </h5>         tBodyGyroJerkMag-std()
<h5>42 </h5>              fBodyAcc-mean()-X
<h5>43 </h5>              fBodyAcc-mean()-Y
<h5>44 </h5>              fBodyAcc-mean()-Z
<h5>45 </h5>               fBodyAcc-std()-X
<h5>46 </h5>               fBodyAcc-std()-Y
<h5>47 </h5>               fBodyAcc-std()-Z
<h5>48 </h5>          fBodyAcc-meanFreq()-X
<h5>49 </h5>          fBodyAcc-meanFreq()-Y
<h5>50 </h5>          fBodyAcc-meanFreq()-Z
<h5>51 </h5>          fBodyAccJerk-mean()-X
<h5>52 </h5>          fBodyAccJerk-mean()-Y
<h5>53 </h5>          fBodyAccJerk-mean()-Z
<h5>54 </h5>           fBodyAccJerk-std()-X
<h5>55 </h5>           fBodyAccJerk-std()-Y
<h5>56 </h5>           fBodyAccJerk-std()-Z
<h5>57 </h5>      fBodyAccJerk-meanFreq()-X
<h5>58 </h5>      fBodyAccJerk-meanFreq()-Y
<h5>59 </h5>      fBodyAccJerk-meanFreq()-Z
<h5>60 </h5>             fBodyGyro-mean()-X
<h5>61 </h5>             fBodyGyro-mean()-Y
<h5>62 </h5>             fBodyGyro-mean()-Z
<h5>63 </h5>              fBodyGyro-std()-Y
<h5>64 </h5>              fBodyGyro-std()-Z
<h5>65 </h5>         fBodyGyro-meanFreq()-X
<h5>66 </h5>         fBodyGyro-meanFreq()-Y
<h5>67 </h5>         fBodyGyro-meanFreq()-Z
<h5>68 </h5>             fBodyAccMag-mean()
<h5>69 </h5>              fBodyAccMag-std()
<h5>70 </h5>         fBodyAccMag-meanFreq()
<h5>71 </h5>     fBodyBodyAccJerkMag-mean()
<h5>72 </h5>      fBodyBodyAccJerkMag-std()
<h5>73 </h5> fBodyBodyAccJerkMag-meanFreq()
<h5>74 </h5>        fBodyBodyGyroMag-mean()
<h5>75 </h5>         fBodyBodyGyroMag-std()
<h5>76 </h5>    fBodyBodyGyroMag-meanFreq()
<h5>77 </h5>    fBodyBodyGyroJerkMag-mean()
<h5>78 </h5>     fBodyBodyGyroJerkMag-std()
<h5>79 </h5> fBodyBodyGyroJerkMag-meanFreq()


