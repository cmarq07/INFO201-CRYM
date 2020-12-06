library(shiny)
library(ggplot2)
library(RColorBrewer)
library(plotly)

cause <- read.csv("INFO_cause.csv")
demographics <- read.csv("INFO_demographics.csv")
duration <- read.csv("INFO_duration_of_homeless.csv")
region <- read.csv("INFO_region.csv")
total <- read.csv("INFO_total.csv")

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
  "3rd Chart"
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