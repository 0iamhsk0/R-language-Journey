install.packages("ggplot2")
library(ggplot2)
?ggplot2

summary(iris)
# scatter plots
ggplot(data = iris, aes(x=Sepal.Length, y=Petal.Length))+geom_point()
ggplot(data = iris, aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point()

#histogram
ggplot(data = iris, aes(x=Sepal.Length)) + labs(x="Sepal", y="Frequency of sepal length") + 
  geom_histogram(bins = 10, fill = 'red', col = 'black') +
  ggtitle('Histogram')
  
#box plot
ggplot(data = iris, aes(x = Species, y=Sepal.Length, fill = Species)) + geom_boxplot() 

#barplot
ggplot(data = iris, aes(Petal.Length, fill = Species)) + geom_bar()

View(iris)
#Error due to stat_count

ggplot(data = iris, aes(x=Species, y = Petal.Length)) + geom_bar(stat = 'identity', col = 'violet')

#rgb color
ggplot(data = iris, aes(x = Species)) + geom_bar(col = "blue", fill = rgb(0.7,0.2,0.1), width = 0.5)

#hexadecimal notation
ggplot(data = iris, aes(x = Species)) + geom_bar(col = "blue", fill = "#080ecd", width = 0.5)

#density plot
ggplot(data  =iris, aes(x = Sepal.Length, fill = Species)) + labs(x = "sepal Length", y = "frequency of sepal length")+
         geom_density(col = "red", alpha = 0.6) + 
         ggtitle("Density plot")

#pie chart
table(iris$Species)
data <- as.data.frame(table(iris$Species))
data
View(iris)
ggplot(data, aes(x = "", y = Freq, fill = Var1)) + geom_bar(stat = 'identity') +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  labs(title = "Pie Chart") +
  coord_polar(theta = "y", start = 0)
 
#bubble plot its sililar to scatter plot but we use third numeric value to define size of the bubbles
ggplot(mtcars, aes(x = mpg, y = disp, size = cyl, col = cyl)) + geom_point()
  