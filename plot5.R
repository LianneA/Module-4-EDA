SCC<- readRDS("Source_Classification_Code.rds")
summary_SCC <- readRDS("summarySCC_PM25.rds")


SCC_Vehicle<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

subsetSCC <- SCC[SCC_Vehicle, ]

set_Merge <- merge(subset(summary_SCC, fips == "24510"), subsetSCC, by="SCC")

totalEmissions <- tapply(set_Merge$Emissions, set_Merge$year, sum)
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from motor sources in Baltimore")
dev.copy(png,"plot5.png", width=600, height=600)
dev.off()