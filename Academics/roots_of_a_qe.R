roots = function(a, b, c){
  eq_form = (b^2) - (4 * a * c)
  eq_form
}

3, 6, 2

?scan()

a <- scan(what = numeric())
b <- scan(what = numeric())
c <- scan(what = numeric())

eq_form <- (b^2) - (4 * a * c)

abs(a)
abs(b)
abs(c)

if (eq_form == 0){
  print("Roots are real and equal and the roots are: ")
  r1 = r2 = -b/(2 * a)
  print(sprintf("The roots: %f, %f", r1, r2))
}else if(eq_form > 0){
  print("Roots are real and different and the roots are: ")
  r1 = (-b + sqrt(eq_form))/(2 * a)
  r2 = (-b - sqrt(eq_form))/(2 * a)
  print(sprintf("The roots: %f, %f", r1, r2))
}else {
  print("Roots are imaginary")
}

?matrix


?data.frame
?factor
