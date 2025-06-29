#applying tidyr packages on a csv file


data <- read.csv(file.choose())
View(data)

library(tidyr)
?unite

#unite the data
unite_data <- unite(data, CS, city, state, sep = "#")
# same unite_data <- data %>% unite(CS, city, state, sep = "#")
View(unite_data)

#seperate the data of unite_data
separate_data <- separate(unite_data, CS, c("city", "state"), sep = "#")
# same separate_data <-unite_data %>%  separate(CS, c("city", "state"), sep = "#")
View(separate_data)


#combining the bill into gas and water bill

unite_data1 <- unite(separate_data, bill, gasbill, waterbill, sep = '#')
View(unite_data1)

#gather reshaping wide format to long format
datapivot <- gather(data, bill_type, bill_amt, gasbill:waterbill)

#spread reshaping long format to wide format
datasep <- spread(datapivot, bill_type, bill_amt)
View(datasep)

?head
head(data)

datasep <- separate(data, Date, c("Day", "Month", "Year"), sep = "-")
View(datasep)

head(datasep)
dataunite <- unite(datasep, Date, c("Day", "Month", "Year"), sep = "/")
View(dataunite)


#separate
#unite
#gather
#spread
#replace_na - omly removes the NA values
#?drop_na - WILL delete the complete rows which contaian NA values

df <- data.frame(x = c(1, 2, NA), y = c("a", NA, "b"))
df %>% replace_na(x = 0, y = "unknown")
?replace_na
?drop_na
