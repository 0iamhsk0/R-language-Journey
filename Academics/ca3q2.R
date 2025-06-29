#Q2 You have been the dataset of Titanic Ship and needs to find some insights from that dataset using
#dplyr package
#TASK1: Which gender is given more preference for survival.
#TASK2: Which age group of people are mostly not survived.
#TASK3: Passengers paying more fare given priority for survival?
#TASK4: Inequalities between various class also leads to low survival rate for which class?



file <- read.csv(file.choose())
View(file)

require(dplyr)
library(dplyr)

?dplyr



#t1
file %>%
  group_by(sex, survived) %>%
  summarise(count = n()) %>%
  filter(survived == 1) %>%
  arrange(desc(count))
summary(file)
#t2
file %>%
  mutate(age_group = cut(age, breaks = c(0, 18, 30, 50, Inf), labels = c("Child", "Young Adult", "Adult", "Elderly"))) %>%
  group_by(age_group, survived) %>%
  summarise(count = n()) %>%
  filter(survived == 0) %>%
  arrange(desc(count))

#t3
file %>%
  mutate(fare_category = cut(fare, breaks = c(0, 50, 100, Inf), labels = c("Low", "Medium", "High"))) %>%
  group_by(fare_category, survived) %>%
  summarise(count = n()) %>%
  filter(survived == 1) %>%
  arrange(desc(count))

#t4
file %>%
  group_by(pclass, survived) %>%
  summarise(count = n()) %>%
  filter(survived == 0) %>%
  arrange(desc(count))

