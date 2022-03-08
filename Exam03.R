library(shiny)
library(ggplot2)
library(dplyr)
library(leaflet)
library(leaflet.extras)
library(maps)
library(maptools)
library(sp)
library(rgeos)

#A. Read Data
countries<-read.csv("/Users/jason13nn/Desktop/SMU/Fall 2019/STAT 6324(R)/data/countries.csv")

#UI
ui<- shinyUI(
  fluidPage(
    theme = shinytheme("darkly"),
    titlePanel("Recommended Country to Travel"),
    
#B.Include 5 inputs 
    fluidRow(
      div(class="span4", radioButtons("Region","Region:", 
                                     c("All",unique(as.character(countries$Region))))),
      div(class="span4",selectInput("Goal","Type:", 
                                    c("All",unique(as.character(countries$Goal))))),
      div(class="span4",selectInput("Terrain","Terrain:", 
                                    c("All",unique(as.character(countries$Terrain))))),
      div(class="span4",selectInput("Safety","Safety (1-10):", 
                                    c("All",unique(as.character(countries$Safety))))),
      div(class="span4",sliderInput("CPI","Cost:",
                                    min = 0, max = 100, value = 80))
    ),
#C. Include 2 tabs
    mainPanel(
      tabsetPanel(
        tabPanel("Table",textOutput("text"),tableOutput("table")) ,
        tabPanel("Map",leafletOutput("map"))
      )
    ) 
  )
)

#Server
server<- shinyServer(function(input, output) {
  # Filter data based on selections
  filter1 <- reactive({
    data <- countries
    if (input$Region != "All"){
      data <- data[data$Region == input$Region,]
    }
    if (input$Goal != "All"){
      data <- data[data$Goal == input$Goal,]
    }
    if (input$Terrain != "All"){
      data <- data[data$Terrain == input$Terrain,]
    }
    if (input$Safety != "All"){
      data <- data[data$Safety >= input$Safety,]
    }
    if (input$CPI >= data$CPI){
      data <- data[data$CPI <= input$CPI,]
    }
    data
  }) 
  
  filter2 <- reactive({
    data <- countries
    if (input$Region != "All"){
      data <- data[data$Region == input$Region,]
    }
    if (input$Goal != "All"){
      data <- data[data$Goal == input$Goal,]
    }
    if (input$Terrain != "All"){
      data <- data[data$Terrain == input$Terrain,]
    }
    if (input$Safety != "All"){
      data <- data[data$Safety >= input$Safety,]
    }
    if (input$CPI >= data$CPI){
      data <- data[data$CPI <= input$CPI,]
    }
    data 
    #Make World Map
    world <- map("world", fill=TRUE, plot=FALSE)
    world_map <- map2SpatialPolygons(world, sub(":.*$", "", world$names))
    world_map <- SpatialPolygonsDataFrame(world_map,
                                          data.frame(country=names(world_map), 
                                                     stringsAsFactors=FALSE), 
                                          FALSE)
    target <- subset(world_map, country %in% data[,1])
    leaflet(target) %>%
      addTiles() %>%
      addPolygons(weight = 1)
  }) 
  

  #C. Include 3 outputs
  #text
  output$text <- renderText({ 
    "You have selected this:"
  })
  #table
  output$table <- renderTable({
    filter1()
  #plot
  })
  output$map<- renderLeaflet({
    filter2()
  })
  
})
shinyApp(ui = ui, server = server)

