load("../FFXData/FFXDAta.RData")
library(dplyr)

#calculate how many houses have x number of fireplaces

FFX_number_fp_per_house <-FFX_res_data %>%
  select(fireplaces, decade) %>%
  group_by(decade, fireplaces) %>%
  summarize(number_houses_w_x_fps = n())

