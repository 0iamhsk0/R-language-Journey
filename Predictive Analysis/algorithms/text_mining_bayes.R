#TEXT ANALYSIS 
#1. loading the data
getwd()
setwd("D:\\asus_cloud\\Desktop\\B.tech\\FIFTH SEM\\predictive analysis\\DATA")
getwd()

text_data <- read.csv(file.choose())
View(text_data)

str(text_data)

text_data$type <- factor(text_data$type)

View(text_data)

#install.packages("tm")

require(tm)

data_corpus <- VCorpus(VectorSource(text_data$type))

View(data_corpus)

lapply(data_corpus[1 : 7], as.character)

data_clean <- tm_map(data_corpus, content_transformer(toupper))
View(data_clean)
as.character(data_corpus[[1]])
as.character(data_clean[[1]])

data_clean <- tm_map(data_corpus, removeWords, stopwords())

as.character(data_corpus[[1]])
as.character(data_clean[[1]])

data_clean <- tm_map(data_corpus, removePunctuation)
data_clean <- tm_map(data_corpus, stripWhitespace)

install.packages("SnowballC")
require(SnowballC)
#till ppt pg 34 done



