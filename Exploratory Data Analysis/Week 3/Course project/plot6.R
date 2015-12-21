##Set working directory
setwd("C:/DataScienceCoursera/Exploratory Data Analysis/Week 3/Course project/")

##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles 
##County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)

##filter data, select needed data, group this data by year and type and lastly summarise data so the Emissions get summarized. 
dataFiltered <- NEI %>%
                    filter((NEI$fips == "24510" | NEI$fips == "06037") & NEI$type=="ON-ROAD") %>%
                        select(Emissions, year, fips) %>%
                            group_by(year, fips) %>%
                                summarise(sum.Emissions = sum(Emissions))

##Save and plot ggplot
png("plot6.png", width=1040, height=480)
g <- ggplot(dataFiltered, aes(factor(year), sum.Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()