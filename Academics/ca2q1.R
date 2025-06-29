#1 Initialize i to last digit of your reg no. and
#write a code that prints the variable, “ i ” from last digit
#of your reg no. to 6 and exit the loop if “ i ” equals 4.


reg_no <- "12220407" 
last_digit <- as.numeric(substr(reg_no, nchar(reg_no), nchar(reg_no)))

i <- last_digit

while (i >= 6) {
  cat("i:", i, "\n")
  if (i == 4) {
    break 
  }
  i <- i - 1 
}

cat("Loop exited because i equals 4.\n")

