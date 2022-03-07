library(ggplot2)
##Q1
#A#B
data<-read.csv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/college.csv")
View(data)
##Q2
#A
ggplot(data)+
  geom_point(aes(x=data$tuition,y=data$sat_avg))
#B
ggplot(data)+
  geom_point(aes(x=data$tuition,y=data$sat_avg))+
  ggtitle("Main Title")+
  xlab("X")+
  ylab("Y")
#C
data$control<-as.factor(data$control)
#D
ggplot(data)+
  geom_point(aes(x=data$tuition,y=data$sat_avg,shape=data$control))
#E
ggplot(data)+
  geom_point(aes(x=data$tuition,y=data$sat_avg,color=data$control))
#F
ggplot(data)+
  geom_point(aes(x=data$tuition,y=data$sat_avg,size=data$undergrads,alpha=data$control))
##Q3
#A
ggplot(data)+
  geom_bar(mapping = aes(x=data$region))
#B
ggplot(data)+
  geom_bar(mapping = aes(x=region,fill=control))
#C
ggplot(data)+
  geom_bar(mapping = aes(x=data$region,fill=control))+
  theme(panel.background = element_blank())+
  theme(plot.background = element_blank())+
  scale_x_discrete(name="region")+
  scale_y_continuous(name = "Number of Schools",limits = c(0,500))+
  scale_fill_manual(values = c("red","blue"))
#D
ggplot(data)+
  geom_bar(mapping = aes(x=data$region,fill=control))+
  theme(panel.background = element_blank())+
  theme(plot.background = element_blank())+
  scale_x_discrete(name="region")+
  scale_y_continuous(name = "Number of Schools",limits = c(0,500))+
  scale_fill_manual(values = c("red","blue"))+
  labs(fill="Institution type")
#E
ggplot(data)+
  geom_bar(mapping = aes(x=data$region,fill=control))+
  theme(panel.background = element_blank())+
  theme(plot.background = element_blank())+
  scale_x_discrete(name="region")+
  scale_y_continuous(name = "Number of Schools",limits = c(0,500))+
  scale_fill_manual(values = c("red","blue"))+
  labs(fill="Institution type")+
  theme(legend.position = "bottom")
##Q4
#A
ggplot(data)+
  geom_histogram(mapping = aes(x=undergrads))
#B
ggplot(data)+
  geom_histogram(mapping = aes(x=undergrads),binwidth = 1000)
#C
ggplot(data)+
  geom_histogram(mapping = aes(x=undergrads,y=..density..),binwidth = 1000)
#Q5
#A
ggplot(data)+
  geom_boxplot(mapping = aes(x=control,y=tuition))
#B
ggplot(data)+
  geom_boxplot(mapping = aes(x=control,y=tuition,fill=region))
#C
ggplot(data)+
  geom_boxplot(mapping = aes(x=region,y=tuition,fill=control))