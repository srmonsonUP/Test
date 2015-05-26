shinyUI(fluidPage(
  titlePanel("Test Page"),  
  sidebarLayout(position = "right",
    
    sidebarPanel(
                 
      h1("Basic information about the setting that will be here"),          
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
      actionButton("go", "Plot")
      
    ),
    
    mainPanel(
      plotOutput("plot")
    )
      
  )
))