load("../FFXData/FFXDAta.RData")
library(dplyr)

#calculate how many houses have x number of fireplaces
FFX_number_fp_per_house <-FFX_res_data %>%
  select(fireplaces, decade) %>%
  group_by(decade, fireplaces) %>%
  summarize(houses_with_x_fps = n())

#calculate how many houses were built per decade
FFX_houses_built_per_decade <- FFX_res_data %>%
  group_by(decade) %>%
  summarize(houses_built = n())

#join two tables together
FFX_number_fp_per_house %>%
  left_join(FFX_houses_built_per_decade, by = "decade")



  
 