library("httr")
library("readxl")

#data set for total number of homeless pop in Seattle
total <- read_excel("INFO_total.xlsx")

#data set for demographics of homeless pop in Seattle
demographics <- read_excel("INFO_demographics.xlsx")

#data set for different regions of homeless pop in Seattle
region <- read_excel("INFO_region.xlsx")

#data set for duration of homeless pop in Seattle
duration_of_homeless <- read_excel("INFO_duration_of_homeless.xlsx")

#filtered data set to just race and ethnicity
race_and_ethnicity <- demographics %>% 
  filter(Demographic == "Race and ethnicity") 

#race with highest percentage of homeless for each year in Seattle 
race_highest_percentage <- race_and_ethnicity %>% 
  group_by(Year) %>% 
  select(Year, Characteristic, Percent) %>% 
  filter(Percent != "na") %>% 
  filter(Percent == max(Percent))

#region with the highest percentage of homeless for each year in Seattle
region_highest_pop <- region %>% 
  group_by(Year) %>% 
  mutate(Total_Pop = sum(Count)) %>% 
  mutate(Percentage = Count / Total_Pop * 100) %>% 
  select(Year, Region, Count, Total_Pop, Percentage) %>% 
  filter(Count == max(Count))


