# Load packages
library(dplyr)
library(readxl)
library(ggplot2)
library(maps)
library(mapproj)

# Source UI
source("app_ui.R")

# load dataset
region <- read.csv("INFO_region.csv")
county_homeless <- read_xlsx("wa_county_homeless.xlsx") %>%
  rename(subregion = region)

# Change dataset as necessary
county_shape <- map_data("county") %>%
  filter(region == "washington")
map_data <- county_shape %>%
  left_join(county_homeless, by = "subregion")

