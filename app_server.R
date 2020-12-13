library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

# Source data
source("chart_two.R")

#load datasets
cause <- read.csv("INFO_cause.csv")
demographics <- read.csv("INFO_demographics.csv")
duration <- read.csv("INFO_duration_of_homeless.csv")
region <- read.csv("INFO_region.csv")
total <- read.csv("INFO_total.csv")

total_updated <- total %>% 
  filter(Homeless.population != "na")

total_ungrouped <-total_updated %>% 
  ungroup()

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    line_graph <- ggplot(data = total_ungrouped) +
      labs(x = "Year", 
           y = gsub("\\.", " ", input$total_input), 
           title = paste0(gsub("\\.", " ", input$total_input), " per Year")) +
      geom_line(mapping = aes_string(x = "Year", y = input$total_input), 
                color = "blue", size = 1)
    ggplotly(line_graph)
  })
  output$chart2 <- renderPlot({
    # Creating map
    getFeature <- function(inputName) {
      if(inputName == "Count") {
        return(map_data$count)
      }
      return(map_data$pop_percent)
    }
    getArgs <- function(inputType) {
      if(inputType == "Count") {
        return(scale_fill_continuous(
          breaks = c(0, 5750, 11500),
          labels = c("0", "5,750", "11,500"),
          low = "#ffeda0", high = "#f03b20"
        ))
      }
      return(scale_fill_continuous(
                                   breaks = c(0, 0.00125, 0.0025, 0.00375, 0.005),
                                   labels = c("0%", "0.125%", "0.25%", "0.375%", "0.5%"),
                                   low = "#ffeda0", high = "#f03b20"
      ))
    }
    homeless_heatmap <- ggplot(map_data, aes(long, lat, group = group)) +
      geom_polygon(aes(fill = getFeature(input$feature_input)),
                   color = "black", size = 0.25) +
      scale_fill_gradient(low = "#ffeda0", high = "#f03b20") +
      xlab("Latitude") +
      ylab("Longitude") +
      labs(fill = input$feature_input) +
      getArgs(input$feature_input)
    return(homeless_heatmap)
  })
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
