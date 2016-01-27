##Load packages
library(dplyr)
library(ggplot2)
library(rmarkdown)

####Loading and cleaning the data.
##Set wd, load data and check it out
setwd("C:/DataScienceCoursera/Reproducable research/Week 4/Project/")
data <- read.csv("repdata-data-StormData.csv", header = TRUE)
head(data)

##Function that returns values in billions. 
multiplyConv <- function(value, char) {
    multiply <- 1
    
    if(char == "H") {
        multiply <- 100
    }
    else if (char == "K") {
        multiply <- 1000
    }
    else if (char == "M") {
        multiply <- 1000000
    }
    else if (char == "B") {
        multiply <- 1000000000
    }
    
    return(value * multiply / 1000000000)
}

###The steps below could have been done in just one step. However I felt that made what was happening unclear.
##Select only needed columns and convert the exponential columns to uppercase
dataN <- data %>% mutate(PROPDMGEXP =  toupper(PROPDMGEXP), CROPDMGEXP =  toupper(CROPDMGEXP)) 

##Calculate the property & crop damage using the 'MultiplyConv' function. Then select the needed columns for the calculations.
dataN <- dataN %>% rowwise() %>% mutate(Propdmg = multiplyConv(PROPDMG, PROPDMGEXP), CropDmg = multiplyConv(CROPDMG, CROPDMGEXP))
dataN <- dataN %>% select(EVTYPE, FATALITIES, INJURIES, Propdmg, CropDmg)


##Total fatalities
sumFata <- dataN %>% group_by(EVTYPE) %>% summarize(Fatalities = sum(FATALITIES)) %>% arrange(desc(Fatalities))
sumFataTop <- sumFata[1:10,]

##Total injuries
sumInj <- dataN %>% group_by(EVTYPE) %>% summarize(Injuries = sum(INJURIES)) %>% arrange(desc(Injuries))
sumInjTop <- sumInj[1:10,]

##Total economical damage
sumEcoDmg <- dataN %>% group_by(EVTYPE) %>%  summarize(EcoDmg = sum(CropDmg) + sum(Propdmg)) %>% arrange(desc(EcoDmg))
sumEcoTop <- sumEcoDmg[1:10,]

##plot fatalities
ggplot(data=sumFataTop, aes(x=EVTYPE, y=Fatalities)) + 
    geom_bar(stat="identity") + xlab("Event type") + ylab("Total fatalities") + 
    ggtitle("Fatalities By Event Type") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

##plot injuries
ggplot(data=sumInjTop, aes(x=EVTYPE, y=Injuries)) + 
    geom_bar(stat="identity") + xlab("Event type") + ylab("Total injuries") + 
    ggtitle("Injuries By Event Type") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

##Plot economic consequences
ggplot(data=sumEcoTop, aes(x=EVTYPE, y=EcoDmg)) + 
    geom_bar(stat="identity") + xlab("Event type") + ylab("Total injuries") + 
    ggtitle("Economic damages By Event Type") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
