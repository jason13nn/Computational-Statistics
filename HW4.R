#Q2
n<-10000
m<-10
mat<-matrix(ncol=m,nrow=n)
X<-rnorm(n,75,sqrt(8))
for(r.sample in 1:m){
  #for each sample sample n times
  for(i in 1:n) {
    mat[i,r.sample]=sample(X,1)
  }
}

head(mat)

#Does the observations fall within CI
is_ci<-function(x1,x2){
  if (mat[x1,x2]>=(mean(mat[,x2])-1.96*sqrt(8)) & mat[x1,x2]<=(mean(mat[,x2])+1.96*sqrt(8))){
    return(1)
  }else{
    return(0)
  }
}
p<-sapply(mat,is_ci)
#sample proportion
table(p)
#empirical coverage rate
empirical_coverage_rate <- sum(p)/(n*m)

