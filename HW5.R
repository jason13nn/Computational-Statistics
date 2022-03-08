##Q1
#A
n<-1000
u<-runif(n)
c <- numeric(n)
for (i in 1:n){
  x<-u*log(u)
  y<-sqrt(1-(u)^2)
  c[i]<-cov(x,y)
}
C<-sum(c)/n

#B
m<-10000
u1<-runif(r)
u2<-runif(r)
s<-u1+u2

for(i in 1:m){
  n<-2
  N[i]<-n
  
  while(sum[i]<1){
    u<-runif(r)
    n<-n+1
    sum[i]=sum[i]+u[i]
    N[i]<-n
  }
}

E_N<-mean(N)
Var_N<-var(N)



##Q2
#A
n <- 10000
k <- 0      #counter for accepted
j <- 0      #iterations
x <- numeric(n)
p<-c(0.14,0.23,0.13,0.15,0.12,0.06,0.17)
qi<-1/7
c<-max(p)/qi

while (k < n) {
  u1 <-runif(1)
  u2 <- runif(1)
  j <- j + 1
  y <- as.integer(7*u1)+1  #random variate from g
  if (u2<y/c*qi) {
    #we accept x
    k <- k + 1
    x[k] <- y
  }
}
j
#B
x<-x-1
table(x)
#C
n*c
#16100