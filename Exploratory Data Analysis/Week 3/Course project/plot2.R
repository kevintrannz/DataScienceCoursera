##Set working directory
setwd("C:/DataScienceCoursera/Exploratory Data Analysis/Week 3/Course project/")

##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

##load dplyr package
library(dplyr)

##filter data, select needed data, group this data by year and type and lastly summarise data so the Emissions get summarized. 
data <- NEI %>%
            filter(fips == "24510") %>%
                select(Emissions, year) %>%
                    group_by(year) %>%
                        summarise(sum.Emissions = sum(Emissions))

##Save and plot barplot.
png('plot2.png')
barplot(height=data$sum.Emissions, names.arg=data$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in Baltimore City, MD emissions at various years'))
dev.off()