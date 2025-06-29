mouse_data <- data.frame(
  size = c(1.4, 2.6, 1.0, 3.7, 5.5, 3.2, 3.0, 4.9, 6.3),
  weight = c(0.9, 1.8, 2.4, 3.5, 3.9, 4.4, 5.1, 5.6, 6.3),
  tail = c(0.7, 1.3, 0.7, 2.0, 3.6,3.0, 2.9, 3.9, 4.0)
)

#for linear regression, consider any 2 variables
#n variable, n matrices will be created

plot(mouse_data)

multiple.regression <- lm(size ~ weight + tail)
