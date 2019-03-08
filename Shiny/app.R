library(shiny)

ui <- fluidPage(theme = "bootstrap.css",
  titlePanel("Map"),
  fluidRow(class = "Row1", 
           column(6,wellPanel(
             selectInput("var", label="Select a map to compare:",
                         choices = c("CDC vs Twitter" = "Main", "CDC vs Keyword"="Second"))
           #  ,fluidRow(column(12, textOutput("description")))
           )),
           column(6,imageOutput("CDC"))),
  fluidRow(class = "Row2",
           # Add text
           column(6, textOutput("description")),
           column(6,imageOutput("image1")))
  , tags$head(tags$style("
                         .Row1{height:200px;}
                         .Row2{height:350px;background-color: cornsilk;}"
  )
  )
)

server <- function(input,output){
    output$CDC <- renderImage({ list(src="CDC.png", width =650, height =400, fileType = "image/png")},deleteFile = FALSE)
    output$image1 <- renderImage({
      if (input$var == "Main"){
        list(src="MainMap.png", width = 650, height = 400, fileType="image/png")
      }else if (input$var == "Second"){
        list(src="Keywords.png", width = 650, height = 400, fileType="image/png")
      }
      
    }, deleteFile=FALSE)
    output$description <- renderText(
      if (input$var == "Main"){
        "Based on the collection of tweets compared with the map from CDC, we can see that we had a large amount of tweets\n coming from Texas."
      }else if (input$var == "Second"){
        "The key word we used to collect tweets was Flu and FluSeason. Majority of the tweets from our map are from Californa."
      }
    )
}


shinyApp(ui = ui, server = server)


