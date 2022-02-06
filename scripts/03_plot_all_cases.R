#### Preamble ####
# Purpose: Create a plot shows the total number of cases of assaults against peace officers
# Author: Siming Shan
# Data: 5 Februrary 2022
# Contact: siming.shan@mail.utoronto.ca
# License: MIT

### First create a dataset with only four types of assaults against peace 
### officers and their corresponding total number of cases
total_assault <- data_cleaned %>% group_by(assault_subtype) %>% summarise(total_count=sum(count))


### create the plot, change the name of x-axis for aesthetic purposes
total_assault %>% 
  ggplot(aes(x=assault_subtype,y=total_count)) +
  geom_bar(stat="identity", fill = "darkred")+
  theme_classic()+
  scale_x_discrete(labels= c("Aggravated Assault", "Assault","Weapon/Bodily Harm","Resist Arrest"))+
  labs(x="Types of Assaults Against Peace Officer",
       y="Count of Assaults From 2014 - 2020")+
  geom_text(aes(label=total_count),vjust=-0.3)

