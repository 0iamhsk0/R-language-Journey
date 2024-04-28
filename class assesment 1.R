ODD Roll no

Consider a scenario where CALL CENTER data needs to be stored, having following attributes:
  [Caller Phone Number, Caller Name, Caller Location and Call Duration]
TASK1: Create the appropriate data structure to save the required data. Call center got five calls where
1st Caller Name is ANIKET, talking from Delhi, his phone is 9041 and had called for 9 mins.
2nd Caller is from Chandigarh calling from 9888 number for 15 mins and telling her name as
MANISHA
3rd Caller is also from DELHI and was talking for continuous 30 mins, his registered mobile number
and name is 9646 and RAMAN respectively.
4th Caller mentioned himself as RAJNIKANT and explained his problem in 20secs from 7777 number
from AP
5th Caller drops his call just after calling his number saved as 8899.
TASK2: After the calls and storing the data, later we feel to add attribute GENDER and PROBLEM
PRIORTY in dataset, so add GENDER and PROBLEM PRIORTY [CRITICAL, NORMAL,
                                                       MODERATE] in the dataset with appropriate data type and levels.
TASK3: After 10 mins 3rd Caller again calls and gets his name rectified as DAMAN.
TASK4: Team leader found problem in accessing data so he had given a requirement of saving Every
Caller data with number as CALLER1, CALLER2, CALLER3, CALLER4 and CALLER5 without
making it as an attribute.


#task 1:

# data frame to store call center data
callcenterdata <- data.frame(CallerPhoneNumber = c(9041, 9888, 9646, 7777, 8899),
                               CallerName = c("ANIKET", "MANISHA", "RAMAN", "RAJNIKANT", NA),
                               CallerLocation = c("Delhi", "Chandigarh", "Delhi", "AP", NA),
                               CallDuration = c(9, 15, 30, 0.333, NA))

print(callcenterdata)

#task 2:
callcenterdataGender <- c("Male", "Female", "Male", NA, NA)
callcenterdataProblemPriority <- factor(c("NORMAL", "MODERATE", "CRITICAL", NA, NA),
                                           levels = c("CRITICAL", "NORMAL", "MODERATE"))

# Display the updated data
print(callcenterdata)


#task 3:
callcenterdata.CallerName[3] <- "DAMAN"
print(callcenterdata)

