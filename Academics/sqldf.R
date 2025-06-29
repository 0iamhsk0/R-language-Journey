#SQL installation
install.packages("sqldf", dep = T)
require(sqldf)
?sqldf
?UCBAdmissions
View(UCBAdmissions)

?str()
str(UCBAdmissions)

?summary
summary(UCBAdmissions)

#converting into data frame
ucb <- as.data.frame(UCBAdmissions)
ucb
class(ucb)


#using the sql methods:
sqldf("SELECT * from ucb")

#returning the female admission result
sqldf("Select * from ucb where Gender = 'Female' ")

#returning the male admission result
sqldf("Select * from ucb where Gender = 'Male' ")

#return the admitter students for female candidates
sqldf("Select * from ucb where Admit = 'Admitted' and Gender = 'Female' ")

#order of admissions gives in ascending or ASC
sqldf("Select * from ucb where Admit = 'Admitted' order by Freq  ")

#order of admissions gives in descending or DESC
sqldf("Select * from ucb where Admit = 'Admitted' order by Freq desc ")

#sorting can also be done using dplyr package
require(dplyr)
ucb %>% filter(Admit == "Admitted") %>%
  arrange(Freq) #prints in AO

ucb %>% filter(Admit == "Admitted") %>%
  arrange(desc(Freq)) # prints in DO

#for counting how many depts
sqldf("select distinct Dept from ucb")
sqldf("select Dept, sum(Freq) from ucb group by dept")

#counting how many students got selected
sqldf("select dept, sum(Freq) from ucb where admit = 'Admitted' group by admit")

#Aggregate queries
#total admitted students
sqldf("select admit, sum(freq) from ucb
      where gender = 'Male' group by admit")

sqldf("select admit, sum(freq) from ucb
      group by admit")

#admitted students in Dept D
sqldf("select dept, sum(freq) from ucb
      where Dept = 'D'")

#department wise total admitted students
sqldf("SELECT dept, sum(freq) from ucb
      where admit = 'Admitted' group by dept")

#total rejected students dept wise
sqldf("SELECT dept, sum(freq) from ucb
      where admit = 'Rejected' group by dept")

#return total admitted males
sqldf("SELECT Gender, sum(freq) from ucb
      where Admit = 'Admitted' and gender = 'Male'")

#or

sqldf("SELECT sum(freq) as total_dudes from ucb
      where Admit = 'Admitted' AND gender = 'Male'")

#return total rejected females
sqldf("SELECT sum(freq) as total_ladies from ucb
      where Admit = 'Rejected' AND gender = 'Female'")

#average admitted students by department (usually by mean)
sqldf("SELECT Dept, avg(Freq) as average_admitted from ucb
      where Admit = 'Admitted' group by Dept")

#understanding for sample
sample(2,5, replace = T, prob = c(0.6,1))
?sample

#create another database, names majors
majors <- data.frame(major = c('Math', 'Biology', 'Engineering',
                               'CSE', 'History', 'Architecture'),
                     Dept = c(LETTERS[1:5], 'Other'),
                     Faculty = round(runif(6, min = 10, max = 30)))
majors


?sqldf
require(sqldf)

View(ucb)


sqldf("select * from ucb")   #loads everything

?inner_join


###joins::
#join the two tables using the common keys

sqldf("Select * from ucb
      inner join majors on ucb.Dept = majors.Dept")
#5 dept 5 majors, so Architecture got eliminated and only 20 rows created

#left join
sqldf("Select * from ucb
      left join majors on ucb.Dept = majors.Dept")
#right join
sqldf("Select * from ucb
      right join majors on ucb.Dept = majors.Dept")

sqldf("Select * from ucb
      join majors on ucb.Dept = majors.Dept")

# how many majors are there:
sqldf("select distinct dept from ucb")

#wild cards:
sqldf("select * from ucb where Freq between 8 and 52")

#wild card match queries
sqldf("select * from ucb where Freq between 8 and 52")
sqldf("Select * from ucb where gender like '%male%'")
sqldf("Select * from ucb where gender like '__male%'")
sqldf("Select * from ucb where gender like 'm%'")
sqldf("Select * from ucb where gender like 'f%'") #these are not case sensitive
sqldf("Select * from ucb where gender like 'm%'")
sqldf("Select * from ucb where gender like 'm%'")
