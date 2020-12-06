library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

#load datasets
cause <- read.csv("INFO_cause.csv")
demographics <- read.csv("INFO_demographics.csv")
duration <- read.csv("INFO_duration_of_homeless.csv")
region <- read.csv("INFO_region.csv")
total <- read.csv("INFO_total.csv")

server <- function(input, output) {
  output$chart3 <- renderPlotly({
    
    cause_updated <- cause %>% 
      filter(Year == input$year_input) %>% 
      select(Cause, Count)
    
    plot <- ggplot(data = cause_updated) +
      geom_col(mapping = aes_string(x = "Cause", y = "Count"),
               color = input$color_input) +
      labs(x = "Causes", y = "Number of Instances", 
           title = paste0("Count of Causes of Homelessness in Seattle in ", 
                     input$year_input)) +
      coord_flip()
    
    ggplotly(plot)
    
  })
}
