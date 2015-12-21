##Set working directory
setwd("C:/DataScienceCoursera/Exploratory Data Analysis/Week 3/Course project/")

##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(dplyr)

##filter data, select needed data, group this data by year and type and lastly summarise data so the Emissions get summarized. 
dataFiltered <- NEI %>%
                    filter(NEI$fips=="24510" & NEI$type=="ON-ROAD") %>%
                        select(Emissions, year) %>%
                             group_by(year) %>%
                                summarise(sum.Emissions = sum(Emissions))


##Save and plot ggplot
png("plot5.png", width=840, height=480)
g <- ggplot(dataFiltered, aes(year, sum.Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()