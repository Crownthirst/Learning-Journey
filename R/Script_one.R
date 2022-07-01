getwd()
getwd()
file.exists('test-file.csv')
file.exists('test-folder/test-file.csv')
file.exists('../test-file.csv')
getwd()
file.exists('test-file.csv')
file.exists('../test-file.csv')
file.exists('../test-file.csv')
read.csv('datasets/star/districts.csv')
str(districts.csv)
districts <- read.csv('datasets/star/districts.csv')
star <-  read_xlsx('datasets/star/star.xlsx')
head(star)
districts <- read_csv('datasets/star/districts.csv')
spec(districts)
head(districts)
districts
star
view(star)
glimpse(star)
summary(star)
describe(star)
roster[3,2]
roster[3,1]
roster[2:4,1:3]
roster[2:4,]
roster[,c(1,3)]
roster$injured
roster$height
roster$name
write_csv(roster, 'output/roster-output-r.csv')
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