# naive bayes implementation using another data set:

getwd()
setwd("D:\\asus_cloud\\Desktop\\B.tech\\FIFTH SEM\\predictive analysis\\DATA")

#1. loading the data:
play_data <- read.csv(file.choose(), stringsAsFactors = FALSE)

#2. data checking
str(play_data)
head(play_data)
View(play_data)

#3. data seperation
set.seed(123)
sample_index <- sample(1:nrow(play_data), 0.7 * nrow(play_data))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]
?sample

sample_index


####

# Load necessary libraries
library(caret)
library(e1071)  # caret uses e1071 for Naive Bayes

# Create the dataset
data <- data.frame(
  day = factor(c("D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14")),
  outlook = factor(c("Sunny", "Sunny", "Overcast", "Rain", "Rain", "Rain", "Overcast", "Sunny", "Sunny", "Rain", "Sunny", "Overcast", "Overcast", "Rain")),
  temp = factor(c("Hot", "Hot", "Hot", "Mild", "Cool", "Cool", "Cool", "Mild", "Cool", "Mild", "Mild", "Mild", "Hot", "Mild")),
  humidity = factor(c("High", "High", "High", "High", "Normal", "Normal", "Normal", "High", "Normal", "Normal", "Normal", "High", "Normal", "High")),
  wind = factor(c("Weak", "Strong", "Weak", "Weak", "Weak", "Strong", "Strong", "Weak", "Weak", "Weak", "Strong", "Strong", "Weak", "Strong")),
  play = factor(c("No", "No", "Yes", "Yes", "Yes", "No", "Yes", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "No"))
)

# Train the Naive Bayes model
model <- train(play ~ outlook + temp + humidity + wind, data = data, method = "nb")

# Display the model
print(model)

# New data for prediction
new_data <- data.frame(
  outlook = factor("Sunny", levels = levels(data$outlook)),
  temp = factor("Cool", levels = levels(data$temp)),
  humidity = factor("High", levels = levels(data$humidity)),
  wind = factor("Strong", levels = levels(data$wind))
)

# Make prediction
prediction <- predict(model, new_data)

# Print the prediction
print(prediction)
