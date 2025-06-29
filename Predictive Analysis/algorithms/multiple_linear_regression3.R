# Install and load necessary packages
#install.packages("psych")
library(psych)

# Create the example dataset
example_data <- data.frame(
  Experience = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
  Education = c(12, 14, 16, 14, 12, 16, 14, 12, 14, 16), 
  Age = c(21, 25, 24, 26, 23, 27, 29, 28, 30, 32), 
  Salary = c(50, 55, 60, 62, 58, 65, 68, 70, 72, 75)
)

# Descriptive statistics using psych package
describe(example_data)

# Fit a multiple linear regression model
model <- lm(Salary ~ Experience + Education + Age, data = example_data)

# Summarize the model
summary(model)


### another way:

Experience = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
Education = c(12, 14, 16, 14, 12, 16, 14, 12, 14, 16)
Age = c(21, 25, 24, 26, 23, 27, 29, 28, 30, 32)
Salary = c(50, 55, 60, 62, 58, 65, 68, 70, 72, 75)
data<-data.frame(Experience,Education,Age,Salary)
plot(data)
relation<-lm(Salary~Experience+Education+Age)
summary(relation)
pairs.panels(data[c("Experience","Education","Age","Salary")])
new<-data.frame(Experience=15,Education=16,Age=34)
sal_pred<-predict(relation,new)
sal_pred

?pairs.panels
