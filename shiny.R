
library(shiny)
library("dplyr")
library("ggmap")
library("maptools")
library(maps)
library(ggplot2)
register_google(key = 'AIzaSyAzCWRarLpXhmd9Dx05XgXsdZetHXCVAog')

ui <- fluidPage(
  titlePanel("Map"), 
  sidebarPanel(
    selectInput("variable", "Compare Maps:", 
                c("CDC", "Twitter"))),
  mainPanel(
    imageOutput("image1"),
    imageOutput("image2")
  )
)
  

server <- function(input,output){
  mapTitle <- reactive(input$variable)
  output$caption <- renderText({mapTitle()})
  #replace src on the next line for different files
  output$image1 <-renderImage(list(src="usData.png",contentType="image/png"),deleteFile = FALSE)
  output$image2 <- renderImage({
    if (input$variable == "CDC") {
      return(list(
        src = "problem6Plot2.png",
        contentType = "image/png"
      ))
    } else if (input$variable == "Twitter") {
      return(list(
        src = "usData.png",
        filetype = "image/png"
      ))
    }
    
  }, deleteFile = FALSE)
}
shinyApp(ui,server)