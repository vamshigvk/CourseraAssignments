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
wholedata.baltimore$city <- rep("Baltimore City", 1121 )
wholedata.california<- subset(wholedata,fips=="06037")
wholedata.california$city <- rep("California City", 995)

yearly.emission = rbind(wholedata.baltimore, wholedata.california)

g <- ggplot(yearly.emission, aes(x=factor(year),y=Emissions, fill = year)) +geom_bar(aes(fill=city),stat="identity")+ facet_grid(scales="free", space="free", .~ city) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")) 
ggsave(filename="exploratory_data_analysis_week4_project/plot6.png", plot=g)