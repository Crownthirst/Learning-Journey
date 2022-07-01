library(tidyverse)
library(readxl)
star <- read_excel('datasets/star/star.xlsx')
head(star)
#select records tmathssk,treadssk,schidkn
select(star,tmathssk,treadssk,schidkn)
#select all columns except tmathssk,treadssk and schidkn
select(star,-tmathssk,-treadssk,-schidkn)
select(star,-c(tmathssk,treadssk,schidkn))
star <- select(star,tmathssk:totexpk)
head(star)
#create claclulated column
star <- mutate(star,new_column = tmathssk+treadssk)
head(star)
#rename calculated column
star <- rename(star,ttl_score = new_column)
head(star)
#sort star table by classk and treadssk both ascending
arrange(star, classk, treadssk)
#sort records by classk descending and treadssk ascending
arrange(star, desc(classk), treadssk)
#Get records where classk is small.class
filter(star, classk == 'small.class')
#Get records where tradssk is at least 500
filter(star, treadssk >= 500)
#Get records where classk is small class and treadssk is at least 500
filter(star, classk == 'small.class' & treadssk >= 500)
#Group star by classk
stars_grouped <- group_by(star,classk)
head(stars_grouped)
#summarise grouped data by mean mean score
summarize(stars_grouped, Avgmath = mean(tmathssk))
star <- read_excel('datasets/star/star.xlsx')
districts <- read_csv('datasets/star/districts.csv')
head(star)
head(districts)
#left outer join star on districts
left_join(select(star,schidkn,tmathssk,treadssk), districts)
stars_Avgreading <- summarize(stars_grouped, Avgreading = mean(treadssk))
arrange(stars_Avgreading, desc(Avgreading))
#Using the pipe operator to connect the code ctrl+shift+M
star %>% 
  group_by(classk) %>% 
  summarize(Avg_reading = mean(treadssk)) %>% 
  arrange(desc(Avg_reading))
star %>% 
  group_by(schidkn) %>% 
  summarize(Avg_reading = mean(treadssk),Avg_math = mean(tmathssk)) %>% 
  arrange(schidkn)
#add new column 'row id'
star_pivot <- star %>% 
  select(c(schidkn,treadssk,tmathssk)) %>% 
  mutate(id = row_number())
#consolidate test scores in tmathssk and treadssk
star_long <- star_pivot %>% 
  pivot_longer(cols=c(treadssk,tmathssk),
               values_to = 'score', names_to = 'testtype')
#rename tmathssk and treadssk as math and reading
star_long <- star_long %>% 
mutate(testtype = recode(testtype,
                         'tmathssk' = 'math', 'treadssk' = 'reading'))
#confirm that all rows have been named either math or reading
distinct(star_long,testtype)
star_wide <- star_long %>% 
  pivot_wider(values_from = 'score',names_from='testtype')
#plot number of observations for each level of classk with bar plot
ggplot(data = star,
        aes(x=classk))+
geom_bar()
#plot number of observations for reading score with histogram
ggplot(data =star,
       aes(x = treadssk))+
  geom_histogram()
#plot number of observations for reading score specifying bin width and color
ggplot(data =star,
       aes(x = treadssk))+
  geom_histogram(binwidth = 25, fill = 'pink')
#plot reading score using boxplot
ggplot(data =star,
       aes(x = treadssk))+
  geom_boxplot()
#plot reading score using boxplot flipping reading score to y axis
ggplot(data =star,
       aes(y = treadssk))+
  geom_boxplot()
#boxplot for each level of class size
ggplot(data=star,
       aes(x=classk,y=treadssk))+
  geom_boxplot()
#relationship between tmathssk and treadssk using scatterplot
ggplot(data=star,
       aes(x=tmathssk,y=treadssk))+
  geom_point()
#relationship between tmathssk and treadssk (scatterplot) labeling the axis
ggplot(data=star,
       aes(x=tmathssk,y=treadssk))+
  geom_point()+
  xlab('math score')+ylab('reading score')+
  ggtitle('math versus reading score') 