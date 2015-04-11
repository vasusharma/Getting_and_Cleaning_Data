run_analysis.R is the main R script which runs the code.
The file paths need to be changed as per your own computer.
The script first loads the data and then joins the test and train sets while also appending the predictor variables i.e. y values (activity codes and subject_codes) to it.
The script then calculates the variable (column wise) mean and standard deviation of the data as asked by the assignment.
It then asigns a descriptive activity name to each observation
It then assigns the meaningful columns a meaningful name.
After that it performs a group wise mean i.e. mean and standard deviation of each variable for each activity and each subject.