NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimore <- subset(NEI,fips=="24510")

library(ggplot2)
g <- ggplot(NEIBaltimore, aes(factor(year),Emissions)) + geom_bar( stat="identity") + facet_grid(.~type) + labs(title = "PM2.5 Emissions of Baltimore by source type from 1999 to 2008", x= "Year", y="Emissions of PM2.5 in tons")
ggsave(filename="exploratory_data_analysis_week4_project/plot3.png", plot=g)