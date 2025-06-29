
#fitting polynomial regression to the dataset
#dataset$Level2 = dataset$Level^2

#till 4th level

#now dataset will have additional values

#poly_reg = lm(formula = Salary ~., data = dataset)

#summary

#ggplot2
#ggplot() + geom_point(aes(x = dataset$LEvel, y = dataset$salary), col = red) +
#   geom_line() + 
#   ggtitle('') + 
#   xlab('') + 
#   ylab("")

# for linear predict(lin_reg, data.frame(Level = 6.5))
# for poly predict(poly_reg, data.frame(Level1 = 4, level2 = ))


####
# data
example_data <- read.csv(file.choose())

#fitting polynomial regression to the dataset
example_data$Level2 = example_data$Level^2
example_data$Level3 = example_data$Level^3
example_data$Level4 = example_data$Level^4

lin_reg <- lm(formula = Salary ~., data = example_data)
poly_reg <- lm(formula = Salary ~., data = example_data)
summary(poly_reg)

example_data$Level
example_data$Level2
example_data$Level3
example_data$Level4

#Visual part
require(ggplot2)
ggplot() + geom_point(aes(x = example_data$Level, y = example_data$Salary), 
                      colour = 'black') + 
  geom_line(aes(x = example_data$Level, y = predict(lin_reg, newdata = example_data)), 
            colour = 'purple') +
  ggtitle('poly regression') + 
  xlab('level') +
  ylab('salary')

#predictions = predict(lin_reg, newdata = example_data)

#mse <- mean((example_data$Salary - predictions)^2)  
#mse
