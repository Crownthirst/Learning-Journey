library(tidyverse)
library(readxl)
#Open census dataset
census <- read_csv('datasets/census/census.csv')
#open census-divisions dataset
division <- read_csv('datasets/census/census-divisions.csv')
head(census)
head(division)
#merge census and division dataset by state
cens_div <- left_join(census,division)
#sort data
arrange(cens_div, region,division,desc(population))
#open write to excel library
library(writexl)
#write data to excel worksheet
write_xlsx(cens_div,'output/cens_div.xlsx')
#drop postalcode field from merged dataset
cens_div <- select(cens_div,c(-postal_code))
#create new column titled density
cens_div <- cens_div %>% 
  mutate(density = population/land_area)
head(cens_div)
#relationship between land area and population for all observations in 2015
#first fiter data by 2015
cens_2015 <- filter(cens_div,year==2015)
ggplot(data=cens_2015,
       aes(x=land_area,y=population))+
  geom_point()+
  xlab('land area')+ylab('population')+
  ggtitle('land_area versus population')
#total population for each region 2015
cens_2015 %>% 
  group_by(region) %>% 
  summarize(ttl_population = sum(population))
#create table containing state names and population
pivot_wider(data = select(cens_div, c('state','population','year')),
            names_from = 'year', values_from='population')
