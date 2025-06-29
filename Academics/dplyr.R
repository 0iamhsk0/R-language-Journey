

### subsetting data from dplyr package

install.packages('dplyr')
library(dplyr)
require(dplyr)

?dplyr

#dplyr is grammar of data manipulation and is used for data cleaning 
View(mtcars)
?mtcars
names(mtcars)
v1 <- select(mtcars, mpg, am)
filter(v1, cyl > 5)
View(mtcars)

#use of pipe sysmbol
#USING SELECT KEYWORDS
select(mtcars, cyl)
#can also be executed using piping operators '% %'
select(mtcars, -am)
select(mtcars, contains("at"))%>% View


#using filter method

?filter
filter(mtcars, am == 0) %>% View
filter(mtcars, am == 0 | vs == 0) %>% View


#loading the rownames

mtcar <- mtcars
?mutate
mtcar <- mutate(mtcar,carmodel = row.names(mtcar)) 
View(mtcar)
row.names(mtcars)
row.names(mtcars) <- NULL
row.names(mtcars)
mtcar$carmodel<- mtcars
View(mtcars)

mtcar <- mtcar %>% mutate(mpg100 = mpg * 100)
#gives the same op as above line but the piping operator updates
#the View of created method but not the values
#only one time use of the piping operator
#so mtcar <- mtcar %>% mutate(mpg100 = mpg * 100) is the best to use instead
#of the bottow line
mtcar <- mtcar %>% mutate(mpg100 = mpg * 100) %>% View

View(mtcar)

#using filter now
filter(mtcar, am == 0)
#if we call data set once when using filter and not use again we wont get error, 
#otherwise multiple memory spaces get created

filter(mtcar, am == 0)
View(mtcar)
filter(mtcar, am == 0) %>% select(mtcar, cyl, am, mpg) %>% View
mtcar <- mtcars

View(mtcar)
View(df <- mtcar %>% filter(row.names(mtcars) %in% c('Mazda RX4', 'Merc 450SL')) %>% select(mpg, cyl))


?head



--------------------

View(iris)

irisnew <- iris
#using %>%, select and arrange keywords

#by default arranges in ascending order of sepal.length
iris %>% 
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) %>%
  arrange(irisnew, Sepal.Length) %>% View

iris %>% 
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) %>%
  arrange(desc(irisnew), Sepal.Length) %>% View

iris %>% 
  select (Sepal.Length) %>%
  arrange(desc(irisnew), Sepal.Length) %>% View

iris %>% 
  select (Species) %>%
  arrange(desc(irisnew), Species) %>% View

iris %>% 
  filter(Species == "setosa")
  arrange(desc(irisnew), Species) %>% View

iris %>% 
  summarise(avg = mean(Sepal.Length))

iris %>% group_by(Sepal.Width) %>%
  summarise(avg = mean(Sepal.Length), max(Sepal.Length), min(Sepal.Length), total = n())


#creates a tibble when used group by to a data frame i.e by using summarize()
iris %>% 
  group_by(Species, Sepal.Length) %>%
  summarise(total = n())

iris %>% 
  group_by(Sepal.Width, Sepal.Length) %>%
  summarise(total = n())

?iris
?mtcars
  
mtcars[,1]
iris[,1]
iris[,2]
iris[,3]
iris[,4]
iris[,5]
iris[,-4]



View(iris)
View(irisnew)


?iris

View(starwars)
inp