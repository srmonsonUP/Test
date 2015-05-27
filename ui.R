shinyUI(fluidPage(
  titlePanel("Test Page"),  
  sidebarLayout(position = "right",
    
    sidebarPanel(
                 
      h1("Load Data"),          
      fileInput("file", "Enter file to load",
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      ),
      
      h1("Generate Data"),
      sliderInput("inputNum", "Number of data points", min = 10, max = 300, value = 50),
      sliderInput("seed", "Seed for generator", min = 1, max = 100, value = 1),
      checkboxInput("linreg", "Linear Regression"),
      actionButton("go", "Plot")
      
    ),
    
    mainPanel(
      plotOutput("plot"),
      dataTableOutput("table")
    )
      
  )
))