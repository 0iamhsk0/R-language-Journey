getwd()
setwd("D:\\asus_cloud\\Desktop\\B.tech\\FIFTH SEM\\predictive analysis\\DATA")
knn_data <- read.csv(file.choose(), stringsAsFactors = FALSE)
?read.csv
knn_data
View(knn_data)

str(knn_data)

new_knn <- knn_data[-1]
View(new_knn)
new_knn
?factor

knn_labels <- factor(new_knn$diagnosis, levels = c("M", "B"),
                     labels = c("Malignant", "Benign"))
knn_labels

summary(new_knn[c("area_mean", "smoothness_mean", "compactness_mean")])

#need to do normalization because all the mean values are in random values
#and are not approx and similar to each other

normalize <- function(x){
  return((x - min(x)/(max(x) - min(x))))
}

View(new_knn)

?lapply

?knn
?table

# Mam's code:
getwd()
wbcd <- read.csv(file.choose())
View(wbcd)
str (wbcd)
wbcd <- wbcd[-1]
wbcdsdiagnosis <- wbcd
wbcdSdiagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                          labels = c("Benign", "Malignant"))
View(wbcdsdiagnosis)
#table(wbcdsdiagnosis)

round(prop.table(table(wbcdSdiagnosis)) * 100, digits = 1)
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])
normalize <- function(x) {
return ((x - min(x)) / (max(x) - min(x)))}

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))
summary(wbcd_n,area_mean)
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]
wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]
#install.packages ("class")
library(class)
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
cl = wbcd_train_labels, k = 21)
#install.packages ("gmodels")
library(gmodels)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
prop.chisq=FALSE)
aa <- table(wbcd_test_labels,wbcd_test_pred)
library(caret)
confusionMatrix(aa)
# its an evaluation parameter, to evaluate the model in tabluar elements, here the 
# diagonal elements are considered for evaluation

?factor
