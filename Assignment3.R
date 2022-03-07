##Q1
#a
install.packages("swirl")
#b
library(swirl)
swirl()
#c
data(cars)
?cars
head(cars)
plot(cars)
?plot
plot(cars$speed,cars$dist)
plot(cars$dist,cars$speed)
plot(x = cars$speed, y = cars$dist, xlab = "Speed")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")
plot(x = cars$speed, y = cars$dist,xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle")
plot(cars, col=2)
plot(cars, xlim = c(10, 15))
plot(cars, pch=2)
data(mtcars)
?boxplot
boxplot(formula = mpg ~ cyl, data = mtcars)
hist(mtcars$mpg)
##Q2
x<-seq(0,30,length=10)
y<-rep(1/30,10)
plot(x,y,type="l",lwd=3,xlim = c(0,30),ylim = c(0,0.035),
     main = "Uniform distribution(0,30)",sub = "lwd=3,shaded color=grey40,text at(23,0.025),cex=1.2",
     )
text(23, 0.025, "Shade Area= Pr(5<X<15)",cex = 1.2)
x_cor<-c(5,5,15,15)
y_cor<-c(0,1/30,1/30,0)
polygon(x_cor,y_cor,col = "grey40")
##Q3
help(plotmath)
x<-seq(0,1,length=10)
y<-2*x
plot(x,y,type="l",lwd=2,ylab = "f(x)",
     main = "Probability Density Function f(x)=2x, 0<x<1")
text(0.2,1.5,expression({integral(2*x*dx, 0, 0.5)==group("[",x^2,"]")[0]^(1/2)}==frac(1,4)))
x_cor<-c(0.5,0.5,0)
y_cor<-c(0,1,0)
polygon(x_cor,y_cor,col='green')
arrows(0.2,1.4,0.3,0.2,lwd=2,col="red")
