FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destfile <- "exploratory_data_analysis_week4_project/dataFile.zip"

if(!file.exists(destfile)) {
  download.file(FileUrl, 
                destfile = destfile, 
                method = "curl")
  unzip(destfile, exdir = "exploratory_data_analysis_week4_project")
}

NEI <- readRDS("exploratory_data_analysis_week4_project/summarySCC_PM25.rds")
SCC <- readRDS("exploratory_data_analysis_week4_project/Source_Classification_Code.rds")

totalEmission <- tapply(NEI$Emissions, NEI$year, sum)
png(filename = 'exploratory_data_analysis_week4_project/plot1.jpg')
barplot(totalEmission, xlab = " Years",ylab = "Total Emissions", main = "Total Emissions over the years")
dev.off()
