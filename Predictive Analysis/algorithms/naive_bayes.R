getwd()
setwd("D:\\asus_cloud\\Desktop\\B.tech\\FIFTH SEM\\predictive analysis\\DATA")

###MAIN METHOD:
#install.packages("e1071")
library(e1071)

#Load the Dataset:
data(iris)
View(iris)

#Split the Dataset into Training and Test Sets:
set.seed(123)
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

#Train the Naive Bayes Model:
model <- naiveBayes(Species ~ ., data = train_data)

#Make Predictions:
predictions <- predict(model, test_data)

#Evaluate Performance:
confusion_matrix <- table(predictions, test_data$Species)
print(confusion_matrix)

accuracy <- sum(predictions == test_data$Species) / nrow(test_data)
print(accuracy)



### SECOND METHOD:(using caret)
# Install and load necessary packages
# install.packages("caret")
# install.packages("e1071")  # caret uses e1071 internally for Naive Bayes
install.packages("stringi")
require(stringi)
library(caret)
library(e1071)

# Load dataset
data(iris)

# Split dataset into training and test sets
set.seed(123)
sample_index <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# Train Naive Bayes model using caret
model <- train(Species ~ ., data = train_data, method = "naive_bayes")

# Make predictions on test set
predictions <- predict(model, test_data)

# Evaluate performance
confusion_matrix <- confusionMatrix(predictions, test_data$Species)
print(confusion_matrix)

?createDataPartition
?naiveBayes


