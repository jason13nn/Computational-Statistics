#bootstrap t CI
##Q1
#A
n<-15
mu<-34
std<-5
x<-rnorm(n,mu,std)
ci<-c(mean(x)-qt(0.90,14)*sd(x)/sqrt(n), mean(x)+qt(0.90,14)*sd(x)/sqrt(n))
ci
#Ans: Yes. The actual mean inside the CI.

#B
rs<-100000
coverage<-numeric(rs)
underage<-numeric(rs)
overage<-numeric(rs)
for (i in 1:rs){
  lower<-mean(x)-qt(0.90,14)*sd(x)/sqrt(n)
  upper<-mean(x)+qt(0.90,14)*sd(x)/sqrt(n)
  
  if (mu> lower & mu<upper){
    coverage[i]<-1
  }else if (mu>upper){
    underage[i]<-1
  }else{
    overage[i]<-1
  }
}

percent_coverage<-sum(coverage)/rs
percent_underage<-sum(underage)/rs
percent_overage<-sum(overage)/rs