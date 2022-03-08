##Q1
#A
x<-c(0:4)
y<-c(0:9)
outer(x,y,"+")
#B
x<-c(2:7)
y<-c(1:6)
outer(x,y,"^")
#C
x<-c(0:8)
y<-c(9:1)
outer(x,y,function(x,y){ifelse(x+y>=9,x+y-9,x+y)})
##Q2
library(swirl)
# Final Code of Module 8 
any(ints == 10)
# Final Code of Module 9
"%p%" <- function(left, right){# Remember to add arguments! 
  paste(left, right, sep = " ")
}
submit()
"I" %p% "love" %p% "R!"
##Q3
library(DAAG)
par(mfrow = c(2,4))
lapply(2:9, function(x){
  plot(austpop[,1], log(austpop[,x]), xlab="Year", ylab=names(austpop)[x],pch = 16, ylim=c(0,10))
})
##Q4
library(tidyverse)
data<-ChickWeight
#A
a<-ggplot(data)+
  geom_point(aes(x=Time,y=weight,col=Diet))
#B
a+
  ggtitle("Chick Weight")+
  xlab("Time")+
  ylab("Weight")
#C
ggplot(data)+
  geom_histogram(mapping = aes(x=weight))
#D
ggplot(data)+
  geom_histogram(mapping = aes(x=weight,fill=Diet))
#E
ggplot(data)+
  geom_bar(mapping = aes(x=Diet))
#F
ggplot(data)+
  geom_boxplot(mapping = aes(x=Diet,y=weight))
##Q5
mat1 <- matrix(sample(10, size=60, replace=T), nr=6)
#A
apply(mat1, 1, function(x)sum(x>4))
#B
apply(mat1, 2, function(x)sum(x>5))
#C
c<-apply(mat1, 1, function(x)sum(x==7))
which(c==2)
##Q6
quadratic<-function(aa,bb,cc){
  if(bb^2-4*aa*cc>0){
    print("Two distinct real roots")
  }else if(bb^2-4*aa*cc==0){
    print("One real root")
  }else if(bb^2-4*aa*cc<0){
    print("Two distinct complex roots")
    }
  }
