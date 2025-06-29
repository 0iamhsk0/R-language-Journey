# data
data(iris)

# Linear Regression:
linear_model <- lm(Sepal.Width ~ Sepal.Length, data = iris)

summary(linear_model)

# Plot the linear regression
plot(iris$Sepal.Length, iris$Sepal.Width, main = "Linear Regression: Sepal Width vs Sepal Length",
     xlab = "Sepal Length", ylab = "Sepal Width", pch = 19, col = "blue")

abline(linear_model, col = "red")



















# Logistic Regression: Classify if Species is Setosa based on Sepal.Width and Sepal.Length
# ----------------------------------------------------------------------------------------
# Create a binary variable for Setosa (1 for Setosa, 0 otherwise)
iris$IsSetosa <- ifelse(iris$Species == "setosa", 1, 0)



# Fit the logistic regression model
logistic_model <- glm(IsSetosa ~ Sepal.Length + Sepal.Width, data = iris, family = binomial)

# Summary of the logistic model
summary(logistic_model)

# Predict probabilities of being Setosa
iris$Predicted_Prob <- predict(logistic_model, type = "response")

# Classify as Setosa (1) if probability > 0.5, otherwise 0
iris$Predicted_Class <- ifelse(iris$Predicted_Prob > 0.5, 1, 0)

# Confusion matrix to check accuracy
table(Predicted = iris$Predicted_Class, Actual = iris$IsSetosa)

# Plotting logistic regression results
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = factor(IsSetosa))) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = binomial), se = FALSE) +
  labs(title = "Logistic Regression: Sepal Length & Sepal Width for Setosa",
       color = "Is Setosa")
