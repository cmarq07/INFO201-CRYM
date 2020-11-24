source("summary_calculations.R")

table_1 <- left_join(race_highest_percentage, region_highest_pop_rounded, 
           by = c("Year"))

table_2 <- left_join(table_1, highest_duration, by = c("Year"))

