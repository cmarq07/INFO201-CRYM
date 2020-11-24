library("httr")
library("readxl")

#data set for total number of homeless pop in Seattle
total <- read.csv("INFO_total.csv")

#data set for demographics of homeless pop in Seattle
demographics <- read.csv("INFO_demographics.csv")

#data set for different regions of homeless pop in Seattle
region <- read.csv("INFO_region.csv")

#data set for duration of homeless pop in Seattle
duration_of_homeless <- read.csv("INFO_duration_of_homeless.csv")

#data set for causes of homeless in Seattle
cause <- read.csv("INFO_cause.csv")

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


#region with the highest percentage of homeless for each year in Seattle
region_highest_pop <- region %>%
  group_by(Year) %>%
  mutate(Total_Pop = sum(Count)) %>%
  mutate(Percentage = Count / Total_Pop) %>%
  select(Year, Region, Count, Total_Pop, Percentage) %>%
  filter(Count == max(Count)) %>%
  rename(Top_region = Region) %>%
  rename(Region_count = Count) %>%
  rename(Region_total_pop = Total_Pop) %>%
  rename(Region_percentage = Percentage)

#round the percentage
region_highest_pop_rounded <- region_highest_pop %>%
  mutate_at("Region_percentage", signif, 2)


#highest duration of homeless for each year in Seattle
highest_duration <- duration_of_homeless %>%
  group_by(Year) %>%
  filter(Count == max(Count)) %>%
  rename(Top_time_period = Time.period) %>%
  rename(Time_period_count = Count) %>%
  rename(Time_period_percent = Percent)


#summary information list
summary_info <- list()
summary_info$highest_race_2020 <- race_highest_percentage %>%
  filter(Year == "2020") %>%
  pull(Top_race)
summary_info$highest_race_2019 <- race_highest_percentage %>%
  filter(Year == "2019") %>%
  pull(Top_race)
summary_info$highest_race_2018 <- race_highest_percentage %>%
  filter(Year == "2018") %>%
  pull(Top_race)
summary_info$highest_race_2017 <- race_highest_percentage %>%
  filter(Year == "2017") %>%
  pull(Top_race)
summary_info$highest_race_2016 <- race_highest_percentage %>%
  filter(Year == "2016") %>%
  pull(Top_race)
summary_info$highest_race_2015 <- race_highest_percentage %>%
  filter(Year == "2015") %>%
  pull(Top_race)
summary_info$highest_percentage_2020 <- race_highest_percentage %>%
  filter(Year == "2020") %>%
  pull(Race_percent)
summary_info$highest_percentage_2019 <- race_highest_percentage %>%
  filter(Year == "2019") %>%
  pull(Race_percent)
summary_info$highest_percentage_2018 <- race_highest_percentage %>%
  filter(Year == "2018") %>%
  pull(Race_percent)
summary_info$highest_percentage_2017 <- race_highest_percentage %>%
  filter(Year == "2017") %>%
  pull(Race_percent)
summary_info$highest_percentage_2016 <- race_highest_percentage %>%
  filter(Year == "2016") %>%
  pull(Race_percent)
summary_info$highest_percentage_2015 <- race_highest_percentage %>%
  filter(Year == "2015") %>%
  pull(Race_percent)
summary_info$top_region <- region_highest_pop_rounded %>%
  filter(Year == "2020") %>%
  pull(Top_region)
summary_info$region_percent_2017 <- region_highest_pop_rounded %>%
  filter(Year == "2017") %>%
  pull(Region_percentage)
summary_info$region_percent_2020 <- region_highest_pop_rounded %>%
  filter(Year == "2020") %>%
  pull(Region_percentage)
summary_info$highest_duration_by_year <- highest_duration %>%
  filter(Year == "2020") %>%
  pull(Top_time_period)
