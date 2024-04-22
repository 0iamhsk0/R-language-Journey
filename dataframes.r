
#data frames: different types of data items(heterogeneous types)

#creating data frames

x <- data.frame("S N" = 1:4, "Age" = c(10,20,30,40), "Name" = c("Sai", "rambo", "kumar", "hsk"))
typeof(x)  
x  
  # $ represents . 
  # . represents pause/break

#acessing data frames
x[2,3]
class(x[4,])
class(x[,3])
class(x)
x[,1]
class(x[,1])

names(x)
str(x)
nrow(x)
ncol(x)

typeof(x[,1])

#gives the answer of only the 1d qunatites
length(x)
#whereas dim gives the total size of the multi dim data frame
dim(x)

#gives the structure of the data frame
str(x)

  
#accesing the elements in rows and the col
x$S.N[3:3]
x$Age[4]
x$Name[]


#gives the overall details of the data frames:
summary(x)

y <- data.frame("S N" = 1:4, "Age" = c(10,20,30,40), "Name" = c("Sai", "rambo", "kumar", "hsk"))
y
#overiding of data occurs
y <- cbind("platform" = c("pc", "pc", "xbox", "station5"))
y

#for non overiding of data we need to :
#first execute again the og value
y <- cbind(y, "platform" = c("pc", "pc", "xbox", "station5"))
y
y <- rbind(y, c(5, 19, "Shadow", "steam"))
y
rm(x, "Name")

