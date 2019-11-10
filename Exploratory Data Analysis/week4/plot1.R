NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmission <- tapply(NEI$Emissions, NEI$year, sum)
png(filename = 'exploratory_data_analysis_week4_project/plot1.jpg')
barplot(totalEmission, xlab = " Years",ylab = "Total Emissions", main = "Total Emissions over the years")
dev.off()
