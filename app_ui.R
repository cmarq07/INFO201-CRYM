library(shiny)
library(ggplot2)
library(RColorBrewer)
library(plotly)

cause_year_choices <- c(unique(cause$Year))
cause_choices <- c(unique(cause$Cause))

intro_panel <- tabPanel(
  "Introduction",
  fluidPage(
    includeCSS("styles.css"),
    tags$body(
    tags$h1(tags$a("Homelessness in Washington")),
    tags$h3("Christian Calloway, My-An Pham, Rachel Wang, Yash Katwal"),
    br(),
    # Intro
    div(
      class="container",
    tags$h2(class="title",
      "Introduction"),
    tags$img(src = "intro.jpg"),
    tags$div(class="overlay"),
    tags$p(class="summary",
      "In this project, we will be exploring the state of homelessness
      in Washington State. Throughout a series of different data
      visualizations, we will be exploring a summary of the state
      of homelessness, along with some different trends in the data.
      The original data from the", strong(em("Count Us In")),
      "dataset provided us with a framework to ask questions like
      ", em("what are the primary causes of homelessness in King County,"),
      "or,",
      em("how has the percentage of homeless people grown over the years?"),
    )),


    # Chart 1
    
    div(
      class="container",
      tags$h2(class="title",
              "Chart One"),
      tags$img(src = "chart1.png"),
      tags$div(class="overlay"),
      tags$p(class="summary",
             "Made by", strong("My-An"), ". Chart 1 is a line graph that allows
             the user to view the homeless population total and the King County
             population total so that they can compare the two and see visual
             representation of how much of the population is homeless."),
      ),
    
    
    # Chart 2
    div(
      class="container",
      tags$h2(class="title",
              "Chart Two"),
      tags$img(src = "chart2.png"),
      tags$div(class="overlay"),
      tags$p(class="summary",
             "Made by", strong("Christian"), ". Chart 2 is a
      heat map/chloropleth map of homelessness throughout WA.
      This chart was a bit different in that we had to create our own
      excel spreadsheet to mutate different columns of data,
      such as the homeless count in different counties, and
      the percent of the population."),
    ),
    
    div(
      class="container",
      tags$h2(class="title",
              "Chart Three"),
      tags$img(src = "chart3.png"),
      tags$div(class="overlay"),
      tags$p(class="summary",
             "Made by", strong("Rachel"), ". Chart 3 is a bar chart that explores the
      different causes of homelessness in Seattle from the years 2017 - 2020.
      Users can select the year they want (as well as a fun color
      choice) and view the different causes of homelessness and how common
      they were."),
    ),
  )
)
)

chart1_panel <- tabPanel(
  "1st Chart",
  titlePanel("Total Population per Year"),
  sidebarLayout(
    sidebarPanel(
      total_input <- selectInput(
        inputId = "total_input",
        label = "Choose a Total Population to View",
        choices = c("Homeless Population", "King County Population")
      )
    ),
    mainPanel(
      plotlyOutput("chart1")
    )
  )
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
  "Conclusion",
  titlePanel("Conclusion"),
  sidebarLayout(
    sidebarPanel(
      p("What we analyzed, learned and are taking away..."),
    ),
    mainPanel(
      div(
        class="conclusion",
      tags$p(class="intro",
             "When starting this project we set out to answer a few different 
             questions about homelessness in Washington state. After doing a 
             lot of research and analyzing our data we learned some interesting
             things about how much nest and what factors play into it"),
      tags$p(class="chart",
             "One aspect we decided to study was the King County population of 
             homelessness per year. After thorough analysis of our data we have 
             concluded that King County's homeless population has been on a steady
             linear rise since the early 2000s with no sign of decreasing or 
             plateauing"),
      tags$p(class="chart",
             "Another thing that our team wanted to know was how the population 
              of homeless people compared to the population of non-homeless people.
              When looking at the total count of the homeless population in 
             Washington state we really don't see anything too unexpected. 
             King county seems to have the highest count of homeless people 
             while other counties have a relatively low population. This is 
             most likely due to the fact that King County is a Metropolitan hub
             with the most people living in it and easy access to the rest of the 
             country and other parts of the world, However, When looking at the 
             percent of population per county it brings up an interesting
             pattern. It seems to be that quite a few counties have a similar
             proportional population of homeless people as King County, Which 
             shows us that Washington state seems to have a pretty consistent 
             rate of homeless population when comparing to the total population 
             of each county"),
      tags$p(class="chart",
             "Another factor that we decided was important to analyze was the 
             causes of homelessness specifically in the city of Seattle. By 
             looking at this chart we can see that homelessness has a lot of
             different causes and it shows that this issue is not as simple
             as some make it out to be. When analyzing the year 2020 it seems to
             be that the two top contributors to homelessness in Seattle are 
             increases in rent and mental health issues. This goes to show that 
             some of the major causes of homelessness are things that are usually 
             out of peoples control. A lot of other factors from the chart seem 
             to be more societal issues that people have to come together 
             and try to solve rather than issues that stem from only an 
             individual's decisions"),
      ))
    )
  )


ui <- navbarPage(
  "Final Deliverable: Homelessness in Seattle",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  conclusion_panel
)
