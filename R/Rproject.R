library(tidyverse)
library(psych)
library(tidymodels)
#read data in, select the columns we need
mpg <- read_csv('datasets/mpg/mpg.csv') %>% 
  select(mpg,weight,horsepower,origin,cylinders)
head(mpg)
describe(mpg)
#count origin
mpg %>% 
  count(origin)
#Origins broken down by cylinders
mpg %>% 
  count(origin,cylinders) %>% 
pivot_wider(values_from = n, names_from =cylinders)
#descriptive statistics by group
mpg %>% 
  select(mpg,origin) %>% 
  describeBy(group = "origin")
#plot the distribution of mpg
ggplot(data = mpg,
       aes(x=mpg))+
  geom_histogram()+
  xlab('mpg')+ylab('count')+
  ggtitle('distribution of mpg')
#distribution of mpg by origin
ggplot(data = mpg,
       aes(x=origin,y=mpg))+
  geom_boxplot()+
  xlab('origin')+ylab('mpg')+
  ggtitle('mpg by origin')
#Histogram of origin faceted by origin
ggplot(data = mpg,
       aes(x=mpg))+
  geom_histogram()+
  facet_grid(~origin)
#filter out american and european cars
mpg_filtered <- filter(mpg, origin =='USA'|origin =='Europe')
#hypotheses testing
#dependent variable ~ by independent vairaible
t.test(mpg~origin,data=mpg_filtered)
#print correlation matrix for the continuous variables in mpg
select(mpg,mpg:horsepower) %>% 
  cor()
#visualize relationship between weight and mileage
ggplot(data=mpg,
       aes(x=weight,y=mpg))+
  geom_point()+
  xlab('weight(pounds)')+ylab('mileage(mpg')+
  ggtitle('relationship between weight and mileage')
#alternatively use pairs() to plot all combinations on the correlation matrix
select(mpg,mpg:horsepower) %>% 
  pairs()
#linear regression 
mpg_regression <- lm(mpg~weight,data=mpg)
summary(mpg_regression)
#fit regression line into the correlation model
ggplot(data=mpg,
       aes(x=weight,y=mpg))+
  geom_point()+
  xlab('weight(pounds)')+ylab('mileage(mpg')+
  ggtitle('relationship between weight and mileage')+
  geom_smooth(method=lm)

#Test/train split
#set seed to generate the same random numbers from data
set.seed(1234)
#split data
mpg_split <- initial_split(mpg)
mpg_train <- training(mpg_split)
mpg_test <- testing(mpg_split)
#confirm how many rows and columns are in each dataset
dim(mpg_train)
dim(mpg_test)
#specify what kind of model this is
lm_spec <- linear_reg()
#fit the model to the data
lm_fit <- lm_spec %>% 
  fit(mpg~weight,data=mpg_train)
#get co-efficient and p-value of training model
tidy(lm_fit)
glance(lm_fit)
#make predictions on the mpg_test data
mpg_results <- predict(lm_fit,new_data = mpg_test) %>% 
  bind_cols(mpg_test)
mpg_results
#find the rsquar of the mpg_test data using the rsq() function
rsq(data = mpg_results, truth = mpg, estimate = .pred)