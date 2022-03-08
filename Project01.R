#To download data.table package
install.packages("data.table")
library(data.table)
#Constructing data.table
ex.DT<-data.table(
  Name=c("Allen","Bob","Chris","Daniel"),
  Score1=c(88,32,67,54),
  Score2=c(78,68,54,90),
  Score3=c(91,79,70,77)
)
ex.DT

#read data
data<-read.csv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/college.csv")
#variables names
names(data)[1:9]

head(data)

#Mean tuition in Texas
mean(data[data$state=='TX','tuition'])

#Using data.table
DT<-as.data.table(data) #convert into data.table
DT[state=='TX',mean(tuition)]

#data.table multi-column means and renamed variable
DT[state=='TX',
   list(mean_tuition=mean(tuition),
   mean_faculty_salary=mean(faculty_salary_avg),
   mean_students=mean(undergrads))]

#Find mean tution for each state
DT[,list(mean_tuition=mean(tuition)),by=state]

#Line combination with aggregations
DT.plot<-DT[,plot(sort(tuition))]

#Insert a new column
DT[,area :=paste0(city,state)]
head(DT[,area])

#Fast row retrieval
setkey(DT,state) #sort observations
DT['TX',name]

#Column access
DT[,1,with=FALSE]

?data.table()
