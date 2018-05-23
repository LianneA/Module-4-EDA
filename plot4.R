SCC<- readRDS("Source_Classification_Code.rds")
summary_SCC <- readRDS("summarySCC_PM25.rds") 

SCC_Coal<- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subset_Coal<- SCC[SCC_Coal, ]

set_Merge<- merge(summary_SCC,subset_Coal, by="SCC")
totalEmissions <- tapply(set_Merge$Emissions, set_Merge$year, sum)

barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")
dev.copy(png,"plot4.png", width=600, height=600)
dev.off()