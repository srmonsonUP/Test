options(error = browser)

shinyServer(function(input,output){
  
  output$plot = renderPlot({
    plot(nplot())
  })
  
  nplot = eventReactive(input$go,
  {
    file = input$file
    if(is.null(file))
        return(NULL)
    
    read.csv(file$datapath, header = T)
  })
  
})