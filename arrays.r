# ?array
# <!--
# (a1 <- array(c(10,50,28,96,35,75,85),dim= c(2,2,6)))
# v1 <- c(1,5,7,45,78,98)
# v2 <- c(10,12,15,18,16,11)
# (a2 <- array(c(v1,v2), dim = c(3,3,4)      
#              ,dimnames= list(c("R1","R2","R3","R4"),c("C1","C2","C3"),c("M1","M2","M3","M4"))))
# 
# a2
# a2[2,,]
# a2[,3,c(1,3)]
# a2[2,3,4]
# a2[,,3]
# a2[c(1,3),1:2,c(2,4)]
# used ctrl + shift + c
# # -->

(a1 <- array(data = NA, dim = c(3,4,2)))
#creates a 3x4 matrix of 2 mutidimensional arrays

?array
#the default dim of a array is 1x26, cuz 26 letters
?as.array
dim (as.array(letters))

letters
LETTERS

class(letters)

is.array(letters);
is.array(s);
is.integer(letters);

a1[2,, ];
(a1 <- array(data = 1:15, dim = c(3,3,4)))

a1[2, 4, 4];
#the above line helps to find the element in the location of 2,4,4 

a1[, 4,4]
a1[1,,4]
a1[2,4,4]
typeof(a1)
length(a1)
a1[,,4]
a1[1, , 4]
a1[,1,4]

# 
# ?array
# 
# (a1 <- array(c(10,50,28,96,35,75,85),
#              dim= c(2,2,6)))
# v1 <- c(1,5,7,45,78,98)
# typeof(v1)
# class(v1)
# v2 <- c(10,12,15,18,16,11)
# (a2 <- array(c(v1,v2), dim = c(3,3,4),
#              dimnames= list(c("R1","R2","R3","R4"),c("C1","C2","C3"),
#                             c("M1","M2","M3","M4"))))
# 
# a2
# a2[2,,]
# a2[,3,c(1,3)]
# a2[2,3,4]
# a2[,,3]
# a2[c(1,3),1:2,c(2,4)]


v3 <- c(1,2,3,4)
v4 <- c(6,7,8,9,12,45)

v3+v4
typeof(v3)
class(v3)
(a3 <- array(c(v3, v4), dim=c(3,3,4)))
a3;
#dim is a parameter of array
a1 + a3
#error cuz must be of same size
#addition only takes place, when the arrays of exact same dimensions
dim(a1)
dim(a3)
length(a1)
length(a3)

a1+a3[, 1:2, ]
a1+a3
a1*a3

#creating a matrix
(mat1 <- a1[,,2]);


dim(a1)
