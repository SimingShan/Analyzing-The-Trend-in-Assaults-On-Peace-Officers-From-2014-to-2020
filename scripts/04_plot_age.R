#### Preamble ####
# Purpose: Create a bar plot of assault cases, classified by age group
# Author: Siming Shan
# Data: 5 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT

### First create a dataset that is group by age cohort  
### and their corresponding total number of cases
age_assault <- data_cleaned %>% group_by(age_cohort) %>% summarise(age_count=sum(count))

age_assault <- age_assault %>% filter(age_cohort != "Unknown")

sum_age <- sum(age_assault$age_count)

age_assault <- age_assault %>% mutate(police_age_percentage = c(0.018,2.31,28.66,37.53,27.07,3.63,0.75))

age_assault <- age_assault %>% mutate(victim_age_percentage = age_count/sum_age * 100) 

age_assault <- age_assault %>% mutate(net_percentage = police_age_percentage - victim_age_percentage)
### create the plot
age_assault %>% 
  ggplot(aes(x=age_cohort,y=age_count)) +
  geom_bar(stat="identity", fill = "darksalmon")+
  theme_classic()+
  labs(x="Age Cohorts of Victims",
       y="Count of Assaults From 2014 - 2020")+
  ggtitle("Age cohort of identified victim vs Count of identified victims")+
  geom_text(aes(label=age_count),vjust=-0.3)

### create the table

knitr::kable(age_assault,format = "pipe",digits = 2)
