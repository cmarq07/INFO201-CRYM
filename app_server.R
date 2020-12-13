library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

# Source data
source("chart_two.R")

# load datasets
cause <- read.csv("INFO_cause.csv")
demographics <- read.csv("INFO_demographics.csv")
duration <- read.csv("INFO_duration_of_homeless.csv")
region <- read.csv("INFO_region.csv")
total <- read_xlsx("totals.xlsx")
total_csv <- read.csv("INFO_total.csv")

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    if (input$total_input == "Homeless Population") {
      line_graph <- ggplot(data = total) +
        labs(
          x = "Year",
          y = "Homeless Population",
          title = "Homeless Population per Year"
        ) +
        geom_line(aes_string(x = "year", y = total$homeless.population),
          color = "blue", size = 1
        )
    } else {
      line_graph <- ggplot(data = total_csv) +
        labs(
          x = "Year",
          y = "King County Population",
          title = "King County Population per Year"
        ) +
        geom_line(aes_string(x = "Year", y = total_csv$King.County.population),
          color = "blue", size = 1
        )
    }
    ggplotly(line_graph)
  })
  output$chart2 <- renderPlot({
    # Creating map
    get_feature <- function(input_name) {
      if (input_name == "Count") {
        return(map_data$count)
      }
      return(map_data$pop_percent)
    }
    get_args <- function(input_type) {
      if (input_type == "Count") {
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
      geom_polygon(aes(fill = get_feature(input$feature_input)),
        color = "black", size = 0.25
      ) +
      scale_fill_gradient(low = "#ffeda0", high = "#f03b20") +
      xlab("Latitude") +
      ylab("Longitude") +
      labs(fill = input$feature_input) +
      get_args(input$feature_input)
    return(homeless_heatmap)
  })
  output$chart3 <- renderPlotly({
    cause_updated <- cause %>%
      filter(Year == input$year_input) %>%
      select(Cause, Count)
    plot <- ggplot(data = cause_updated) +
      geom_col(
        mapping = aes_string(x = "Cause", y = "Count"),
        color = input$color_input
      ) +
      labs(
        x = "Causes", y = "Number of Instances",
        title = paste0(
          "Count of Causes of Homelessness in Seattle in ",
          input$year_input
        )
      ) +
      coord_flip()
    ggplotly(plot)
  })
}
