library(class)
library(e1071)

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
data <- read.csv(url, sep = ";")


str(data)
head(data)


sum(is.na(data))

data$quality <- ifelse(data$quality >= 7, "acidic", "Basic")

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

data_norm <- as.data.frame(lapply(data[1:11], normalize))
data_norm$quality <- data$quality


set.seed(123)
train_indices <- sample(1:nrow(data_norm), 0.7 * nrow(data_norm))
train_data <- data_norm[train_indices, ]
test_data <- data_norm[-train_indices, ]

train_x <- train_data[, 1:11]
train_y <- train_data$quality 
test_x <- test_data[, 1:11]   
test_y <- test_data$quality


k <- 16
predicted_knn <- knn(train = train_x, test = test_x, cl = train_y, k = k)

accuracy_knn <- sum(predicted_knn == test_y) / length(test_y)
print(paste("KNN Accuracy:", round(accuracy_knn * 100, 2), "%"))


model_nb <- naiveBayes(train_x, train_y)


predicted_nb <- predict(model_nb, test_x)


accuracy_nb <- sum(predicted_nb == test_y) / length(test_y)

print(paste("Naive Bayes Accuracy:", round(accuracy_nb * 100, 2), "%"))
