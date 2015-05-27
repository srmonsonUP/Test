library(shiny)

generateData = function(num, seed = 1){
  set.seed(seed)
  x = rnorm(n = num, mean = 1)
  y = rnorm(n = num, mean = 1)
  cbind(x,y)
}

shinyServer(function(input,output){
   
  nplot = eventReactive(input$go,
  {
    file = input$file
    if(is.null(file))
        genData()
    else
      read.csv(file$datapath, header = T)
  })
  
  output$plot = renderPlot({
    plot(nplot())
    if(input$linreg)
      abline(lm(nplot()[2,] ~ nplot()[1,]))
  })
  
  genData = reactive({
    generateData(input$inputNum, input$seed)
  })
  
  output$table = renderDataTable({
    x = nplot()
  })
  
})