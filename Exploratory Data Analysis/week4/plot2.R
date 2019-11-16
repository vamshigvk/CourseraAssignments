FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destfile <- "exploratory_data_analysis_week4_project/dataFile.zip"

if(!file.exists(destfile)) {
  download.file(FileUrl, 
                destfile = destfile, 
                method = "curl")
  unzip(destfile, exdir = "exploratory_data_analysis_week4_project")
}


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimore <- subset(NEI,fips=="24510")
totalEmissionBaltimore <- tapply(NEIBaltimore$Emissions, NEIBaltimore$year, sum)
png(filename = 'exploratory_data_analysis_week4_project/plot2.jpg')
barplot(totalEmissionBaltimore, xlab = "Years",ylab = "Total Emissions in Baltimore", main = "Emissions over the years")
dev.off()
