#subsetting can be done with or witout function
View(mtcars)
summary(mtcars)

##systnax for subsetting:
##datasetname[Rownumber or 'rowname', columnumber or 'columnname']

#subsetting passing a part of data without the whole data with some conditions

mtcars
mtcars[,]
#gives all the first row elements 
mtcars[1,]
class(mtcars[1,])
#gives all the first column elements
mtcars[,1]
class(mtcars[,1])
#gives the complete first column
mtcars[1]
class(mtcars[32,11])
typeof(mtcars[32,11])

mtcars[2,c(1,3,4)]
mtcars[1] + mtcars[2]

##Subsetting and viewing data through column names and row names
mtcars$mpg
mtcars['am']
mtcars[,c(1,3,4)]
mtcars[c(1,3,4),]
mtcars[,c('am', 'mpg')]
mtcars[c("Volvo 142E", "Merc 450SL"),]

##subsetting using condition:
library(dplyr)


###subsetting using subset keyword:
?subset
subset(mtcars)
subset(mtcars,)
subset(mtcars, cyl>4)
subset(mtcars, row.names(mtcars) %in%
         c('Mazda RX4', 'Merc 450SL'))

##subsetting using sql 


## Select and Projection:
View(subset(mtcars, select = c('mpg')))
subset(mtcars, am==0, select = hp)



#**** mam code:

# SUBSETTING IN R # 

View(mtcars) 
head(mtcars) 
tail(mtcars) 
str(mtcars) 
summary(mtcars) 
nrow(mtcars) 
ncol(mtcars) 
length(mtcars) 


# ** SUBSETTING DATA FROM DATASET NAME ONLY USING SQUARE BRACKETS ** # 

# SUBSETTING AND VIEWING DATA THROUGH COLUMN NUMBER 
#SYNTAX: Datasetname[Rownumber or 'Rowname' , Columnnumber or 'Columnname']  
mtcars 
mtcars[] 
mtcars[,] 
mtcars[,1,drop=F] 
mtcars[c(1,2)] 
mtcars[,1]+mtcars[,2] 
mtcars[1]+mtcars[2] 
mtcars[1] 
mtcars[c(1,3,4)] 
mtcars[,c(1,3,4)] 
mtcars[2,c(1,3,4)] 
# SUBSETTING AND VIEWING DATA THROUGH COLUMN NAMES AND ROW NAMES 
mtcars$mpg 
mtcars['am'] 
mtcars[,'mpg'] 
mtcars[,c('am','mpg')] 
mtcars['Volvo 142E',] 
mtcars[c('Volvo 142E','Maserati Bora'),] 
# SUBSETTING AND VIEWING DATA USING CONDITIONS 
#dplyr 
library(dplyr) 
mtcars%>% filter(am==0)%>% View 
#sqldf 
library(sqldf) 
View(sqldf("select * from mtcars where am==0")) 

View(mtcars[mtcars$am==0,]) 
mtcars[which(mtcars$gear>4),] 
mtcars[which(mtcars$am==0),'hp'] 
mtcars[which(mtcars$vs==0 & mtcars$cyl>4),] 
mtcars[which(mtcars$vs==0 & mtcars$cyl>4),c('hp','gear')] 


# **** SUBSETTING DATA FROM SUBSET FUNCTION ONLY ** # 

#SYNTAX: subset(Datasetname,Condition(selection of Data),Columns(Projection of Data))  


subset(mtcars) 
subset(mtcars,) 

# Selection  (Selection would always be logical) 
View(subset(mtcars,am==0)) 
subset(mtcars,gear>3) 
subset(mtcars,cyl>4) 
subset(mtcars,row.names(mtcars) %in% 
         c('Mazda RX4','Merc 450SL')) 



# Projection 
View(subset(mtcars,select=c(mpg,hp))) 
subset(mtcars,select=am) 
subset(mtcars,select=3) 
subset(mtcars,select=c(1,3,4)) 
subset(mtcars,select=c(1))+subset(mtcars,select=c(2)) 

# Selection and Projection 
subset(mtcars,am==0,select=hp) 
subset(mtcars,vs==0 & cyl>4,select=c(hp,gear))