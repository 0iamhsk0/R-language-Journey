
#create a data frame, that will store the record of 6 emp, name, id, dept
# 1. display the entire df
# 2. first 5 emp
# 3. entre record of 6th emp
# 4. display the value, mentioned in 1st row and 2nd col

#declare a matric and find its transpose without using inbuilt func
#multiply 2 matrices after checking the cond of matrix multiplication
#assign dim names to each matrix

#create a list, having name = temperature and bloodgroup of a patient
#print the temp, without using the print statement nor cat statement nor paste
#add an item to the list that is the flu state of the statement and display the appended list
#then remove the names of the list and print it again


#1Q:

emp <- data.frame("ID" = 1 : 6,
                  "Names" = c("Hemanth", "Sai", "Kumar", "Pentakota", "Hriday", "Hemu"),
                  "DEPT" = c("pharma", "civil", "accounts", "treasury", "manager", "CEO"),
                  row.names = c("emp1", "emp2", "emp3", "emp4", "emp5", "emp6"))

emp

emp[, 2]

emp$ID[5, 1]
