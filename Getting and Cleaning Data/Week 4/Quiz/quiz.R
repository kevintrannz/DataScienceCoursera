setwd("C:/DataScienceCoursera/Getting and Cleaning Data/Week 4/Quiz/")

##1
data <- read.csv("getdata-data-ss06hid.csv", header = TRUE)

test2 <- strsplit(names(data), "wgtp")

test2[[123]]


##2
data <- read.csv("getdata-data-GDP.csv", skip=4, nrows=190)

dataEx <- gsub(",", "", data$X.4)

dataEx <- as.numeric(dataEx)

mean(dataEx, na.rm = TRUE)

##3
library(countrycode)
data <- read.csv("getdata-data-GDP.csv")
countrycode(data$X,"cown","country.name")

data$X

##3
country.name(data$X)
grep("^US", data$X)

##4
GDP <- read.csv("getdata-data-GDP.csv", header=TRUE)
GDP$X

eduData <- read.csv("getdata-data-EDSTATS_Country.csv", header=TRUE)

# Merge the two datasets
mergedData <- merge(GDP,eduData,by.x="X", by.y="CountryCode")

fyJune <- grep('Fiscal year end: June', mergedData$Special.Notes)
length(fyJune)


#4
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

##part 1
times <- nrow(as.data.frame(grep('2012', sampleTimes)))

##part 2
times <- format(sampleTimes, "%a-%y-%m")

nrow(as.data.frame(grep('ma-12', times)))
