library(ggplot2)
# 3 required components: data,aes,geom
View(mtcars)
mtcars$am<-as.factor(mtcars$am)
mtcars$gear<-as.factor(mtcars$gear)
mtcars$cyl<-as.factor(mtcars$cyl)
str(mtcars)
#bar 
ggplot(mtcars,mapping = aes(x=gear))+
  geom_bar(fill="green3",color="black")
#scatterplot
ggplot(mtcars)+
  geom_point(mapping = aes(x=hp,y=mpg,color=cyl,shape=cyl))
#line plot
ggplot(mtcars)+
  geom_line(mapping = aes(x=hp,y=mpg))+
  geom_point(mapping = aes(x=hp,y=mpg))
#or
ggplot(mtcars)+
  geom_point(mapping = aes(x=hp,y=mpg))+
  geom_smooth(mapping = aes(x=hp,y=mpg),se=FALSE)
#histogram
ggplot(mtcars)+
  geom_histogram(mapping = aes(x=mpg,y=..density..),binwidth = 5)
#boxplot
ggplot(mtcars)+
  geom_boxplot(mapping = aes(x=cyl,y=mpg,fill=cyl))
#facet
ggplot(mtcars)+
  geom_point(mapping = aes(x=hp,y=mpg))+
  facet_wrap(~cyl)
#theme
#plot.background
ggplot(mtcars)+
  geom_bar(mapping = aes(x=gear))+
  theme(plot.background = element_rect(fill="red"))
#panel.background
ggplot(mtcars)+
  geom_bar(mapping = aes(x=gear),fill="orange")+
  theme(panel.background = element_rect(fill="green"))
#delete all the backgrounds
theme(panel.background = element_blank())
theme(plot.background = element_blank())
#add major grid lines
ggplot(mtcars)+
  geom_bar(mapping = aes(x=gear))+
  theme(panel.background = element_blank())+
  theme(plot.background = element_blank())+
  theme(panel.grid.major = element_line(color = "grey"))
#only for one axis
ggplot(mtcars)+
  geom_bar(mapping = aes(x=gear))+
  theme(panel.background = element_blank())+
  theme(plot.background = element_blank())+
  theme(panel.grid.major.y = element_line(color = "grey"))
#annotation
annotate()
geom_text()
