library(shinydashboard)
library(DT)

dashboardPage(
  dashboardHeader(
    title="Econometric modelling"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("INPUT", tabName = "input", icon = icon("dashboard")),
      menuItem("STATS", tabName = "stats", icon = icon("history"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "input",
        fileInput("upload", "Choose CSV File", accept = c(".csv", ".xlsx")),
        
        actionButton(
          inputId = 'loadData',
          label = 'LOAD FILE'
        ),
        
        DT::DTOutput('head')
      )
    )
  )
)