
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
                c("CDC vs #flu & #fluszn"= "all", "CDC vs #flu" = "flu", "CDC vs #fluszn"= "fluszn"))),
  mainPanel(
    textOutput("caption"),
    imageOutput("image1"),
    imageOutput("image2")
  )
)
  

server <- function(input,output){
  output$image1 <-renderImage(list(src="usData.png",contentType="image/png"),deleteFile = FALSE)
  output$image2 <- renderImage({
    if (input$variable == "all") {
      return(list(
        src = "problem6Plot2.png",
        fileType = "image/png"
      ))
    } else if (input$variable == "flu") {
      return(list(
        src = "usData.png",
        filetype = "image/png"
      ))
    } else if (input$variable == "problem6Plot1.png") {
      return(list(
        src = "problem6Plot1.png",
        filetype = "image/png"
      ))
    }
    
  }, deleteFile = FALSE)
  output$caption <- renderText(
    if (input$variable == "all") {"all"
    } else if (input$variable == "flu") {"flu"
    } else if (input$variable == "problem6Plot1.png") {"fluszn"
    }
  )
}
shinyApp(ui,server)