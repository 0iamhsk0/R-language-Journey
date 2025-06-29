library(readr)

# Load the dataset
insurance_data <- read_csv(file.choose())

# Convert categorical variables to factors
insurance_data$sex <- as.factor(insurance_data$sex)
insurance_data$smoker <- as.factor(insurance_data$smoker)
insurance_data$region <- as.factor(insurance_data$region)

# Fit a multiple linear regression model
model <- lm(charges ~ age + sex + bmi + children + smoker + region, data = insurance_data)

# Summarize the model
summary(model)


### using psych package:

# Install and load the necessary packages
#install.packages("psych")
library(psych)
library(readr)

# Load the dataset

# Convert categorical variables to factors
insurance_data$sex <- as.factor(insurance_data$sex)
insurance_data$smoker <- as.factor(insurance_data$smoker)
insurance_data$region <- as.factor(insurance_data$region)

# Descriptive statistics using psych package
describe(insurance_data)

# Fit a multiple linear regression model
model <- lm(charges ~ age + sex + bmi + children + smoker + region, data = insurance_data)

# Summarize the model
summary(model)

### another way

# Load necessary libraries
library(dplyr)

# Load the dataset
data <- read.csv(file.choose())

# Convert categorical variables into factors
data$sex <- as.factor(data$sex)
data$smoker <- as.factor(data$smoker)
data$region <- as.factor(data$region)

# Build the linear regression model
model <- lm(charges ~ age + bmi + children + sex + smoker + region, data = data)

# Summary of the model
summary(model)

# Predict on the same dataset (or you can split data for training/testing)
predictions <- predict(model, newdata = data)

# Calculate Mean Squared Error (MSE)
mse <- mean((data$charges - predictions)^2)

# Display MSE
print(paste("Mean Squared Error:", mse))
