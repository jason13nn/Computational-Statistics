##Q1
#A
pnorm(70,85,3.5)
#B
1-pnorm(90,85,3.5)
#or pnorm(90,85,3.5,lower.tail=FALSE)
#C
qnorm(0.95,85,3.5)
##Q2
#A
mymat<-matrix(nrow=10,ncol=15)
#B
for(i in 1:10){
  for(j in 1:15){
    mymat[i,j]=i*j
  }
}
mymat[1:10,1:15]
##Q3
#A
score<-0
if (score>=93){
  print("A")
}else if (score>=90){
  print("A-")
}else if (score>=87){
  print("B+")
}else if (score>=83){
  print("B")
}else if (score>=80){
  print("B-")
}else if (score>=77){
  print("C+")
}else if (score>=73){
  print("C")
}else if (score>=70){
  print("C-")
}else if (score>=67){
  print("D+")
}else if (score>=63){
  print("D")
}else if (score>=60){
  print("D-")
}else{
  print("F")
}
#B
x<-rnorm(50,82,4)
y<-as.vector(x)
#C
i <- 1
for (i in 1:50){
  score <- x[i]
  if (score >= 93 & score<=100) {
    Grade <- "A"
  } else if (score >= 90){
    Grade <- "A-"
  } else if (score >= 87){
    Grade <- "B+"
  } else if (score >= 83){
    Grade <- "B"
  }else if (score >= 80){
    Grade <- "B-"
  }else if (score >= 77){
    Grade <- "C+"
  }else if (score >= 73){
    Grade <- "C"
  }else if (score >= 70){
    Grade <- "C-"
  }else if (score >= 67){
    Grade <- "D+"
  }else if (score >= 63){
    Grade <- "D"
  }else if (score >= 60){
    Grade <- "D-"
  }else {
    Grade <- "F"
  }
  y[i] = Grade
  print(y)
}
#D
x_y<-data.frame(x,y)
