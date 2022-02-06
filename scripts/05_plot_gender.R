# Purpose: Create a bar plot of assault cases, classified by gender
# Author: Siming Shan
# Data: 5 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT

### First create a dataset that is group by gender 
### and their corresponding total number of cases
gender_assault <- data_cleaned %>% group_by(sex) %>% summarise(gender_count=sum(count))

### create the plot
gender_assault %>% 
  ggplot(aes(x=sex,y=gender_count)) +
  geom_bar(stat="identity", fill = "darksalmon")+
  theme_classic()+
  labs(x="Gender of Victim",
       y="Count of Assaults From 2014 - 2020")+
  ggtitle("Gender of Identified Victim vs Count of Identified Victims")+
  geom_text(aes(label=gender_count),vjust=-0.3)



