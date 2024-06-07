#Syntax

Function_name <- function(arguments)[body] 

#ddeclaration of 
#static, cus the function is restricted with 2 parameters
q1 = function(a=6, b=0){
  print(a)
  print(paste("b is :", b))
  z = a+b
  print(z)
}

#function calling
q1()
q1(b = 10)
q1(5, 20)

q2 = function(a=7, b=0){
  print(a)
  z = a-b
  print(z)
}
q2()

#this is dynamic programming, cuz we can input many inputs
addSum <- function(x,...){
  args <- list(...)
  #for loop runs untill ... times
  for(a in args) x <- x + a
  print(x)
}
addSum(23, 12, 56)



