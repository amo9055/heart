load("../FFXData/FFXDAta.RData")
library(tidyr)
library(dplyr)

# FFX_res_data %>%
# select(decade, fireplaces) %>%
#this function determines if a house has a fireplace or not.
has_fireplace <- function(n) {
  ifelse(n == 0, FALSE, TRUE)
}
#This creates a new column in the data frame giving true/false value
FFX_res_data_fp <- FFX_res_data %>%
  mutate(has_fireplace = has_fireplace(fireplaces))

FFX_res_data_sum <- FFX_res_data %>%
  
  #this adds a column which indicates if a fireplace is present (TRUE) or not (FALSE)
  mutate(has_fp = has_fireplace(fireplaces)) %>%
  
  #this groups the data by decade and whether it has a fireplace
  group_by(decade, has_fp) %>%
  
  #this counts the data
  summarize(n = n())



