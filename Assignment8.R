###Inverse Transform Method
##Q1
#A
n<-10000
u<-runif(n)
sigma<-1
x<-sigma*sqrt(-2*log(u))
#B
hist(x,prob=T,br=20,main = "Rayleigh distribution")
y<-seq(0,10,0.01)
lines(y,(y/sigma^2)*exp(-y^2/2*sigma^2))
#C
pi<-3.14159
theoretical.mean<-sigma*sqrt(pi/2)
theoretical.mean
sample.mean<-sum(x)/n
sample.mean
##Q2
#A#B
n<-10000
u<-runif(n)
yy<-cut(u,c(0,0.1,0.3,0.5,0.7,1),labels = c("0","1","2","3","4"))
table(yy)/n
#The numbers are very close between empirical and theoretical probabilities.
#C
sample<-sample(u,n,replace = FALSE, prob = NULL)
q3<-cut(sample,c(0,0.1,0.3,0.5,0.7,1),labels = c("0","1","2","3","4"))
table(q3)/n
