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
        "Based on the collection of tweets compared with the map from the CDC, a large amount of tweets\n are from the states with the greatest population,
         namely California, Texas, and New York. In contrast, the area with the highest level of Flu activity were in the South, interestingly centered around Texas. Texas may have
        generated so many matching tweets not only because of its large population, but also because of its high level of Flu activity."
      }else if (input$var == "Second"){
        "The key words we used to collect the most tweets were #Flu and #FluSeason. This map again demonstrates a similar spatial distribution as our total collection of tweets,
         largely because these keywords were responsible for most of the data collected. California, the state with the largest population, had the most matching tweets of any state. 
        The next step in this analysis would be not to only compare total amount of tweets versus Flu activity, but rather tweets per capita versus Flu activity."
      }
    )
}


shinyApp(ui = ui, server = server)


