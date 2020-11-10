library("httr")
library("readxl")

#data set for total number of homeless pop in Seattle
total <- read_excel("INFO_total.xlsx")

#data set for demographics of homeless pop in Seattle
demographics <- read_excel("INFO_demographics.xlsx")

#data set for different regions of homeless pop in Seattle
region <- read_excel("INFO_region.xlsx")

#filtered data set to just race and ethnicity
race_and_ethnicity <- demographics %>% 
  filter(Demographic == "Race and ethnicity") 

#race with highest percentage of homeless for each year in Seattle 
race_highest_percentage <- race_and_ethnicity %>% 
  group_by(Year) %>% 
  select(Year, Characteristic, Percent) %>% 
  filter(Percent != "na") %>% 
  filter(Percent == max(Percent))
  
