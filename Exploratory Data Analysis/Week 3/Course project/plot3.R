##Set working directory
setwd("C:/DataScienceCoursera/Exploratory Data Analysis/Week 3/Course project/")

##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four 
##sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions 
##from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
library(dplyr)

##filter data, select needed data, group this data by year and type and lastly summarise data so the Emissions get summarized. 
data <- NEI %>%
            filter(fips == "24510") %>%
                select(Emissions, year, type) %>%
                    group_by(year, type) %>%
                        summarise(sum.Emissions = sum(Emissions))


##save and plot ggplot.
png("plot3.png", width=640, height=480)
g <- ggplot(data, aes(year, sum.Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
