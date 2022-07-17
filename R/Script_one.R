#Get working directory
getwd()
#check if file exists in a folder
file.exists('test-file.csv')
file.exists('test-folder/test-file.csv')
file.exists('../test-file.csv')
file.exists('test-file.csv')
file.exists('../test-file.csv')
#read a csv file into R
read.csv('datasets/star/districts.csv')
#check the structure of a dataset
str(districts.csv)
districts <- read.csv('datasets/star/districts.csv')
star <-  read_xlsx('datasets/star/star.xlsx')
#view the first few rows of a dataset
head(star)
districts <- read_csv('datasets/star/districts.csv')
#examine the column specifications for a dataframe
spec(districts)
#invoke a spreadsheet style data viewer
view(star)
glimpse(star)
#summarize values in a dataset
summary(star)
#descriptive statistics of columns in a dataset
describe(star)
roster[3,2]
roster[3,1]
roster[2:4,1:3]
roster[2:4,]
roster[,c(1,3)]
roster$injured
roster$height
roster$name
#write data to csv
write_csv(roster, 'output/roster-output-r.csv')
#write data to excel
write_xlsx(roster,'output/roster-output-r.xlsx')
skill <- c('Excel','PowerBI','SQL','Python','R')
skill[c(1,4)]
x <- c(1,2,3,4)
y <- c(TRUE,FALSE,TRUE,FALSE)
z <- x*y
install.packages('nycflights13')
library(nycflights13)
nycflights13.datasets
data(package = 'nycflights13')
data(airports)
head(airports)
airports
view(airports)
summary(airports)
weather
view(weather)
weathers <- weather[10:12,4:7]
write_csv(weathers,'output/weathers.csv')
write_xlsx(weathers,'output/weathers.xlsx')





library(tidyverse)
library(lubridate)
#get today's date 
today()
#get todays date and time
now()
#use the ymd function to change objects to date format
ymd("2020-07-31")
#format date time as date only
as_date(now())
#create a new folder
dir.create ("destination_folder")
#create a new file
file.create (“new_csv_file.csv”) 
#copy a file
file.copy ('ch-2.xlsx' , 'C:/Users/user/Documents/GitHub/Advancing-into-analytics')
#delete an R file
unlink('filename')