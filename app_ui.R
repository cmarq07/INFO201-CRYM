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
  "Introduction",
  fluidPage(
    h1("Homelessness in Washington"),
    h3("Christian Calloway, My-An Pham, Rachel Wang, Yash Katwal"),
    br(),
    # Intro
    strong("Introduction"),
    hr(),
    p("In this project, we will be exploring the state of homelessness 
      in Washington State. Throughout a series of different data
      visualizations, we will be exploring a summary of the state
      of homelessness, along with some different trends in the data.
      The original data from the", strong(em("Count Us In")),
      "dataset provided us with a framework to ask questions like
      ", em("what are the primary causes of homelessness in King County,"),
      "or,", em("how has the percentage of homeless people grown over
               the years?"),),
    br(),
    
    # Chart 1
    strong("Chart One"),
    hr(),
    p("Made by", strong("My-An"), ". Enter content here"),
    br(),
    
    # Chart 2
    strong("Chart Two"),
    hr(),
    p("Made by", strong("Christian"), ". Chart 2 is a 
      heat map/chloropleth map of homelessness throughout WA. 
      This chart was a bit different in that we had to create our own
      excel spreadsheet to mutate different columns of data,
      such as the homeless count in different counties, and
      the percent of the population."),
    br(),
    
    # Chart 3
    strong("Chart Three"),
    hr(),
    p("Made by", strong("Rachel"), ". Enter content here"),
  )
)

chart1_panel <- tabPanel(
  "1st Chart"
)

chart2_panel <- tabPanel(
  "2nd Chart",
  titlePanel("Homelessness Heatmap"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "feature_input",
        label = "Map Feature",
        choices = c("Count", "Percent of Population")
      )
    ),
    mainPanel(
      plotOutput("chart2")
    )
  )
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