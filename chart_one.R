#race demographics
library(ggplot2)
race_stat_2020 <- race_and_ethnicity %>% 
  group_by(Year) %>% 
  select(Year, Characteristic, Percent) %>% 
  filter(Percent != "na") %>% 
  filter(Year == 2020) %>%
  group_by(Characteristic) %>% 
  select(Characteristic, Percent)


race_stat_2020$ID <- seq.int(nrow(race_stat_2020))



mycols <- c("#e06060", "#7ce060", "#60cde0", "#6066e0","#9e60e0", "#e060be", "#e0cd60" )
 ggplot(race_stat_2020, aes(x="", y= Percent, fill=Characteristic)) +
  geom_bar(stat="identity", width=1) +
  coord_polar(theta = "y", start=0)+
   geom_text(aes(y = 1 , label = Percent), color = "white")+
   scale_fill_manual(values = mycols) +
   theme_void()

 
 
 