##Q1
#A
base10to7<-function(x){
  i=0
  sum=0
  while(x%/%7 !=0){
    sum=sum+((x%%7)*(10^i))
    i=i+1
    x=x%/%7
  }
  sum+((x%%7)*(10^i))
}

base10to7(100)
#B
base_7<- function(n){
  x<-numeric(n)
  for (i in 0:(n-1)) {
    x[i+1]<-base10to7(i)
  }
  x
}

base_7(10)
#C
base7to10<-function(x){
  i=0
  sum=0
  while(x%/%10 !=0){
    sum=sum+((x%%10)*(7^i))
    i=i+1
    x=x%/%10
  }
  sum+((x%%10)*(7^i))
}

base7to10(202)
#D
base10tok<-function(x,k){
  i=0
  sum=0
  while(x%/%k !=0){
    sum=sum+((x%%k)*(10^i))
    i=i+1
    x=x%/%k
  }
  sum+((x%%k)*(10^i))
}
base10tok(10,2)
###
base_k<- function(n,k){
  x<-numeric(n)
  for (i in 0:(n-1)) {
    x[i+1]<-base10tok(i,k)
  }
  x
}
base_k(100,5)
###
basekto10<-function(x,k){
  i=0
  sum=0
  while(x%/%10 !=0){
    sum=sum+((x%%10)*(k^i))
    i=i+1
    x=x%/%10
  }
  sum+((x%%10)*(k^i))
}

basekto10(202,3)