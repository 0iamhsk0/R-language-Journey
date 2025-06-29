install.packages(c("wordcloud", "tm", "pdftools", "SnowballC"), dep = T)
require("wordcloud")
require("tm") 
require("pdftools")
require("SnowballC")

#pdf tools:
?pdftools
txt <- pdf_text(file.choose())
summary(txt)
class(txt)
typeof(txt)
View(txt)

txt
txt[121]

?Corpus

txt_corpus <- Corpus(VectorSource(txt))
txt_corpus

# use operation of list to view data 
?inspect
inspect(txt_corpus[1]) # tree format gets broken 
inspect(txt_corpus[[1]]) # creates an arranged format

lapply(txt_corpus, as.character)
?lapply

#data cleaning

#lower case
txt_corpus_clean <- tm_map(txt_corpus, tolower)
lapply(txt_corpus[1], as.character)
lapply(txt_corpus_clean, as.character)

#Remove numbers from the content
txt_corpus_clean <- tm_map(txt_corpus, removeNumbers)
lapply(txt_corpus_clean[1:2], as.character)
lapply(txt_corpus[1:2], as.character)
?tm_map

#Remove punctuations from the content
txt_corpus_clean <- tm_map(txt_corpus, removePunctuation)
lapply(txt_corpus_clean[1:2], as.character)
lapply(txt_corpus[1:2], as.character)

#Remove punctuations from the content
txt_corpus_clean <- tm_map(txt_corpus, stripWhitespace)
lapply(txt_corpus_clean[1:2], as.character)
lapply(txt_corpus[1:2], as.character)



#
#
#
#lecturer's code:
#
#
#

install.packages("wordcloud", dep =T)
install.packages('tm',dep= T)
install.packages("pdftools", dep= T)
install.packages("SnowballC", dep=T)
library(SnowballC)
library(pdftools)
library(tm)
library(wordcloud)
txt <- pdf_text(file.choose()) #state of aging 
str(txt)
txt[3]
class(txt)
cat(txt[1:2])
# First step for text mining is to create corpus, 
#which is the collection of text documents
# types of corpus - Vcorpus, Pcorpus
#VectorCorpus reader function which used to create source object 
#from existing vector

txt_corpus = Corpus(VectorSource(txt))   # tm
txt_corpus[3:6]
#use operation of list to view data
inspect(txt_corpus[[1]])
as.character(txt_corpus[1:2])
t=lapply(txt_corpus,as.character)
t

# data cleaning

#lower case
txt_corpus_clean = tm_map(txt_corpus,tolower)
lapply(txt_corpus[102],as.character)


#Remove numbers from content
txt_corpus_clean = tm_map(txt_corpus_clean,
                          removeNumbers)
lapply(txt_corpus_clean[102],as.character)

# remove punctuation

txt_corpus_clean = tm_map(txt_corpus_clean,
                          removePunctuation)
lapply(txt_corpus_clean[1:2],as.character)
lapply(txt_corpus[1:2],as.character)

#remove whitespace
txt_corpus_clean = tm_map(txt_corpus_clean,stripWhitespace)
lapply(txt_corpus_clean[1:2],as.character)

#remove stopwords
stopwords('en') #check stopwords for eng lang
txt_corpus_clean = tm_map(txt_corpus_clean,removeWords,stopwords())
lapply(txt_corpus_clean[1:2],as.character)

## stemming
wordStem(c("teach","teaches","teaching"))
txt_corpus_clean <- tm_map(txt_corpus_clean,stemDocument)
txt_corpus_clean <-tm_map(txt_corpus_clean,stripWhitespace)

#Final Step :-Data Preparation :- split text document to words
#tokenization is process to split the document into individual components
# it will be done using DTM
dtm = DocumentTermMatrix(txt_corpus_clean)
dtm =as.matrix(dtm)
View(dtm)
dtm=t(dtm)
occu = rowSums(dtm)
occu
no_occu = sort(occu,decreasing = T)
head(no_occu)

# Plot wordcloud
wordcloud(txt_corpus_clean,min.freq = 50,random.order = F)

install.packages("RColorBrewer")
library("RColorBrewer")    
require(wordcloud)
wordcloud(txt_corpus_clean,min.freq = 50,random.order = F,
          color=brewer.pal(8,"Dark2"),rot.per = 0.5)



