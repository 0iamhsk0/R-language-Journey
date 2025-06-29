iris_data <- iris
install.packages("arules")
install.packages("cluster")
require(cluster)
require(arules)

View(iris_data)
str(iris_data)

# apply K means on View(pressure)

#removing the labels cuz, its unlabeled data
new_iris <- iris_data[, -5]
new_iris

#fitting K-means into the model
set.seed(169)
kmeans.re <- kmeans(new_iris, centers = 3, nstart = 20)
#nstart means initial random numner of centroids
#centers = number of clusters
kmeans.re
# Cluster identification for 
# each observation
kmeans.re$cluster

# Confusion Matrix
cm <- table(iris$Species, kmeans.re$cluster)
cm

# Model Evaluation and visualization
plot(new_iris[c("Sepal.Length", "Sepal.Width")])
plot(new_iris[c("Sepal.Length", "Sepal.Width")],
     col = kmeans.re$cluster)
plot(new_iris[c("Sepal.Length", "Sepal.Width")], 
     col = kmeans.re$cluster, 
     main = "K-means with 3 clusters")

## Plotiing cluster centers
kmeans.re$centers
kmeans.re$centers[, c("Sepal.Length", "Sepal.Width")]

# cex is font size, pch is symbol
points(kmeans.re$centers[, c("Sepal.Length", "Sepal.Width")], 
       col = 1:3, pch = 8, cex = 3) 
#cex = n times larger, here 3 times big size
#pch = creates the star structure in the clusters

## Visualizing clusters
y_kmeans <- kmeans.re$cluster
clusplot(new_iris[, c("Sepal.Length", "Sepal.Width")],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster iris"),
         xlab = 'Sepal.Length',
         ylab = 'Sepal.Width')
