#create a df employee having empid, name, sal, and dept of 6 emp, using sql cmds,
#display the names ofthe employees having sal above 10k
#update the name of the emp to 'arush' where id = 100
#find the sum of salaries and display it as, total sum
#find the number of emp working in HR dept

# Install and load the sqldf package
install.packages("sqldf")
library(sqldf)

# Create the employee data frame
employee <- data.frame(
  empid = c(100, 101, 102, 103, 104, 105),
  name = c('John', 'Alice', 'Bob', 'Eve', 'Charlie', 'David'),
  sal = c(12000, 9000, 15000, 8000, 11000, 7000),
  dept = c('HR', 'Finance', 'HR', 'IT', 'Finance', 'IT')
)

# Display names of employees with salary above 10,000
high_salary_emps <- sqldf("SELECT name FROM employee WHERE sal > 10000")
print("Employees with salary above 10k:")
print(high_salary_emps)

# Update the name of the employee where empid is 100 to 'Arush'
employee[employee$empid == 100, "name"] <- 'Arush'

# Verify the update by selecting the entire table
employee <- sqldf("SELECT * FROM employee")
print("Updated employee data:")
print(employee)

# Find the sum of salaries and display it as 'total sum'
total_salary <- sqldf("SELECT SUM(sal) AS total_sum FROM employee")
print("Total sum of salaries:")
print(total_salary)

# Find the number of employees working in the HR department
hr_count <- sqldf("SELECT COUNT(*) AS hr_employees FROM employee WHERE dept = 'HR'")
print("Number of employees in HR:")
print(hr_count)
