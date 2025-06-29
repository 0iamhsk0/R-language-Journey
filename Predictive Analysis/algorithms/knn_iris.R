## executing knn on iris 

#1. read the data set
iris_ds <- iris
View(iris_ds)

#2. display the structure of the data set
str(iris_ds)

#3. removing the id column
#here id is not present so, not required

#4. finding the number of categories and renaming
#not required here

#5. generate the summary of the present columns
summary(iris_ds[c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")])

#6. apply normalization for smoothness of the data
# nirmalization would not be required since values are almost smooth
#normalize <- function(x){
#  return((x - min(x)/(max(x) - min(x))))
#}

#iris_ds_new <- as.data.frame(lapply(iris_ds[2:151], normalize))

#7. splitting the data set into training and testing phase
iris_train <- iris_ds[1:120, 1:4]
iris_test <- iris_ds[121:150, 1:4]
iris_train_labels <- iris_ds[1:120, 5]
iris_test_labels <- iris_ds[121:150, 5]


library(class)

# Apply knn
iris_knn <- knn(train = iris_train, test = iris_test,
                cl = iris_train_labels, k = 3,  # k is set to 3 as an example
                l = 0, prob = TRUE, use.all = TRUE)

# Actual labels for the test data

# Use CrossTable to compare actual and predicted labels
CrossTable(x = iris_test_labels, 
           y = iris_knn,
           prop.chisq = FALSE)

# Create a confusion matrix
confusion_mat <- table(iris_test_labels, iris_knn)

# Load caret library and use confusionMatrix
library(caret)
confusionMatrix(confusion_mat)


?sample




# # Load necessary libraries
# library(class)  # For knn
# library(caret)  # For splitting data and evaluation
# 
# # Load the iris dataset
# data(iris)
# 
# # Prepare the data: We need to convert species to numeric factors for KNN
# iris$Species <- as.numeric(iris$Species)
# 
# # Split the dataset into training (80%) and testing (20%) sets
# set.seed(42)
# trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
# trainData <- iris[trainIndex, ]
# testData <- iris[-trainIndex, ]
# 
# # Normalize the feature columns (except the target column)
# normalize <- function(x) {
#   return ((x - min(x)) / (max(x) - min(x)))
# }
# 
# trainData[, 1:4] <- as.data.frame(lapply(trainData[, 1:4], normalize))
# testData[, 1:4] <- as.data.frame(lapply(testData[, 1:4], normalize))
# 
# # Implement KNN (k = 3)
# knn_model <- knn(train = trainData[, 1:4], test = testData[, 1:4], cl = trainData$Species, k = 3)
# 
# # Evaluate accuracy
# accuracy <- sum(knn_model == testData$Species) / nrow(testData)
# print(paste("Accuracy of KNN model:", round(accuracy * 100, 2), "%"))
