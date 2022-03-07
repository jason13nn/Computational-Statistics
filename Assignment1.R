##Q1
#Part a
log10(100)
#Part b
#my default base for the log function is 10, below is the log function for log2
log2(100)
#Part c
log10(-100) #the domain of log function is (0,+∞),so the answer doesn't exist 
#Part d
sqrt(9)
##Q2
#Part a #Part b #Part c
A<-matrix(c(60,72,57,90,95,72,1.80,1.85,1.72,1.90,1.74,1.91),nrow = 6,ncol = 2)
A
#Part d
BMI<-(A[,1]/(A[,2]**2))
BMI
60/1.8**2
#Part e
mean_weight<-mean(A[,1])
mean_weight
#Part f
sub<-mean_weight-A[,1]
sub
##Q3
#Part a
num<-seq(from = 1, to= 1000,by=5)
num
#Part b
num1<-seq(-5,10,length.out = 16)
num1
#Part c
# length.out defines the length of the sequence, not the interval.
##Q4
#Part 1
kids<-matrix(c(78,91,81,94,68,90,86,93,73,61,78,81,92,93,83,93,89,92), nrow= 6, ncol = 3,
              dimnames=list(c("Nathan","Keny","Claire","Julia","Nick","Ravi"),c("Exam01","Exam02","Exam03")))
kids
#Part2
mean_exam<-rowMeans(kids)
mean_exam
##Q5
A<-matrix(c(3,4,-1,1,2,1,1,1,3),3,3,byrow = T)
b<-matrix(c(7,13,17))
solve(A,b)
##Q6
SBP<-c(120,130,140,120,125)
DBP<-c(80,70,100,80,80)
GENDER<-c("M","F","M","F","F")
WT<-c(115,180,170,150,110)
OWE<-c(5431.00,12122.00,7550.00,4523.20,1000.99)
Q6<-data.frame(SBP,DBP,GENDER,WT,OWE)
Q6