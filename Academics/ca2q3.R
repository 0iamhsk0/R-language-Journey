#Q3 is create a 5 x 5 matrix

# Define the data as a vector
data <- c(0, 1, 2, 3, 4, 
          1, 2, 3, 4, 0, 
          2, 3, 4, 0, 1, 
          3, 4, 0, 1, 2, 
          4, 0, 1, 2, 3)

# Create the matrix with 5 rows and 5 columns
my_matrix <- matrix(data, nrow = 5, ncol = 5)

# Print the matrix
print(my_matrix)
