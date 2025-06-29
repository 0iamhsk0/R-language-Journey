###TIDYR

install.packages("tidyr", dep = T)
library(tidyr)
library(dplyr)
?tidyr
View(tidyr)
View(mtcars)
mt <- mtcars


###usage of gather in tidyr
  #gather(data, pivot tablekey#i.e pivot table feed, pivot table value#name for it, ...#args
    #, na.rm = FALSE#doesnt remove NA values, convert = False)

mtNew <- gather(mt, New_Field, Field_value, mpg:carb)
mtNew
#IF we use varible args then 32*11 rows will be ccreated
View(mtNew)
mtNew$ID <- 1:352
View(mtNew)
#used to gather columns into ket value format
?gather


  #spread, converts the row values into Vector format
?spread


#attribute will be : New_Field, value storage in Field_value
mtSpread <- spread(mtNew, New_Field, Field_value)
View(mtSpread)
mtSpread


View(iris)

###
###
#examples for gather and spread
mtn <- gather(mt, New_Field, Field_value, mpg:gear)
mtn$ID <- 1:320
View(mtn)

View(mtcars)

mts <- spread(mtn, New_Field, Field_value)
View(mts)


  #Unite:Unite multiple columns into one by pasting strings together
?unite
?set.seed()

set.seed(1:100)
date <- as.Date('2024-02-04') + 0:14 #adds 14 days consecutevly
hour <- sample(1:24, 15)
min <- sample(1:60, 15)
seconds <- sample(1:60, 15)
event <- sample(letters, 15)
data <- data.frame(date, hour, min, seconds, event)

hour
View(data)

dataNew <- data %>%
  unite(datehour, date, hour, sep = ' ') %>%
  unite(datatime, datehour, event, sep = '_')
View(dataNew)

data1 <- dataNew %>%
  separate(datatime, c('date', 'time'), sep = ' ') %>%
  separate(time, c('hour', 'event'), sep = '_')
View(data1)


require(tibble)

#rough:

vec1 <- 1:3
vec2 <- 4:6
mat <- cbind(vec1, vec2)
mat2 <- rbind(vec1, vec2)
mat
mat2


# Generate 10 random numbers from a standard normal distribution (mean = 0, sd = 1)
random_numbers <- rnorm(10)
print(random_numbers)
# Generate 100 random numbers from a normal distribution with mean = 10 and sd = 2
random_numbers <- rnorm(100, mean = 10, sd = 2)
random_numbers
