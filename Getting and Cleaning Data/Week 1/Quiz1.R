setwd("C:/DataScienceCoursera/Getting and Cleaning Data/Week 1/")

data <- read.csv("getdata-data-ss06hid.csv", na.strings = "NA")

##1
##subset
data2 <- data$VAL


##Amount of rows where houseworth is over 1 MILLION DOLLARRSS
data2 <- length(which(data$VAL == 24))
## 53
data2

##2
## 'Each tidy data table contains information about only one type of observation.' 
## because: 'Family type and employment status' 
data$FES

##3
install.packages(xlsx)
library(xlsx)

rowIndex = 18 : 23
colIndex = 7 : 15

data <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = rowIndex, colIndex = colIndex, header = TRUE)

sum(dat$Zip*dat$Ext,na.rm=T)


##4
install.packages("XML")
library(XML)

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

test <- xpathSApply(rootNode, "//zipcode", xmlValue)

##answer is '127'
length(which(test == 21231))

##5
install.packages("data.table")
library(data.table)
dt2 <- read.csv("sm_subcribers-list.csv")
dt <- fread('getdata-data-ss06pid (1).csv', sep = ",", header= TRUE)


##Answer
DT[,mean(pwgtp15),by=SEX]




