##Set working directory
setwd("C:/DataScienceCoursera/Exploratory Data Analysis/Week 3/Course project/")

##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
##make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##load dplyr package
library(dplyr)

##Get needed data using the dplyr chaining command.
aggregatedTotalByYear <- NEI %>%
                            select(Emissions, year) %>%
                                group_by(year) %>%
                                    summarise(sum.Emissions = sum(Emissions))

##Save and plot barplot
png('plot1.png')
barplot(height=aggregatedTotalByYear$sum.Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()