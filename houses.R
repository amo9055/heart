load("../FFXData/FFXDAta.RData")
library(dplyr)
library(ggplot2)


#this function determines if a house has a fireplace or not.
has_fireplace <- function(n) {
 ifelse(n == 0, FALSE, TRUE)
}


FFX_res_data <- 
  
  FFX_res_data %>%
#this adds a column which indicates if a fireplace is present (TRUE) or not (FALSE)
  mutate(has_fp = has_fireplace(fireplaces)) %>%
#this groups the data by decade and whether it has a fireplace
  group_by(decade, has_fp) %>%
#this counts the data
  summarize(n = n()) %>%
  
  

