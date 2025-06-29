x <- factor(c(2,2,1), levels = c(1,2, 3))
x
is.na(x)
row.names()
as.data.frame(x)
y <- row.names(x)
y
data.frame(x)


# Example data frame
df <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 28),
  married = c(TRUE, FALSE, TRUE)
)

df
# Output the structure of the data frame using dput()
dput(df)


c <- matrix(1:6, 2 ,3, byrow = TRUE)
rownames(c) <- c('x', 'y')
c


t <- c(1,NA,TRUE, FALSE, 6)
t[!bad]
bad <- is.na(t)
bad


x <- matrix(1:4, 2, 2)
y <- matrix(rep())
?rep


x <- c(3, TRUE)
class(x)

x <- c(3,4,5)
y <- c(4,7,4)
cbind(x,y)
rbind(x,y)


y <- (1:4)
x <- 4
z <- x + y
class(x+y)


z <- read.csv(file.choose())
View(z)
class(z)
data.frame(z)
z[[151]]


z[47, 1]
summary(z)
mean(z$Ozone)
mean(z$Solar.R, na.rm = TRUE)
mean(z$Temp[z$Month == 6])
max(z$Ozone[z$Month == 5], na.rm = TRUE)




#Question 18
#Extract the subset of rows of the data frame 
#where Ozone values are above 31 and Temp values 
#are above 90. What is the mean of Solar.R in this subset?

  # Assuming you have your data frame named "data"
  
  # Subset data based on conditions
subset_data <- z[z$Ozone > 31 & z$Temp > 90, ]

# Calculate the mean of Solar.R in the subset
mean_solar_r <- mean(subset_data$Solar.R, na.rm = TRUE)  # Exclude NAs

# Print the result
print(mean_solar_r)
x <- c(4, "a", TRUE)
class(x)



x <- list(2, "a", "b", TRUE)
class(x[[1]])
