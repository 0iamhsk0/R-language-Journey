#define a data structure, a vector, then save it into a r file and load it into the environment
#list the total number of variables in the evironment and remove the entire elements in one go
#then create a data frame, and store it into a CSV file

new_vector <- c(28, 5, 30, 5)
typeof(new_vector)

rm(new_vector)


new_df <- data.frame("Subject_code" <- c(322, 234, 212), "Roll_num" <- c(28, 5, 28))
typeof(new_df)
class(new_df)
class(new_vector)

write.csv(new_df, file = "data_preprocessing", row.names = FALSE)
read.csv("data_preprocessing", stringsAsFactors = FALSE, header = FALSE)
?str()

