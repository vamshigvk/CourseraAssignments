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

mv <- grepl("veh", SCC$Short.Name , ignore.case = TRUE)

SCC.mv <- SCC[mv, ]
wholedata = merge(NEI, SCC.mv, by.x = "SCC", by.y = "SCC")
wholedata.baltimore<- subset(wholedata,fips=="24510")

yearly.emission <- tapply(wholedata.baltimore$Emissions, wholedata.baltimore$year, sum)

png(filename = 'exploratory_data_analysis_week4_project/plot5.jpg')
barplot(yearly.emission , main = "Yearly Emission of PM2.5  by motor vehicles in Baltimore City")
dev.off()