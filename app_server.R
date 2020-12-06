library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

cause <- read.csv("INFO_cause.csv")
demographics <- read.csv("INFO_demographics.csv")
duration <- read.csv("INFO_duration_of_homeless.csv")
region <- read.csv("INFO_region.csv")
total <- read.csv("INFO_total.csv")

server <- function(input, output) {
  
}
