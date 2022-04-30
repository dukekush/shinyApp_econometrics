library(shinydashboard)
library(DT)

server <- function(input, output) { 
  
  data <- reactive({
    req(input$upload)
    
    ext <- tools::file_ext(input$upload$name)
    switch(ext,
           csv = vroom::vroom(input$upload$datapath, delim = ","),
           xlsx = readxl::read_excel(input$upload$datapath),
           validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  
  
  output$head <- DT::renderDT({
    input$loadData
    
    isolate(data())
  })
  
  
  
}