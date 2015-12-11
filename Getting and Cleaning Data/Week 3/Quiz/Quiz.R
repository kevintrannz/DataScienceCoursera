setwd("C:/DataScienceCoursera/Getting and Cleaning Data/Week 3/Quiz/")

data <- read.csv("getdata-data-ss06hid.csv", header = TRUE)


##logical vector identifies the householdas on greater than 10 acres + 10k worth agriculture products.
## 1
agricultureLogical <- data$ACR == 3 & data$AGS == 6
which(agricultureLogical)
which(agricultureLogical)


##2
install.packages("jpeg")
library(jpeg)
jeff <- readJPEG("getdata-jeff (1).jpg",  native=TRUE)

quantile(jeff, c(0.30, 0.80))


##3
library(dplyr)
data <- read.csv("getdata-data-GDP.csv", header = TRUE)
data2 <- read.csv("getdata-data-EDSTATS_Country.csv", header = TRUE)




data %>%
    setNames(X.2, "CountryCode")

test <- inner_join(data, data2, by = "CountryCode")
    

data$X.2
