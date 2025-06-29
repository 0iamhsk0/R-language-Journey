svm_data <- read.csv(file.choose())
View(svm_data)
head(svm_data)
str(svm_data)

#from checking we can see, 3-5 columns are the imp ones, so slice the data
svm_data = svm_data[3:5]

#encode the target feature into factor type
svm_data$Purchased = factor(svm_data$Purchased, levels = c(0,1))
View(svm_data)

#spitting the data into training and testing
install.packages('caTools')
require(caTools)
?`caTools-package`
split_svm <- sample.split(svm_data, SplitRatio = 0.75)
training_data <- subset(svm_data, split_svm == TRUE)
test_data <- subset(svm_data, split_svm == FALSE)
View(training_data)
View(test_data)

#feature scaling on training and testing data, like how we do normalization
training_data[-3] <- scale(training_data[-3])
test_data[-3] <- scale(test_data[-3])



# Fitting SVM to the Training set 
require(e1071)
svm_classifier = svm(formula = Purchased ~ ., 
                 data = training_data, 
                 type = 'C-classification', 
                 kernel = 'linear')
View(svm_classifier)
# in the console type 'svm_classifier' to know the details

# Predicting the Test set results 
y_pred = predict(svm_classifier, newdata = test_data[-3])

# Making the Confusion Matrix 
cm = table(test_data[, 3], y_pred)

# # installing library ElemStatLearn 
# library(ElemStatLearn) 
# 
# # Plotting the training data set results 
# set = training_set 
# X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01) 
# X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01) 
# 
# grid_set = expand.grid(X1, X2) 
# colnames(grid_set) = c('Age', 'EstimatedSalary') 
# y_grid = predict(classifier, newdata = grid_set) 
# 
# plot(set[, -3], 
#      main = 'SVM (Training set)', 
#      xlab = 'Age', ylab = 'Estimated Salary', 
#      xlim = range(X1), ylim = range(X2)) 
# 
# contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE) 
# 
# points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'coral1', 'aquamarine')) 
# 
# points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3')) 
