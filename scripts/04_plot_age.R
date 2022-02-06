#### Preamble ####
# Purpose: Create a bar plot of assault cases, classified by age group
# Author: Siming Shan
# Data: 5 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT

### First create a dataset that is group by age cohort  
### and their corresponding total number of cases
age_assault <- data_cleaned %>% group_by(age_cohort) %>% summarise(age_count=sum(count))


### create the plot
age_assault %>% 
  ggplot(aes(x=age_cohort,y=age_count)) +
  geom_bar(stat="identity", fill = "darksalmon")+
  theme_classic()+
  labs(x="Age Cohorts of Victims",
       y="Count of Assaults From 2014 - 2020")+
  ggtitle("Age cohort of identified victim vs Count of identified victims")+
  geom_text(aes(label=age_count),vjust=-0.3)
