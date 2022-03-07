##1
#a
data<-read.csv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/inspections.csv")
#b
dim(data)
#145606 observations
#c
as.character(data$Inspection.ID)
#d
summary(data$Risk)
#e
install.packages("readr")
library(readr)
data1<-read_csv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/inspections.csv")
head(data1)
#f
install.packages("dplyr")
library(dplyr)
iris_mutated<-filter(data,Results=="Pass")
iris2<-select(-Result)
#g
iris_rearrange<-arrange(data,Inspection.ID)
iris_rearrange
##2
#a
data_2<-read.delim("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/inpatient.tsv")
head(data_2)
#b
dim(data_2)
#163065 observations
#c
Average.Covered.Charges<-as.numeric(data_2$Average.Covered.Charges)
Average.Total.Payments<-as.numeric(data_2$Average.Total.Payments)
Average.Medicare.Payments<-as.numeric(data_2$Average.Medicare.Payments)
summary(Average.Covered.Charges)
summary(Average.Total.Payments)
summary(Average.Medicare.Payments)
#d
data_2<-mutate(data_2,tot_payments=as.numeric(data_2$Average.Covered.Charges)+as.numeric(data_2$Average.Total.Payments)+as.numeric(data_2$Average.Medicare.Payments))
#e
data_2_new<-select(data_2,Provider.Id,Total.Discharges,tot_payments)
head(data_2_new)
#f
library(readr)
data_2<-read_tsv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/inpatient.tsv")
head(data_2)
