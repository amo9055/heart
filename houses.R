load("../FFXData/FFXDAta.RData")
library(dplyr)
library(ggplot2)

# FFX_res_data %>%
# select(decade, fireplaces) %>%

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
#this creates a bar graph from the data  
  ggplot(aes(x = decade, y = n, fill = has_fp)) + geom_bar(stat="identity", position="dodge")

