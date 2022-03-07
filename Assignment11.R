###Boostrap Method
##Q1
library(bootstrap)
#A
x <- runif(25,10,20)
n <- length(x)
xbar <- mean(x)

## bootstrap samples
m <- 10000
bootstat <- numeric(m)
for (i in 1:m){
  bootsamp <- sample(x, size = n, replace = TRUE)
  bootstat[i] <- mean(bootsamp)
}

#sampling distribution of sample means
hist(bootstat)
abline(v = mean(bootstat),lty=2, col='red', lwd=2)

## Estimating the bias of the mean estimate
est.bias <- mean(bootstat) - xbar
est.bias

se <- sd(bootstat)
se

mse <- var(bootstat) + est.bias^2
mse

#B
x <- c(23,34,32,34,45,43,29,30,32,34,32,23,23,34,45,43,41,40,37,36)
n <- length(x)
xbar <- median(x)

## bootstrap samples
m <- 1000
bootstat <- numeric(m)
for (i in 1:m){
  bootsamp <- sample(x, size = n, replace = TRUE)
  bootstat[i] <- median(bootsamp)
}

#sampling distribution of sample medians
hist(bootstat)
abline(v = median(bootstat),lty=2, col='red', lwd=2)

## Estimating the bias of the median estimate
est.bias <- median(bootstat) - xbar
est.bias

se <- sd(bootstat)
se

mse <- var(bootstat) + est.bias^2
mse

##Q2
library(boot)

#set up the bootstrap
B <- 10000            #number of replicates
n <- nrow(patch)      #sample size
bootstat <- numeric(B)     #storage for replicates

#A
### Bootstrap estimate of bias
head(patch)
theta.hat<-mean(patch$y)/mean(patch$z)
#(mean(patch$newpatch)-mean(patch$oldpatch))/(mean(patch$oldpatch)-mean(patch$placebo))
bias_est <- mean(bootstat) - theta.hat
bias_est

#standard error of the ratio statistc
for (b in 1:B) {
  #randomly select the indices
  i <- sample(1:n, size = n, replace = TRUE)
  y <- patch$y[i]       #i is a vector of indices
  z <- patch$z[i]
  bootstat[b] <- mean(y)/mean(z)
}

#output
hist(bootstat, prob = TRUE)

se <- sd(bootstat)
se

#B
#sampling distribution of ratio statistic
hist(bootstat)
abline(v = mean(bootstat),lty=2, col='red', lwd=2)

#C
### Bootstrap estimate of standard error: boot function

r <- function(x, i) {
  #want correlation of columns 1 and 2
  cor(x[i,6], x[i,5])
}

library(boot)       #for boot function
obj <- boot(data = patch, statistic = r, R = 10000)
obj
y <- obj$t
sd(y)

#D
### boot package to calculate CI
boot.ci(obj, conf=0.90, type = c("norm","perc","bca"))
