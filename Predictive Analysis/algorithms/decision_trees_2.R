# Install and load necessary library
install.packages("randomForest")
library(randomForest)

# Load the Iris dataset
data(iris)
head(iris)

# Split the dataset into training and testing sets
set.seed(123)  # For reproducibility
index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[index, ]
test_data <- iris[-index, ]

# Build the Random Forest model
rf_model <- randomForest(Species ~ ., data = train_data, ntree = 100, mtry = 2, importance = TRUE)
print(rf_model)

# Evaluate model performance
predictions <- predict(rf_model, test_data)
confusion_matrix <- table(Predicted = predictions, Actual = test_data$Species)
print(confusion_matrix)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Accuracy: ", accuracy*100, "%", "\n")

# Visualize feature importance
varImpPlot(rf_model)


###
require(ggplot2)
importance_df <- as.data.frame(randomForest::importance(rf_model))
importance_df$Feature <- rownames(importance_df)

# Create a ggplot2 bar plot
ggplot(importance_df, aes(x = reorder(Feature, MeanDecreaseGini), y = MeanDecreaseGini)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Feature Importance (Random Forest)",
    x = "Features",
    y = "Mean Decrease in Gini"
  ) +
  theme_minimal()

