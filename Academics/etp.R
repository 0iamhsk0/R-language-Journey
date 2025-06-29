#install.packages("dplyr", dep = T)
#install.packages("sqldf", dep = T)

View(mtcars)

#1. subsetting without any package or function:
subsetq1 <- mtcars[mtcars$gear > 3 & mtcars$am == 1 & mtcars$cyl > 3,]
subsetq1
#or
print(subsetq1)
typeof(subsetq1)
class(subsetq1)

#2. subsetting with subset function:
?subset
subsetq2 <- subset(newdata$gear > 3, mtcars$am == 1, mtcars$cyl > 3)
subsetq2
print(subsetq2)
typeof(subsetq2)
class(subsetq2)

#3. subsetting with DPLYR package:
require(dplyr)
?filter
?dplyr
newdata <- as.data.frame(mtcars)
subsetq3 <- newdata %>%
  filter(gear > 3, am == 1, cyl > 3)
subsetq3
print(subsetq3)
typeof(subsetq3)
class(subsetq4)

#4. subsetting with SQL select query:
library(sqldf)
?sqldf
subsetq4 <- sqldf("Select * From mtcars Where gear > 3 And am = 1 and cyl > 3")
subsetq4
print(subsetq4)
typeof(subsetq4)
class(subsetq4)





?apply
?lapply
is.factor(mtcars$mpg)
?levels
?factor
?factor?rep
?name
?grep
date()
?mutate
?paste
?class
?file
require(tidyr)
?tidyr
?dplyr
?subset
