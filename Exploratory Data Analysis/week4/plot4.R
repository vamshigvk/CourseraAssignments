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

coal <- grepl("coal", SCC$Short.Name , ignore.case = TRUE)
comb <- grepl("comb", SCC$Short.Name , ignore.case = TRUE)

SCC.coal.comb.scc <- SCC[coal & comb, ]
wholedata = merge(NEI, SCC.coal.comb.scc, by.x = "SCC", by.y = "SCC")
yearly.emission <- tapply(wholedata$Emissions, wholedata$year, sum)

png(filename = 'exploratory_data_analysis_week4_project/plot4.jpg')
barplot(yearly.emission , main = "Yearly Emission of PM2.5  by coal combusion")
dev.off()