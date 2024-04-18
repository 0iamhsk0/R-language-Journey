#the data objects:
#vectors
#matrices
#arrays
#lists and data frames
#vector is the collection of homogenous collection types

#make sure use the default operator i.e <-

x <- c(2,45,23,10,0,69);
#A vector is created
x;
class (x);
y <- 1:20.90; # only supprts the int values
x <- c(20.35355:40); # the execution time increases
x;
y;
class (y);
class (x);
z <- c(12, 34 , 24, 0, 24, "A");
z; # since verctors are homegenous

class (z);
z >- d(2,4,35); # doesnt work;

f <- c(FALSE, TRUE);
f; 
class (f);

#there is no float in R, we have double (which is a higher version)
typeof (x);

e <- C(34, 45, "a"); #doesnt work cuz of C
e <- c(34, "A", 56);
e;
typeof(e);
class (e);


#multi generation:
q <- c(1:23, 23:50, 50:75, 75:100, 100);
q;
typeof (q);
class (q);

b <- c(1:10, 11:23.40, 23.50:40, 100); #every value turn into numeric cuz vectors are homog
b;
class(b);
typeof (b);

#length func
length(b);

#posistioning
b[5];
b[30];
b[30] <- 31.5;
b;

C <- c(1.5:10.7, 20.5:50.50);
C;
typeof(C);
class(C);
length(C);
C[30];
C[100];
C[100] <- 100;
C;
C <- C[-5];
C;

d <- (-23.0);
d;
typeof(d);


t <- (-9);
typeof(t);

length(C);
c[C(1, 3, 9, 10)];


g <- c(30, 2100, 340 , 400:430);
g;
g[c(10, 1, 5, 100, 89:120)];  #multi addressing

#we cant use comi of +ve and -ve in vectors

g <- g[-4];
g;
g[10]< -10;
g;
g[-10]; #removal of a element

g[23] <- 500;
g;

# updating elements in vector
g[c(1, 2, 4, 10)] <- c(9000, 1000, 2000, 5000);
g;

#temporary updation:
g[-4];
g;
#permanent updation:
g <- g[-4];
g;
#multi updation
g <- g[c(-4, -6)];
g;

#logical indexing:
t <- c(1,2,3,4,5,6,7,8,9,11,13,35,34,21,4,55);
t[c(T,T,F,F,T,F,T,F,T,T,F)];
typeof(t);
class(t);
t;

#using 0/1 for indexing:
b <- c(1,2,3,4,5,6,78,89,0);
b[c(1,1,1,0,0,1,0,0,0)];
