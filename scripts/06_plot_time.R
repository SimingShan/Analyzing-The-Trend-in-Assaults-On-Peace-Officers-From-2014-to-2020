# Purpose: Create a bar plot of assault cases, classified by time
# Author: Siming Shan
# Data: 5 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT

### First create a dataset that is group by time 
### and their corresponding total number of cases
time_assault <- data_cleaned %>% group_by(reported_year) %>% summarise(time_count=sum(count))

### create the plot
time_assault %>% 
  ggplot(aes(x=reported_year,y=time_count)) +
  geom_line(stat="identity",color = "red1")+
  theme_classic()+
  labs(x="Year",
       y="Count of Assaults From 2014 - 2020")+
  ggtitle("Time vs Count of Identified Victims")+
  geom_text(aes(label=time_count),vjust= -0.2)
