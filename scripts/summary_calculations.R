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
  filter(Percent == max(Percent)) %>% 
  rename(Top_race = Characteristic) %>% 
  rename(Race_percent = Percent)

#find the race with the highest homeless pop and its percentage of the total 
#homeless pop in Seattle
highest_race_2020 <- race_highest_percentage %>% 
  filter(Year == "2020") %>% 
  pull(Race) 

highest_race_2019 <- race_highest_percentage %>% 
  filter(Year == "2019") %>% 
  pull(Race) 

highest_race_2018 <- race_highest_percentage %>% 
  filter(Year == "2018") %>% 
  pull(Race) 

highest_race_2017 <- race_highest_percentage %>% 
  filter(Year == "2017") %>% 
  pull(Race) 

highest_race_2016 <- race_highest_percentage %>% 
  filter(Year == "2016") %>% 
  pull(Race) 

highest_race_2015 <- race_highest_percentage %>% 
  filter(Year == "2015") %>% 
  pull(Race) 

highest_percentage_2020 <- race_highest_percentage %>% 
  filter(Year == "2020") %>% 
  pull(Percent)

highest_percentage_2019 <- race_highest_percentage %>% 
  filter(Year == "2019") %>% 
  pull(Percent)

highest_percentage_2018 <- race_highest_percentage %>% 
  filter(Year == "2018") %>% 
  pull(Percent)

highest_percentage_2017 <- race_highest_percentage %>% 
  filter(Year == "2017") %>% 
  pull(Percent)

highest_percentage_2016 <- race_highest_percentage %>% 
  filter(Year == "2016") %>% 
  pull(Percent)

highest_percentage_2015 <- race_highest_percentage %>% 
  filter(Year == "2015") %>% 
  pull(Percent)

#region with the highest percentage of homeless for each year in Seattle
region_highest_pop <- region %>% 
  group_by(Year) %>% 
  mutate(Total_Pop = sum(Count)) %>% 
  mutate(Percentage = Count / Total_Pop * 100) %>% 
  select(Year, Region, Count, Total_Pop, Percentage) %>% 
  filter(Count == max(Count)) %>% 
  rename(Top_region = Region) %>% 
  rename(Region_count = Count) %>% 
  rename(Region_total_pop = Total_Pop) %>% 
  rename(Region_percentage = Percentage)

#highest duration of homeless for each year in Seattle
highest_duration <- duration_of_homeless %>% 
  group_by(Year) %>% 
  filter(Count == max(Count)) %>% 
  rename(Top_time_period = `Time period`) %>% 
  rename(Time_period_count = Count) %>% 
  rename(Time_period_percent = `Percent `)
  


