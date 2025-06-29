require(arules)
?arules
groceries_data <- read.transactions(file.choose())

View(groceries_data)
summary(groceries_data)

#providing the details of the first 5 transactions
?inspect
inspect(groceries_data[1:5])


itemFrequency(groceries_data[, 1:3])

itemFrequencyPlot(groceries_data, support = 0.1)

apriori(groceries_data)
#by default the support is 0.1 and confidence is 0.8(80% of the value)

grocery_rules <- apriori(groceries_data, 
                         parameter = list(support = 0.006, confidence = 0.25, minlen = 2))
#the created rules must be created btwn 2 values only(minlen = 2)(i.e 1 values on LHS and other in RHS)

inspect(sort(grocery_rules, by = "lift")[1:5])
berry_rules <- subset(grocery_rules, items %in% "berries")
inspect(berry_rules)
