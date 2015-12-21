##Set working directory
setwd("C:/DataScienceCoursera/Exploratory Data Analysis/Week 3/Course project/")

##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
library(dplyr)

##merge data
data <- merge(NEI, SCC, by="SCC")

##filter data, select needed data, group this data by year and type and lastly summarise data so the Emissions get summarized. 
dataFiltered <- data %>%
                    filter(grepl("coal", Short.Name, ignore.case=TRUE)) %>%
                        select(Emissions, year) %>%
                            group_by(year) %>%
                                summarise(sum.Emissions = sum(Emissions))


##Save and plot barplot.
png('plot4.png')
barplot(height=dataFiltered$sum.Emissions, names.arg=dataFiltered$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions from coal sources from various years'))
dev.off()