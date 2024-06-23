data_pvc1 <- read.csv(file.choose(), row.names = 1)
#data_pvc <- read.csv(file.choose())
#View(data_pvc)
View(data_pvc1)

class(data_pvc)
?matrix

#converting into matrix

mat_pvc1 <- as.matrix(data_pvc1)
mat_pvc1

typeof(mat_pvc1)
str(data_pvc1)

?str
?summary

#tabular structure - dataf. , array, matrix

str(data_pvc1)
summary(data_pvc1)
str(mat_pvc1)
summary(mat_pvc1)

mat_pvc1
data_pvc1

#to calc the max of every row

#gives the max form all the rows
max(mat_pvc1[1:8])
max(mat_pvc1[1,])
max(mat_pvc1[2,])
max(mat_pvc1[3,])
max(mat_pvc1[4,])
max(mat_pvc1[6,])
max(mat_pvc1[5,])
max(mat_pvc1[7,])
max(mat_pvc1[8,])

#using for loop
for (i in 1:nrow(data_pvc1)){
  cal <- mat_pvc1[i,]
  cal_max <- max(cal)
  print(cal_max)
}

#using apply(an array or matrix, margin, function)

?apply

cal_max <- apply(mat_pvc1, 2, max)
cal_max <- apply(mat_pvc1, 2, sum)
cal_max <- apply(mat_pvc1, 1, sum)
print(cal_max)

mat_pvc1[5, 2] <- NA

mat_pvc1
cal_max <- apply(mat_pvc1, 1, sum)
print(cal_max)
mat_pvc1[5,2] <- 31.40
mat_pvc1
apply(mat_pvc1, 2, sum, na.rm = T)
is.na(mat_pvc1)
mat_pvc1(replace(NA, 31.40))


?iris

is.na(iris)
as.data.frame(iris)
as.matrix(iris)
str(iris)
apply(iris[,-5], 1, mean)
apply(iris[,-5], 2, mean)


#applying user defined fucn
per <- function(x){
  x <- x/100
}

apply(mat_pvc1, 1 , per)
apply(mat_pvc1, 2 , per)
class(apply(mat_pvc1, 1 , per))



?lapply
lapply(mat_pvc1, sum)

?vapply
?mapply
?sapply

###
### using lapply

color.list <- list(color1 = c(24, 0, 10, 56, 45, 67),
                   color2 = c(23.4, 45.4, 79.6, 56.8, 23.9, 76.8),
                   color3 = c(.34, .45, .6, .0, .567, .00))

color.list
class(color.list)



lapply(color.list, max)
#gives error cuz apply is not for list
apply(color.list, 1, max)


#for string vectors

str.vec <- c("Azul", "Verde", "Amarillo", "Rojo")
lapply(str.vec, toupper)
lapply(str.vec, nchar)

lapply(str.vec, tolower)
#gives error again
apply(str.vec, 1, tolower)
sapply(str.vec, nchar)
sapply(str.vec, tolower)
#sapply used when we want simplyfied op


sapply(color.list, mean, simplify = T)
#when passing data frames, we need to use the homogeneous data

?tapply


#named vector
vec1 <- c(first=2, second=4, third=6, fourth=8, fifth=10)
vec1

cal_fun <- function(x){
  x*x
}

sapply (vec1, function(x){x*x})


        
### tapply                
?tapply


test1 <- c(floor(runif(10, min = 20, max = 100)))
test2 <- c(floor(runif(10, min = 20, max = 100)))
test3 <- c(floor(runif(10, min = 20, max = 100)))
test1
test2
test3
?runif


#length(test_score)
stu_section <- c("A", "B", "C", "A", "B", "A", "A", "C", "A", "B")
tapply(test2, stu_section, sum)
tapply(test1, stu_det, mean)

View(iris)

#both will be the same
tapply(iris$Sepal.Length, iris$Species, mean, na.rm = T)
tapply(iris[,1], iris[,5], mean)




###mapply

x <- 1:10
y <- 11:20
z <- 21:30
r <- 5:10

mapply(sum, x, y, z, r)
mapply(sum, test1, test2)
