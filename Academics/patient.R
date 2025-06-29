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

#Solution:

"Patient ID" <- c("P101","P105")
"Patient Name" <- c("Anvit","Bhargavi")
"Patient Gender" <- c("M","F")
"Patient Age" <- c(35,45)

"PATIENT BIODATA" <- data.frame(c(`Patient Name`, `Patient ID`, `Patient Gender`,
                             `Patient Age`, `Patient Job`, `Patient Job hours`))
PATIENTMEDICALHISTORY <- data.frame("Patient ID", "Blood Group", "Blood Sugar Level", 
                          "Blood Pressure", "HeartBeat", "ESI"," RBC Count", "WBC Count")
PATIENTBIODATA
