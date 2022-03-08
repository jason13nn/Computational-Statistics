##Q1
#a
seq(19, 41,by=2)
#b
rep(seq(1,7,by=2),seq(1,7,by=2))
#c
matrix(c(3,1,7,1,0,4,5,1,5),nrow = 3,ncol = 3)
#d
matrix(c(92,91,91,74,88,96,63,93,81,87),  ncol = 2,nrow= 5, 
       dimnames=list(c(1:5), c("HW1","HW2")))
#e
Name<-c("Ali","Judith","Sam")
Gender<-c("M","F","M")
Age<-c(23,22,25)
data.frame(Name,Gender,Age)
##Q2
library(ggplot2)
data<-diamonds
head(data)
?diamonds
#a
ggplot(data)+
  geom_bar(mapping = aes(x=cut,fill=cut))
#b
ggplot(data)+
  geom_bar(mapping = aes(x=cut,fill=clarity))
#c
ggplot(data)+
  geom_histogram(mapping = aes(x=price))
##Q3
head(CO2)
#a
summary(CO2)
#3 categorical variables and 2 quantitative variables
##b
ggplot(CO2)+
  geom_point(aes(x=Treatment,y=uptake,shape=Treatment))
#c
ggplot(CO2)+
  geom_boxplot(mapping = aes(x=Plant,y=uptake))
#d
summary(CO2$conc)
summary(CO2$uptake)
##e
library(dplyr)
CO2.high<-data.frame(arrange(CO2,conc,uptake))
##Q4
set.seed(63242019)
len<-sample(200:250,1)
xVec<-sample(0:999,len,replace=T)
yVec<-sample(0:999,len,replace=F)
n<-length(xVec)
#a
for (i in 1:n) {
  diff_1<-yVec[i+1]-xVec[i]
}
a[i]=diff_1
print(a)
#b
for (i in 1:n) {
  diff_2<-(sin(yVec[i])/cos(xVec[i+1]))
}
b[i]=diff_2
print(b)
#c
for (i in 1:n) {
  diff_3<-xVec[i]+2*xVec[i+1]-xVec[i+2]
}
c[i]=diff_3
print(c)
#d
for (i in 2:n) {
  add<-sum(exp(-xVec[i-1])/(xVec[i]+10))
}
d[i]=add
print(d)
#e
for (i in 1:n) {
  sum=0
  while(xVec[i]%/%2=0){
    sum=sum+1
  }
  print(sum)
}
##Q5
data<-data.frame(n=1:10000,number=rnorm(10000,79,5))
mean_Q5<-mean(data$number)
mean_Q5
sd_Q5<-sd(data$number)
sd_Q5
ggplot(data)+
  geom_histogram(mapping = aes(x=number))+
  geom_vline(xintercept = 79)+
  geom_vline(xintercept = 79.00741)
##Q6
#a
change15<-function(x){
  i=0
  Nickel=0
  while(x%/%5 !=0){
    Nickel=Nickel+((x%%5)*(10^i))
    i=i+1
    x=x%/%5
  }
  Nickel+((x%%5)*(10^i))
  penny<-x-(5*Nickel)
  print(penny)
  print(Nickel)
}
#b
change<-function(x){
  i=0
  dollar=0
  while(x%/%100 !=0){
    dollar=dollar+((x%%100)*(10^i))
    i=i+1
    x=x%/%100
  }
  dollar+((x%%100)*(10^i))
  Quarter=(x-100*dollar)
  if(Quarter<0){
    Quarter==0
  }else{
    print(Quarter)
  }
  Dime=(x-100*dollar-25*Quarter)
  if(Dime<0){
    Dime==0
  }else{
    print(Dime)
  }
  Nickel=(x-100*dollar-25*Quarter-10*Dime)
  if(Nickel<0){
    Nickel==0
  }else{
    print(Nickel)
  }
  penny=(x-100*dollar-25*Quarter-10*Dime-5*penny)
  if(penny<0){
   penny==0
  }else{
    print(penny)
  }
}