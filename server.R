library(shiny) 
library(datasets)

# Define a server for the Shiny app
server <- function(input,output) {
  datasetInput <- reactive({
    switch(input$dataset,
           "attitude" = attitude,
           "iris" = iris,
           "mtcars" = mtcars,
           "Orange" = Orange,
           "pressure" = pressure,
           "sleep" = sleep,
           "women" = women)})
  
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)})
  
  output$dim <- renderPrint({
    dataset <- datasetInput()
    dim(dataset)})
  
  output$str <- renderPrint({
    dataset <- datasetInput()
    str(dataset)})
  
  # Render a table
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)})
  
  # Render a scatterplot
  output$plot <- renderPlot({
    dataset <- datasetInput()
    pairs(dataset)})
  # end of function(input, output)
  }