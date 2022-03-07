
library(shiny)
library(shinythemes)
##Q1
#A. Include a slide bar to select the sample size from 1 to 1000 with default value of 100
ui<-fluidPage(
  themeSelector(),
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("no_data",label = "Number of data",
                  min = 0,
                  max = 1000,
                  value = 50),
      numericInput("mean", label = "Mean",
                   value = 3),
      numericInput("sd",label = "SD",
                   min = 0,
                   value = 3)),
    mainPanel(
    plotOutput("histogram")
    )
  )
)
server<-function(input,output){
  
  output$histogram<-renderPlot({
    hist(rnorm(input$no_data, mean = input$mean, sd = input$sd),
         main = "Histogram", xlab = "Sample data")
  })
}

shinyApp(ui=ui, server = server)
#B. Include a numeric input to specify the mean of the normal distribution.


#C. Include a numeric input to specify the sd of the normal distribution. (Make sure to set up the minimum)


#D. Generate random numbers from the specified normal distribution and draw a histogram. Display the histogram in your app.


#E. Use side bar layout to display a-c in the sidebar panel and histogram in the main panel.


#F. Add the themeselector() to select a theme.

