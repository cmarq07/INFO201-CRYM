# Load packages
library(dplyr)
library(readxl)
library(ggplot2)
# load dataset
region <- read.csv("INFO_region.csv")
# CREATING A NEW DATAFRAME: There are repeats of rows with the same region for
# 2017, so here I combined the rows that were in the same region for the year
# 2017 and made it into a new dataframe
region_combined <- region %>%
  group_by(Year, `Location.type`, Region, Percent) %>%
  summarize(Count = sum(Count), .groups = "drop")

# LOOKING INTO PATTERNS OF THE DATA:
# Region with highest count of unsheltered homelessness in 2020
highest_unsheltered_2020 <- region_combined %>%
  filter(Year == "2020") %>%
  filter(Count == max(Count)) %>%
  pull(Region)
# Region with highest count of unsheltered homelessness in 2019
highest_unsheltered_2019 <- region_combined %>%
  filter(Year == "2019") %>%
  filter(Count == max(Count)) %>%
  pull(Region)
# Region with highest count of unsheltered homelessness in 2018
highest_unsheltered_2018 <- region_combined %>%
  filter(Year == "2018") %>%
  filter(Count == max(Count)) %>%
  pull(Region)
# Region with highest count of unsheltered homelessness in 2017
highest_unsheltered_2017 <- region %>%
  filter(Year == "2017") %>%
  filter(Count == max(Count)) %>%
  pull(Region)
# The year of Seattle's highest count over the last 3 years
seattle_highest_year <- region_combined %>%
  filter(Region == "Seattle") %>%
  filter(Count == max(Count)) %>%
  pull(Year)
# The year of East County's highest count over the last 3 years
east_county_highest_year <- region_combined %>%
  filter(Region == "East County") %>%
  filter(Count == max(Count)) %>%
  pull(Year)
# The year of North County's highest count over the last 3 years
north_highest_year <- region_combined %>%
  filter(Region == "North County") %>%
  filter(Count == max(Count)) %>%
  pull(Year)
# The year of Northeast's highest count over the last 3 years
northeast_highest_year <- region_combined %>%
  filter(Region == "Northeast County") %>%
  filter(Count == max(Count)) %>%
  pull(Year)
# The year of Southwest's highest count over the last 3 years
southwest_highest_year <- region_combined %>%
  filter(Region == "Southwest County") %>%
  filter(Count == max(Count)) %>%
  pull(Year)
# The year of Southeast's highest count over the last 3 years
southeast_highest_year <- region_combined %>%
  filter(Region == "Southeast County") %>%
  filter(Count == max(Count)) %>%
  pull(Year)



# Creating the Graph

# Separating each region to be able to plot it as one line and turning it into
# a vector to be used in the graph
east_line <- region_combined %>%
  filter(Region == "East County")

north_line <- region_combined %>%
  filter(Region == "North County")

northeast_line <- region_combined %>%
  filter(Region == "Northeast County")

seattle_line <- region_combined %>%
  filter(Region == "Seattle")

southeast_line <- region_combined %>%
  filter(Region == "Southeast County")

southwest_line <- region_combined %>%
  filter(Region == "Southwest County")

# Plotting the Plot
ggplot() +
  labs(x = "Year", y = "Count", 
       title = "Unsheltered Homelessness by Region in King County"
  ) +
  geom_line(
    data = east_line, aes(x = Year, y = Count, color = "red"), size = 1
  ) +
  geom_line(
    data = north_line, aes(x = Year, y = Count, color = "blue"), size = 1
  ) +
  geom_line(
    data = northeast_line, aes(x = Year, y = Count, color = "green"), size = 1
  ) +
  geom_line(
    data = seattle_line, aes(x = Year, y = Count, color = "purple"), size = 1
  ) +
  geom_line(
    data = southeast_line, aes(x = Year, y = Count, color = "yellow"), size = 1
  ) +
  geom_line(
    data = southwest_line, aes(x = Year, y = Count, color = "orange"), size = 1
  ) +
  scale_color_discrete(
    name = "Region",
    labels = c(
      "East County", "North County",
      "Northeast County", "Seattle",
      "Southeast County", "Southwest County") 
  )
