# Christian, Chart 3

# Load libraries
library(dplyr)
library(readxl)
library(ggplot2)

# Load excel file
causes <- read.csv("INFO_cause.csv")

# Filtering 'causes' data set by year
causes_2020 <- causes %>% filter(Year == "2020")
causes_2019 <- causes %>% filter(Year == "2019")
causes_2018 <- causes %>% filter(Year == "2018")
causes_2017 <- causes %>% filter(Year == "2017")

# Question to be asked of the data
cause_by_year <- function(year) {
  lead_cause <- causes %>% filter(Year == year) %>%
    filter(Percent == max(Percent)) %>% pull(Cause)
  paste("The primary cause of homelessness in", year, "was", lead_cause)
}

# Creating bar charts for each year

causes_2020_bar_chart <- ggplot(data = causes_2020) + 
  geom_col(mapping = aes(x = Cause, y = Percent), fill = "red") +
  labs(x = "Cause", y = "Percentage", title = "Homeless Population Causes 2020") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

causes_2019_bar_chart <- ggplot(data = causes_2019) + 
  geom_col(mapping = aes(x = Cause, y = Percent), fill = "green") +
  labs(x = "Cause", y = "Percentage", title = "Homeless Population Causes 2019") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

causes_2018_bar_chart <- ggplot(data = causes_2018) + 
  geom_col(mapping = aes(x = Cause, y = Percent), fill = "blue") +
  labs(x = "Cause", y = "Percentage", title = "Homeless Population Causes 2018") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

causes_2017_bar_chart <- ggplot(data = causes_2017) + 
  geom_col(mapping = aes(x = Cause, y = Percent), fill = "yellow") +
  labs(x = "Cause", y = "Percentage", title = "Homeless Population Causes 2017") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))