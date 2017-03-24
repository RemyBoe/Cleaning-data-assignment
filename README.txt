Description how i came about the code:

Step 1:
I first installed the data packages data.table and reshape2, because i need data.table for reading
the txt files in a table and reshape2 for the dcast function.

Step 2:
I load the features.txt as "features" and after first checking Head(features) i discovered that i only 
needed the second column so that's why i used [,2]. The assignment says i only need the mean and the 
standard deviation, so that is why i used extractfeatures <- grepl("mean|std", features). We need this to extract 
the mean and std in the test and training files.

Step 3
In this step i prepared the test data. I read the x & y testfiles and and the subject files in R. 
After that i named the testx file and gave them the features i extracted in step 2. Assigned the activity_labels
to the testy row(this was a pain to figure out) and gave some proper labels for the subject file and test y file.
After i tidied all the test files, i cbinded them(don't rbind..) and now it's a proper file with the proper labels. 

Step 4
I basicly did the same as in step 3, but then for the train data.

Step 5
In this step i merged the tidies test and training data together.

Step 6
In this important step i took the merged training and test files and i applied them with some proper labels
This was quite a pain to figure out, tip: http://seananderson.ca/2013/10/19/reshape.html.
And with Dcast i put the tidied data set and applied the appropriate labels i created before.

Step 7
In this step you create a txt file where the tidied dataset can be found. 


