bc_data <- read.csv(file.choose())
View(bc_data)

new_bc <- bc_data[-1]
x <- bc_data[-1]
bc_updated <- x[-1]
View(bc_updated)
str(bc_updated)


#fitting K-means into the model
set.seed(169)
kmeans.re <- kmeans(bc_updated, centers = 3, nstart = 20)
#nstart means initial random numner of centroids
#centers = number of clusters
kmeans.re
# Cluster identification for 
# each observation
kmeans.re$cluster

# Confusion Matrix
cm <- table(iris$Species, kmeans.re$cluster)
cm



###
#k-means cluster on the breast cancer dataset.
install.packages("ggfortify")
library(ggfortify)
library(ggplot2)

getwd()
data<-read.csv(file.choose())
data
View(data)
#To remove the 2nd column 
data_1<-data[, -2]
View(data_1)
set.seed(123)
kmeans.re<-kmeans(data_1, centers=2, nstart=20)
#20 times it will find centeroid value x, y point for initial centeroid
#centers is the number of clusters
#take centers 2 because there are only 2 types...
kmeans.re
kmeans.re$cluster
kmeans.re$centers
cm<-table(data$diagnosis, kmeans.re$cluster)
cm
autoplot(kmeans.re, data_1, frame=TRUE)
