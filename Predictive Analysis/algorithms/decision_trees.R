library(rpart.plot)
library(rpart)

data <- read.csv(file.choose())

data$diagnosis <- as.factor(data$diagnosis)

data <- data[,-1]

set.seed(123)
?table


train_index <- sample(seq_len(nrow(data)), size = 0.7 * nrow(data))
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

model <- rpart(diagnosis ~ ., data = train_data, method = "class")


rpart.plot(model)


predictions <- predict(model, test_data, type = "class")


conf_matrix <- table(test_data$diagnosis, predictions)

accuracy <- sum(predictions == test_data$diagnosis) / nrow(test_data) 
print(paste("Accuracy:", accuracy))

      