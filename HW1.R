##1
#a
c(seq(1,8),seq(7,1))
#b
rep(1:5,1:5)
#c
rep(seq(1,11,by = 2),rep(c(3,1),3))
#d
rep(seq(20,4,by=-4),1:5)
#e
0.1^(3*1:13)*0.2^(3*1:13-2)
#f
matrix(c(0,1,1,1,0,1,1,1,0),nrow = 3,ncol = 3)
#g
matrix(c(0,0,7,2,5,0,3,0,0),nrow = 3,ncol = 3)
#h
matrix(c(1,2,3,4,5,2,1,2,3,4,3,2,1,2,3,4,3,2,1,2,5,4,3,2,1),nrow = 5,ncol = 5)
##2
install.packages("swirl")
library(swirl)
swirl()
#module 10
lapply(unique_vals, function(elem) elem[2])
#module 11
tapply(flags$population, flags$landmass, summary)
##3
#a
auto.stats<-read.csv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/autostat.csv",header = T,row.names = 1)
#b
auto.stats_num<- sapply(auto.stats,is.numeric)
b3<-apply(auto.stats[,auto.stats_num], 2, na.rm=TRUE,max)
#c
c3<-sapply(auto.stats[,auto.stats_num],mean,na.rm=TRUE)
#d
cargrp<-cut(auto.stats[,8], c(0, 2500, 3500, 5000), labels = c("Small","Medium", "Large"))
d3<-tapply(auto.stats[,2],cargrp,median,na.rm=TRUE)
#e
repair.rating <- auto.stats[,3]
repair.rating[is.na(repair.rating)] <- '<NA>'
e3 <- tapply(auto.stats[,2],list(cargrp,repair.rating),mean)
e3 <- data.frame(e3)
e3 <- dplyr::select(e3,X1,X2,X3,X4,X5,X.NA.)
names(e3) <- c(1,2,3,4,5,'<NA>')
##4
library(MASS)
r<-cbind(Treatment = unstack(Rabbit, Treatment ~ Animal)[,1],
      Dose = unstack(Rabbit, Dose ~ Animal)[,1],
      unstack(Rabbit, BPchange ~ Animal))
Rabbit.ex<-data.frame(r)
##5
xx <- rep(1:10, 10)
yy <- rep(1:10, rep(10,10)) 
plot(xx, yy, bty="n",pch=15, cex=5, col = colors()[1:100], 
     xlim =   c(0,11),ylim =  c(0,11),
     ylab=" ", xlab=" ",
     main = "Display the first 100 colors in colors()",
     sub="This is a subtitle. Use cex = 1.2 for the numbers",
     fin=500
     )
mtext("This is mtext at side 1, line = −1. Use pch = 15, cex = 5",side = 1,line = -1)
axis <- seq(0,11,1)
axis(1, at = axis, labels = axis)
axis(2, at = axis, labels = axis)
text(xx,yy,cex=1.2)     
