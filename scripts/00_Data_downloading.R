#### Preamble ####
# Purpose: Download and import data
# Author: Siming Shan
# Data: 1 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### download the data set from opendatatoronto ####

package <- show_package("9cd09dd7-4453-43bd-af7a-caf42e565103")

resources <- list_package_resources("9cd09dd7-4453-43bd-af7a-caf42e565103")

data <- resources %>% get_resource()

### store this dataset in the input folder for better reproducibility

write_csv(
  x = data,
  file = "Police_Annual_Statistica_Report_Victims_of_Crime.csv"
)





