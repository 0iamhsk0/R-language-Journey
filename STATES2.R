st <- read.csv("C:\\Users\\Hemant\\OneDrive\\Desktop\\B.tech\\FOURTH SEM\\Data management\\STATES.csv")
getwd()
View(st)

#file choosing:
tes <- read.csv(file.choose())
View(tes)
is.na(st)
getwd()
str(st)
st = read.csv(file.choose(), sep = ',', header = T)
View(st[!complete.cases(st),])
View(is.na(st))

#headers = column names

typeof(st)
class(st)
?complete.cases
is.na(st)
summary(st)

st[c(7,15,23,26),]
#numneric values or NA values should be replaced with mean or median
#if string then replace with mode values
mean
?replace

st1 <- st
View(st1)
View(is.na(st1))
nrow(st1)
nrow(st1[!complete.cases(st1),])
st1 = na.omit(st1)
nrow(st1[!complete.cases(st1),])
nrow(st1)

?complete.cases


summary(st1)
str(st1)


st2 <- st
st2
View(st2)
st2 <- na.omit(st2)
summary(st2)
View(st2[!complete.cases(st2),])
names(st2)
typeof(st2)
class(st2)

#which
which(st2 $State == "Andhra Pradesh")
mean(st2$Literacy.Rate., na.rm = T)
mean(st2$Literacy.Rate., na.rm = F)

View(st2)
#numeric type should be must to calc mean

#which can be used to access the data too
st2[which(st2$State == "Goa"), "Year"] = mean(st2$Tree.Cover, na.rm = T)

View(st2[!complete.cases(st2),])


st3 <- st
View(st3)
View(st3[!complete.cases(st3),])

?sapply
#sapply
sapply(st3, anyNA)
anyNA(st3)

names(which(sapply(st3, anyNA)))
is.na(st3$Literacy.Rate.)


#semi manual method
#in which we replace the NA values with their respective NA values
st3$Literacy.Rate.[is.na(st3$Literacy.Rate.)] = mean(st3$Literacy.Rate., na.rm = T)
st3$Tree.Cover[is.na(st3$Tree.Cover)] = mean(st3$Tree.Cover, na.rm = T)
st3$Sex.Ratio[is.na(st3$Sex.Ratio)] = mean(st3$Sex.Ratio, na.rm = T)
View(st3)
View(st3[!complete.cases(st3),])

names(which(sapply(st3, anyNA)))
names(which(sapply(st2, anyNA)))



st4 <- st
View(st4[!complete.cases(st4),])
for(i in 1:ncol(st4)){
st4[is.na(st4[,i]),i] = round(mean(st4[,i], na.rm = T))
}
View(st4[!complete.cases(st4),])
View(st4)


#missForest
st5 <- st
summary(st5)
which(sapply(st5, anyNA))
st5.imp
st5.imp <- missForest(st5[,which(sapply(st5, anyNA))])
completeMissfor <- as.data.frame(st5.imp[[1]])
View(completeMissfor)
new55 <- cbind(st5[, -c(7,9,11)], completeMissfor)
View(new55)

#prodNA
iris.mis <- prodNA(iris, noNA = 0.1)
summary(iris.mis)
View(iris.mis)

iris.imp <- missForest(iris.mis)
#conversion for the first type
completeDataForest = as.data.frame(iris.imp[[1]])
View(completeDataForest)
summary(completeDataForest)
