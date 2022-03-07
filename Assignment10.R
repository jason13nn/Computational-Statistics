###Monte Carlo Estimate
##Q1
b<-4
a<-2
n<-10000
x<-runif(n,a,b)
g1<-exp(-x)
theta.hat<-(b-a)*mean(g1)
#estimated
theta.hat
#real
exp(-2)-exp(-4)

##Q2
#A
m<-10000
x<-runif(m)
g<-(exp(-x))/(1+x^2)


m1<-matrix(runif(30000000),nrow = 10000,ncol = 3000)
g<-(exp(-m1))/(1+m1^2)
var1<-var(apply(g,2,mean))
var1
#B
m<-10000
u<-runif(m/2)
g1<-(exp(-u))/(1+u^2)
g2<-(exp(1-u))/(1+(1-u)^2)
g<-c(g1,g2)
theta.hat3<-mean(g)
theta.hat3

m2<-matrix(runif(15000000),nrow = 5000,ncol = 3000)
m4<-rbind(m2,1-m2)
g<-(exp(-m4))/(1+(m4^2))
var2<-var(apply(g,2,mean))
var2
#C
percentreduction<-((var1-var2)/var1)*100
round(rbind(var1,var2,percentreduction),8)
#D
M<-10000
k<-10
r<-M/k
N<-3000
T2<-numeric(k)
estimates<-matrix(0,N,2)

g<-function(x){
  exp(-x-log(1+x^2))*(x>0)*(x<1)
}
for(i in 1:N){
  estimates[i,1]<-mean(g(runif(M)))
  for (j in 1:k)
    T2[j]<-mean(g(runif(M/k,(j-1)/k,j/k)))
  estimates[i,2]<-mean(T2)
}
apply(estimates, 2, mean)
var_str<-apply(estimates, 2, var)
#E
percentreduction<-((var_str[1]-var_str[2])/var_str[1])*100
round(rbind(var_str[1],var_str[2],percentreduction),8)
