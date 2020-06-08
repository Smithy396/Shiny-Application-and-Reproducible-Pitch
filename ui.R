# Sam Smith - 08/06/2020
# This is a simple shiny application created for coursera
# This UI part of the app hosts the user interface inputs

# Load shiny package
library(shiny)

shinyUI(fluidPage(
    titlePanel("Coronavirus Analysis"),
    
  # Create main panel with heading, Country selection and date inputs
   mainPanel(
            h3("Country & Date Selection"),
            selectInput("selection", "Pick the country you wish to view", choices = data$countriesAndTerritories),
            dateInput("startdate", "Choose the start date", format = "yyyy-mm-dd", value = "2020-01-01"),
            dateInput("enddate", "Choose the end date", format = "yyyy-mm-dd")
            ),
   
   
  # Create another panel to display the graph output
  mainPanel(
      h3("A graph showing the deaths in the selected country and date range."),
      plotOutput("graphoutput")
  ),
   
 )
)