?factor

#factor function used to create levels for the data we give

(x <- c("East","fafa","afef","fafa","fawfa","west"))
(x1 <- factor(c("East","fafa","afef","fafa","fawfa","west")))

class(x)
class(x1)

str(x)
str(x1)

x[7] <- "place"
x
#NA error occours
x1[10] <- "place"
x1

levels(x1) <- c(levels(x1),"abbea")
levels(x1) <- c(levels(x1),"place")
levels(x1)
#repeated once wont print in level
levels(x1) <- c(levels(x1),"East")
x1
#unordered factor and ordered factors
#arrays have contigious memory
#also factors do the same

#supervised and unsupervised classes
#factor and data frame attributes are required for data sets
#supervised learning algo
#cluster used when to create similar data sets
