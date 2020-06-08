# Sam Smith - 08/06/2020
# This is a simple shiny application created for coursera
# This server part of the app hosts the calculations and functions to produce the outputs

# Load libraries used in app
library(shiny)
library(ggplot2)
library(dplyr)
library(lubridate)
library(RColorBrewer)

# Download raw coronavirus data
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv")

# Start main server function
shinyServer(function(input, output) {
        
        # Reformat datecolumn to dateformat
        data$dateRep = dmy(data$dateRep)
        
        output$graphoutput <- renderPlot({
                
                # Filter out specified country input and date range
                filtered <- data %>% filter(countriesAndTerritories == input$selection & dateRep >= input$startdate & dateRep <= input$enddate)
                
                # Plot a graph using GGplot
                ggplot(filtered,  aes(dateRep, deaths, colour = deaths)) + 
                        geom_point(size = 2) +
                        ggtitle(paste0(input$selection, " Coronavirus Deaths Per Day")) +
                        theme(plot.title = element_text(hjust = 0.5, size = 20)) +
                        labs(x= "Date", y= "Deaths") +
                        scale_colour_gradient(low = "green",high = "red") +
                        theme_minimal() + 
                        geom_smooth(method='lm')
                })
})

