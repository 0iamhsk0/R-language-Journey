# SET-B
# Question 1: The ToothGrowth dataset examines the effect of vitamin C on tooth growth in guinea pigs,
# with variables len (tooth length), supp (type of supplement: VC or OJ), and dose (dose of supplement in mg).
(a) Display the len (tooth length) and supp (supplement) values for guinea pigs that received a dose of 2 mg.
(b) Write an sqldf query to group the data by supp and calculate the average len for each supplement group.
(c) Display the total number of guinea pigs that have a len greater than 20.
(d) Write a query to select the average len for guinea pigs that received a dose of more than 1 mg, grouping by supp.
# 
Question 2: Consider mtcars dataset apply KNN and check the accuracy of the model.
Divide the 80% dataset as a training data and 20% as testing data.
# 
Question 3: You are provided with a CSV file ‘survey_data’ containing raw survey data with missing values,
inconsistent data formats, and erroneous entries.
(a) Write the R code to import the CSV file and inspect the first few rows.
(b)Normalize the numeric values
(c) Identify and replace missing values in the dataset with appropriate methods such as mean,
median, or mode, and explain your choice.


#Question 1 - sqldf
View(ToothGrowth)
data <- ToothGrowth
require(sqldf)

#a
?sqldf
len_data <- sqldf("SELECT len, supp FROM data WHERE dose == 2.0")
len_data

#b
result <- sqldf("SELECT supp, AVG(len) AS AVG FROM ToothGrowth GROUP BY supp")
result


#c
new_len_data <- sqldf("SELECT COUNT(*) AS C FROM data WHERE len >20")
new_len_data

#d
dose_gt_1 <- sqldf("SELECT supp, AVG(len) AS AVG FROM ToothGrowth WHERE dose > 1 GROUP BY supp")
dose_gt_1


#Question 2 - knn
#packages:
require(e1071)
require(class)
require(caret)

#setting directory:
getwd()
setwd("D:\\asus_cloud\\Desktop\\B.tech\\FIFTH SEM\\predictive analysis\\DATA")
data <- read.csv(file.choose())
View(data)

#checking na values:
data_na <- is.na(data)
data_na
View(data_na)

?naiveBayes()

#validating and checking data details
str(data)
summary(data)
head(data)

#converting data into factors
data$Price <- as.factor(data$Price)
data$Capacity <- as.factor(data$Capacity)

#setting seeds
set.seed(28)

#labelling
labels <- data[,ncol(data)]

#splitting data
trainIndex <- createDataPartition(data$Class, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]
trainLabels <- labels[trainIndex]

#knn
knn <- knn(train = trainData, test = testData, cl = trainLabels, k = 5)
conf_matrix <- confusionMatrix(knn, testLabels)





#Question - 3
survey_data <- read.csv(file.choose())
View(survey_data)
summary(survey_data)
str(survey_data)
?head
head(survey_data)
na_values <- is.na(survey_data)
na_values

normalize <- function(x) {
  return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))
}

numeric_columns <- sapply(survey_data, is.numeric)
survey_data[numeric_columns] <- lapply(survey_data[numeric_columns], normalize)

numeric_columns
survey_data
