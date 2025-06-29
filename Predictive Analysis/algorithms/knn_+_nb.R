#in the given heart.csv dataset predict the class value of given data 
#using knn and navie bayers.perform important pre processing steps
#and visualize the results.compare the results of both classifiers

#####

# Load necessary libraries
library(e1071)  # For Naive Bayes
library(class)  # For KNN
library(caret)  # For preprocessing and evaluation
library(ggplot2)  # For visualization

# Read the data
data <- read.csv(file.choose())
View(data)
# Preview the data
str(data)
head(data)

# Check for missing values

colSums(is.na(data))

# Convert the target variable to a factor (assuming the target variable is named 'target')
data$target <- as.factor(data$target)

# Split data into training and testing sets
set.seed(123)
index <- sample(1:nrow(data), 0.8 * nrow(data))
train_data <- data[index, ]
test_data <- data[-index, ]


# Normalize numeric features for KNN (excluding the target variable)
normalize <- function(x) (x - min(x)) / (max(x) - min(x))
train_data_normalized <- as.data.frame(lapply(train_data[, -ncol(train_data)], normalize))
test_data_normalized <- as.data.frame(lapply(test_data[, -ncol(test_data)], normalize))
train_data_normalized$target <- train_data$target
test_data_normalized$target <- test_data$target

# KNN model
set.seed(123)
knn_pred <- knn(
  train = train_data_normalized[, -ncol(train_data_normalized)],
  test = test_data_normalized[, -ncol(test_data_normalized)],
  cl = train_data_normalized$target,
  k = 5  # Number of neighbors
)

# Naive Bayes model
nb_model <- naiveBayes(target ~ ., data = train_data)
nb_pred <- predict(nb_model, test_data)

# Evaluate models
knn_cm <- confusionMatrix(knn_pred, test_data_normalized$target)
nb_cm <- confusionMatrix(nb_pred, test_data$target)

# Compare accuracy
knn_accuracy <- knn_cm$overall['Accuracy']
nb_accuracy <- nb_cm$overall['Accuracy']

?cat
cat("KNN Accuracy:", knn_accuracy, "\n")
cat("Naive Bayes Accuracy:", nb_accuracy, "\n")

# Visualize results
?c
accuracy_values <- c(knn_accuracy, nb_accuracy)
model_names <- c("KNN", "Naive Bayes")



# Bar plot for better visualization
accuracy_df <- data.frame(
  Model = c("KNN", "Naive Bayes"),
  Accuracy = c(knn_accuracy, nb_accuracy)
)
##############3
#optional plot
plot(
  accuracy_values,
  type = "o",
  col = "blue",
  pch = 16,
  xaxt = "n",
  xlab = "Models",
  ylab = "Accuracy",
  main = "Model Accuracy Comparison",
  ylim = c(0, 1)
)
axis(1, at = 1:2, labels = model_names)
text(1:2, accuracy_values, labels = round(accuracy_values, 2), pos = 3, cex = 0.8)

