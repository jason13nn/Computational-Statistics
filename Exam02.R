##Q1
#A
n<-10000
u<-runif(n)
yy<-cut(u,c(0,0.25,0.45,0.80,1),labels = c("0","1","2","3"))

#B
table(yy)/n
#The numbers are very close between empirical and theoretical probabilities.

#C
#x<-sample(c(0,1,2,3),size=n,replace=TRUE,prob=c(0,0.25,0.45,0.80))
#table(x)/n
sample<-sample(u,n,replace = FALSE, prob = NULL) 
q3<-cut(sample,c(0,0.25,0.45,0.80,1),labels = c("0","1","2","3"))
table(q3)/n

##Q2

x1<-0
x2<-2
y1<-0
y2<-1
n<-10000
x<-runif(n,x1,x2)
y<-runif(n,y1,y2)
g1<-exp((x+y)^2)
theta.hat<-2*sum(g1)/n
#estimated
theta.hat

##Q3

data<-c(456,345,324,786,456,568,675,498,556,656,390,546,556,771,508,230,412,327,510,800)
n <- length(data)
xbar <- mean(x)

m <- 50000
bootstat <- numeric(m)
for (i in 1:m){
  bootsamp <- sample(x, size = n, replace = TRUE)
  bootstat[i] <- mean(bootsamp)
}

#A
#sampling distribution of sample mean
hist(bootstat)
abline(v = mean(bootstat),lty=2, col='red', lwd=2)

#B
## Estimating the bias of the mean estimate
est.bias <- mean(bootstat) - xbar
est.bias

se <- sd(bootstat)
se

mse <- var(bootstat) + est.bias^2
mse

#C
#quantile(bootstat,c(0.05,0.95)) 
quantile(mse,c(0.05,0.95)) 

##Q4

n<-15
alpha <- .05
mu0 <- 33
sigma <- 3
m <- 10000          #number of replicates
p <- numeric(m)     #storage for p-values

for (j in 1:m) {
  x <- rnorm(n, mu0, sigma)
  ttest <- t.test(x, alternative = "greater", mu = 30)
  p[j] <- ttest$p.value
}

p.hat <- mean(p < alpha)
p.hat

#A
mu0_new<-33
for (j in 1:m) {
  x <- rnorm(n, mu0, sigma)
  ttest <- t.test(x, alternative = "greater", mu = mu0_new)
  p[j] <- ttest$p.value
}

p.hat <- mean(p < alpha)
p.hat

#B
s<-seq(30.1,34,0.25)
s<-as.array(s)

mu_f<-function(m){
  for (j in 1:m) {
    x <- rnorm(n, mu0, sigma)
    ttest <- t.test(x, alternative = "greater", mu = m)
    p[j] <- ttest$p.value
  }
  
  p.hat <- mean(p < alpha)
  p.hat
}

apply(s,1,mu_f)
