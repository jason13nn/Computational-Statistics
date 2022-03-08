##Q1
prime<-function(n){
  if (n==1){
    print("Error in prime(1) : Input value of n should be at least 2.")
  }else{
    prime = 0:n
    for(val in prime){
      if (val == 0){
        next
      } else if (val == 1){
        next
      } else if(val == 2){
        val = 2
      } else if (val %% 2 == 0){
        next
      } else if (val == 3){
        val = 3
      } else if (val %% 3 == 0){
        next
      } else if (val == 5){
        val = 5
      } else if (val %% 5 == 0){
        next
      }
      print(val)
    }
  }
}
prime(1)
prime(20)
prime(60)
##Q2
#A
double_sum_a<-function(n){
  ans=0
  if  (n<1){
    print("Error. n must be positive.")
  }else{
    for(r in 1:n){
      for(s in 1:r){
        ans=ans+(s^2/(13+7*r^3))
      }
    }
    return(ans)
  }
}
#B
double_sum_b<-function(r){
  if  (r<1){
    print("Error. r must be positive.")
  }else{
    sum(sapply(1:r, function(i) (i^2 / (13+7*r^3))))
  }
}
#C
double_sum_c<-function(n){
 if  (n<1){
   print("Error. n must be positive.")
 } else{
   c<-col(matrix(0,n,n))
   c[upper.tri(c)]<-0
   r<-row(matrix(0,n,n))
   r[upper.tri(r)]<-0
   ans<-c^2/(13+7*r^3)
   return(sum(ans))
 }
}
##double_sum_c<-function(n){
## mat<-matrix(0,n,n)
## sum(col(amt)^2/(13+7*row(mat)^3(col(mat)<=row(mat))))
#D
double_sum_d<-function(n){
  if  (n<1){
    print("Error. n must be positive.")
  } else{
    r<-1:n
    s<-1:n
    mat<-outer(r,s,function(r,s) s^2/(13+7*r^3))
    return(mat)
  }
}
