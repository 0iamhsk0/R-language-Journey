# Load necessary libraries
library(class)
library(caret)  # For confusionMatrix function

# Create the dataset
data <- data.frame(
  day = factor(c("D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14")),
  outlook = factor(c("Sunny", "Sunny", "Overcast", "Rain", "Rain", "Rain", "Overcast", "Sunny", "Sunny", "Rain", "Sunny", "Overcast", "Overcast", "Rain")),
  temp = factor(c("Hot", "Hot", "Hot", "Mild", "Cool", "Cool", "Cool", "Mild", "Cool", "Mild", "Mild", "Mild", "Hot", "Mild")),
  humidity = factor(c("High", "High", "High", "High", "Normal", "Normal", "Normal", "High", "Normal", "Normal", "Normal", "High", "Normal", "High")),
  wind = factor(c("Weak", "Strong", "Weak", "Weak", "Weak", "Strong", "Strong", "Weak", "Weak", "Weak", "Strong", "Strong", "Weak", "Strong")),
  play = factor(c("No", "No", "Yes", "Yes", "Yes", "No", "Yes", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "No"))
)

# Convert factors to numeric values for KNN
data_numeric <- data
data_numeric$outlook <- as.numeric(data$outlook)
data_numeric$temp <- as.numeric(data$temp)
data_numeric$humidity <- as.numeric(data$humidity)
data_numeric$wind <- as.numeric(data$wind)
data_numeric$play <- as.numeric(data$play)

# Split the data into training and test sets
set.seed(123)  # For reproducibility
train_index <- sample(seq_len(nrow(data_numeric)), size = 0.7 * nrow(data_numeric))
train_data <- data_numeric[train_index, ]
test_data <- data_numeric[-train_index, ]

# Define new data for prediction (In practice, use only for testing)
new_data <- data.frame(
  outlook = factor("Sunny", levels = levels(data$outlook)),
  temp = factor("Cool", levels = levels(data$temp)),
  humidity = factor("High", levels = levels(data$humidity)),
  wind = factor("Strong", levels = levels(data$wind))
)
new_data_numeric <- as.numeric(new_data)

# Perform KNN with k = 3
k <- 3
predicted <- knn(train = train_data[, c("outlook", "temp", "humidity", "wind")],
                 test = test_data[, c("outlook", "temp", "humidity", "wind")],
                 cl = train_data$play,
                 k = k)

# Evaluate the model with confusion matrix
conf_matrix <- confusionMatrix(predicted, as.factor(test_data$play))
print(conf_matrix)

# Optionally, predict the new data
new_prediction <- knn(train = train_data[, c("outlook", "temp", "humidity", "wind")],
                      test = t(new_data_numeric),
                      cl = train_data$play,
                      k = k)

# Print the prediction for new data
print(new_prediction)
