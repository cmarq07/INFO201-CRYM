source("scripts/summary_calculations.R")

table_1 <- left_join(race_highest_percentage, region_highest_pop, 
           by = c("Year"))

table_2 <- left_join(table_1, total, by = c("Year"))

table_3 <- left_join(table_2, highest_duration, by = c("Year")) %>% 
  relocate("Year", "Homeless population", "King County population", 
           "Percent of population")

