#### Preamble ####
# Purpose: cleaning the dataset
# Author: Siming Shan
# Data: 1 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT

### Workplace setup
install.packages("janitor")
library(janitor)
library(readr)

raw_data <- 
  read_csv("inputs/data/Police_Annual_Statistica_Report_Victims_of_Crime.csv",
           show_col_types = FALSE)

### since the columns "index" and "geometry" of the dataset are all NAs 
### and Nulls, thus we delete these columns
data_cleaned <- raw_data %>% select(-c(2,12))
### clean the name of columns
data_cleaned <- clean_names(data_cleaned)
### since I am only interested in assaults against peace officers, delete all
### other irrelevant observations
data_cleaned <- data_cleaned %>% filter(assault_subtype != "N/A" & assault_subtype !="Other")
