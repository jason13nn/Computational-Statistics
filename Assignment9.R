#Inverse Transform Method, Rejection Method, Mixtures
##Q1
#A
n <- 10000
sigma<-1
u<-runif(n)
x <- -(sqrt(-2*log(1-u)))
#B
m1 <- matrix(runif(10000000), nrow = 10000, ncol = 1000)
x <- sqrt(-log(m1))
mse <- mean(apply(x,2,var)) + (mean(apply(x,2,mean)-sqrt(pi/2)))^2

##Q2
#A
n <- 1
k <- 0
j <- 0
x <- numeric(n)
pi<-3.14159
c<-pi/4
f_cg=sqrt(1-x^2)

while(k < n){
  u <- runif(1)
  j <- j + 1
  y <- runif(1,min = -1, max = 1) # random variable from g
  if (sqrt(1-y^2) > u){
    k <- k + 1
    x[k] <- y
  }
}

#B
n <- 10000
k <- 0
j <- 0
x <- numeric(n)

while(k < n){
  u <- runif(1)
  j <- j + 1
  y <- runif(1,min = -1, max = 1) # random variable from g
  if (sqrt(1-y^2) > u){
    k <- k + 1
    x[k] <- y
  }
}

hist(x)

##Q3
#A
p1 <- 0.75
p2 <- 1 - p1
x1 <- rnorm(n,0,1)
x2 <- rnorm(n,3,1)
n <- 10000
k <- sample(c(1,1,1,0),n,replace = T)
x <- k*x1 + (1-k)*x2
hist(x)
#B
r <- 3
theta <- c(1:5)/15
x1 <- rgamma(n,r,1/1)
x2 <- rgamma(n,r,1/2)
x3 <- rgamma(n,r,1/3)
x4 <- rgamma(n,r,1/4)
x5 <- rgamma(n,r,1/5)
k <- sample(1:5,size=n,prob=theta,replace = TRUE)
x <- (k==1)*x1 + (k==2)*x2 +(k==3)*x3 + (k==4)*x4 + (k==5)*x5
#C
n <- 10000
r <- 4
beta <- 2
lambda <- rgamma(n,r,beta)
y <- exp(lambda)