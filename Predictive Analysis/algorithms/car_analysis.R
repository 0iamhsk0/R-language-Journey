?getwd()

#first step:
setwd("D:\\asus_cloud\\Desktop\\B.tech\\FIFTH SEM\\predictive analysis\\DATA")
getwd()

car_analysis <- read.csv("usedcars.csv", stringsAsFactors = FALSE, header = TRUE)

#second step: 
str(car_analysis)

#third step, summary:
summary(car_analysis)
summary(car_analysis$mileage[1:10])
summary(car_analysis$price[1:10])
summary(car_analysis$price)


View(car_analysis)

range(car_analysis$mileage)

table(car_analysis)



car_analysis

?randu
?table
?mode
?quarters
?range
