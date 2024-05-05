# Consider you are analyzing MEDICAL COLLEGE DATA and you have to analyze between the patient
# personal data, his/her previous medical history and parent’s medical history. You found that data is not
# tidy and needs to be stored in a correct manner again.
# TASK: Store the data in data structure in such a way that when you enter PATIENT ID then three
# further tables PATIENT BIODATA, MEDICAL HISTORY, PARENTS MEDICAL HISTORY for that
# patient will be accessed directly. Store the data for 2 patients having PATIENT ID as [P101 and P105]
# Attributes for the Patients in Their tables:
#   [PATIENT BIODATA: Patient Name, Patient ID, Patient Gender, Patient Age, Patient Job, Patient Job
#    hours]
# [PATIENT MEDICAL HISTORY: Patient ID, Blood Group, Blood Sugar Level, Blood Pressure, Heart
#   Beat, ESI, RBC Count, WBC Count]
# [PARENTS’S MEDICAL HISTORY: Patient ID, Father Name, Blood Group, Avg. Blood Sugar, Avg.
#   Blood Pressure]
# (Store data in these tables for P101 and P105 according to your choice.)
# 
# ODD Roll no 
# 
# Consider a scenario where CALL CENTER data needs to be stored, having following attributes:
#   [Caller Phone Number, Caller Name, Caller Location and Call Duration]
# TASK1: Create the appropriate data structure to save the required data. Call center got five calls where
# 1st Caller Name is ANIKET, talking from Delhi, his phone is 9041 and had called for 9 mins.
# 2nd Caller is from Chandigarh calling from 9888 number for 15 mins and telling her name as
# MANISHA
# 3rd Caller is also from DELHI and was talking for continuous 30 mins, his registered mobile number
# and name is 9646 and RAMAN respectively.
# 4th Caller mentioned himself as RAJNIKANT and explained his problem in 20secs from 7777 number
# from AP
# 5th Caller drops his call just after calling his number saved as 8899.
# TASK2: After the calls and storing the data, later we feel to add attribute GENDER and PROBLEM
# PRIORTY in dataset, so add GENDER and PROBLEM PRIORTY [CRITICAL, NORMAL,
#                                                        MODERATE] in the dataset with appropriate data type and levels.
# TASK3: After 10 mins 3rd Caller again calls and gets his name rectified as DAMAN.
# TASK4: Team leader found problem in accessing data so he had given a requirement of saving Every
# Caller data with number as CALLER1, CALLER2, CALLER3, CALLER4 and CALLER5 without
# making it as an attribute.

#Solution

Call_center <- data.frame("Caller Phone Number" =c(9041,9888,9646,7777,8899), 
                          "Caller Name" = c("Aniket","Manisha","Raman","Ranjini",NA),
                          "Caller Location" = c("Delhi","Chandigarh","Delhi","AP",NA),
                          "Call Duration" = c(9,15,30,20/60,0))
Call_center


Call_center <- cbind(Call_center,'Gender' = c("M","F","M","M",NA), 
                     'Problem Priority' = c("Critical","Normal","Moderate","Normal","Normal"))

Call_center

Call_center$Caller.Name[3] <- "Daman"
#or Call_center[3,2] <- "Daman"

rownames(Call_center) <- c("Caller1","Caller2","Caller3","Caller4","Caller5")

Call_center

View(Call_center)
