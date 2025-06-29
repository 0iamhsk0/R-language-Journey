#converting date and time into required format
d1 = c('26/01/2005')
d1

class(d1)
typeof(d1)

#studying date and time:
anydate <- as.POSIXct((d1, format = %d/%b/%y))
as.POSIXct(d1)

unclass()
?POSIXct



