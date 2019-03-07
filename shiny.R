register_google(key = 'AIzaSyAzCWRarLpXhmd9Dx05XgXsdZetHXCVAog')
library(shiny)
library("dplyr")
library("ggmap")
library("maptools")
library(maps)
library(ggplot2)


ui <- fluidPage(
  titlePanel("Map"), 
  sidebarPanel(
    selectInput("variable", "Compare Maps:", 
                c("CDC" = "activity", "Twitter" = "freq"))),
  mainPanel(
    imageOutput("image1")
  )
)
  



server <- function(input,output){
  mapTitle <- reactive(input$variable)
  output$caption <- renderText({mapTitle()})
  #replace src on the next line for different files
  output$image1 <-renderImage(list(src="usData.png",contentType="image/png"),deleteFile = FALSE)
}
shinyApp(ui,server)