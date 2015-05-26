library(shiny)

generateData = function(num, seed = 1){
  set.seedseed(seed)
  rnorm(n = num, mean = 1)
}

shinyServer(function(input,output){
   
  nplot = eventReactive(input$go,
  {
    file = input$file
    if(is.null(file))
        return(NULL)
    else
      read.csv(file$datapath, header = T)
  })
  
  output$plot = renderPlot({
    plot(nplot())
  })
  
  genData = reactive({
    generateData(input$inputNum, input$seed)
    cat(x)
  })
  
  output$table = renderTable({
    table(genData)
  })
  
})