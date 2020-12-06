library(shiny)
library(ggplot2)
library(RColorBrewer)
library(plotly)

#load datasets
cause <- read.csv("INFO_cause.csv")
demographics <- read.csv("INFO_demographics.csv")
duration <- read.csv("INFO_duration_of_homeless.csv")
region <- read.csv("INFO_region.csv")
total <- read.csv("INFO_total.csv")

cause_year_choices <- c(unique(cause$Year))
cause_choices <- c(unique(cause$Cause))

intro_panel <- tabPanel(
  "Introduction"
)

chart1_panel <- tabPanel(
  "1st Chart"
)

chart2_panel <- tabPanel(
  "2nd Chart"
)

chart3_panel <- tabPanel(
  "3rd Chart",
  titlePanel("Bar Chart of Causes of Homelessness in Seattle"),
  sidebarLayout(
    sidebarPanel(
      p("Choose a year and a color to display your bar chart!"),
      year_input <- selectInput(
        inputId = "year_input",
        label = h3("Choose a year"),
        choices = cause_year_choices
      ),
      color_input <- selectInput(
        inputId = "color_input",
        label = h3("Choose a color"),
        choices = brewer.pal(10, "Set3")
      )
    ),
    mainPanel(
      plotlyOutput("chart3")
    )
  )
)

conclusion_panel <- tabPanel(
  "Conclusion"
)

ui <- navbarPage(
  "Final Deliverable: Homelessness in Seattle",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  conclusion_panel
)