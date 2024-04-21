v1 <- c(10,9.0,3.56,4);
v2 <- c(60,45,30,0);
(mat <- matrix(c(v1,v2), ncol = 2, byrow = TRUE));
mat[2,]
mat[,2]
mat[c(1,7)]
class(mat)
typeof(mat)
v3 <- c(2,3,5)
typeof(v3)

dim(mat)
(mat2 <- (matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE,)))
rownames(mat2) <- c("r1", "r2", "r3");
colnames(mat2) <- c("c1", "c2", "c3")
mat2


#gives the dimension names in list format
attributes(mat2)

#gives only dimensions not the names
dimnames(mat2)

#for copying the contents:
mat3 <- mat2;
mat3

#adding new row or column:
mat2 <- cbind(mat2, c(1:3))
mat2
mat2 <- rbind(mat2, c(10,20,30,0))
mat2
mat3
mat2
dimnames(mat2) <- list(c(rownames(mat2)[-4],"R7"))
rownames(mat2) <- c("r1","row2","row3","r4","r5","r6","row7");
mat2

dimnames(mat2) <- list(c(rownames(mat2)[-5],"ROWS"))
mat2


#creating  matrix without mat func

m1 <- rbind(c(2.0,3.,90))
m1
m1 <- cbind(c(10,20,30))
m1
m1 <- (rbind(c(10,20,30), c(40,50)))
m1


#creating array without arr function

array(1:10, dim=100)
c <- (1:100)       
c

# assigning null value to matrix
(mat5 <- (matrix( nrow = 3, ncol = 3, byrow = TRUE,)))

#outliers are the errors


(m1 <- matrix(1:10,ncol = 2, nrow = 5))
(m2 <- matrix(21:30,ncol = 2, nrow = 5))
m1-m2

(m3 <- matrix(21:30,ncol = 5, nrow = 2))
m2+m3
m3 <- t(m3)
m3
m1 / m2 

#wrong multi:
m1*m2

#correct multi using piping operator
m1%*%m3
