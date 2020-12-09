# Load packages
library(dplyr)
library(readxl)
library(ggplot2)
library(maps)
library(mapproj)

# load dataset
region <- read.csv("INFO_region.csv")
county_homeless <- read_xlsx("wa_county_homeless.xlsx") %>%
  rename(subregion = region)

# Change dataset as necessary
county_shape <- map_data("county") %>%
  filter(region == "washington")
map_data <- county_shape %>%
  left_join(county_homeless, by = "subregion")

# Creating plot
homeless_heatmap <- ggplot(map_data, aes(long, lat, group = group)) +
  geom_polygon(aes(fill = count), color = "black", size = 0.25) +
  scale_fill_gradient(low = "#ffeda0", high = "#f03b20") +
  labs(x = "Longitude", y = "Latitude")

