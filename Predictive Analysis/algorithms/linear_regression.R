#1. Storing the data into a data frame
data <- data.frame(
  Years_Exp = c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7),
  Salary = c(39343.00, 46205.00, 37731.00, 43525.00,
             39891.00, 56642.00, 60150.00, 54445.00, 64445.00, 57189.00)
)

plot(data$Years_Exp, data$Salary,
     xlab = "Years Experienced",
     ylab = "Salary",
     main = "Scatter Plot of Years Experienced vs Salary")

relation <- lm(data$Years_Exp~data$Salary)

abline(relation, col = 'red', lwd = 2)

summary(relation)

a <- data.frame(x=2.3)

sal <- predict(relation, a)

sal

###

x<- c(8,10,12)
y<- c(10,13,16)
plot(x,y)
relation<-lm(y~x) 
abline(relation,col="red",lwd=2)
summary(relation)
a<-data.frame(x=20)
weight<-predict(relation,a)
print(weight)


###

# Define the height (x) and weight (y) data
x <- c(5.1, 5.5, 5.8, 6.1, 6.4, 6.7, 6.4, 6.1, 5.10, 5.7)
y <- c(63, 66, 69, 72, 75, 78, 75, 72, 69, 66)

# Plot the data
plot(x, y)

# Fit a linear model
relation <- lm(y ~ x)

# Add a regression line to the plot
abline(relation, col = "red", lwd = 2)

# Show a summary of the regression model
summary(relation)

# Find the weight of a person with a given height (e.g., 6.3)
a <- data.frame(x = 6.3)
result <- predict(relation, a)

# Print the predicted result
print(result)