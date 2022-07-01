library(tidyverse)
library(psych)
library(tidymodels)
library(readxl)
#read data from excel
ais <- read_excel('datasets/ais/ais.xlsx')
#group by sex and visualize relationship
ais_grouped <- group_by(ais,sex)
ggplot(data = ais_grouped,
        aes(x=sex,y=rcc))+
  geom_boxplot()
#or
ggplot(data = ais,
       aes(x=rcc))+
  geom_histogram()+
  facet_grid(~sex)
#correlation matrix of the relevant variables
select(ais,rcc:wt) %>% 
  cor()
#or
ais %>% 
  select(-c(sport,sex)) %>% 
  cor()
#check if there is a diffeerence in mean of two groups
t.test(rcc~sex,data=ais)
#regress ht on wt
ais_regression <- lm(ht~wt,data=ais)
ais_regression
summary(ais_regression)
#Visualize the relationship between height and weight
ggplot(data = ais,
       aes(x = wt, y = ht))+
  geom_point()+
  xlab('weight(pounds)')+ylab('height(cm)')+
  ggtitle('Relationship between weight and height')+
  geom_smooth(method = lm)
#split regression model into training and test
set.seed(1234)
ais_split <- initial_split(ais)
ais_train <- training(ais_split)
ais_test <- testing(ais_split)
#train 
ais_spec <- linear_reg()
ais_fit <- ais_spec %>% 
  fit(ht~wt,data = ais_train)
tidy(ais_fit)
glance(ais_fit)
#test model on test data
ais_result <- predict(ais_fit,new_data=ais_test) %>% 
  bind_cols(ais_test)
ais_result
#find the rsq of the result for the test data
rsq(data = ais_result, truth = ht, estimate = .pred)