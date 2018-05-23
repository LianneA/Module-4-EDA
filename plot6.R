SCC<- readRDS("Source_Classification_Code.rds")
summary_SCC <- readRDS("summarySCC_PM25.rds")


SCC_Vehicle<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[SCC_Vehicle, ]

merge_baltimore<-merge(subset(summary_SCC, fips == "24510"), subsetSCC, by="SCC")

merge_baltimore$city <- "Baltimore City"

merge_LA<-merge(subset(summary_SCC, fips == "06037"), subsetSCC, by="SCC")

merge_LA$city <- "Los Angeles County"

merge_ALL <- rbind(merge_baltimore, merge_LA)

merge_ALL <- aggregate(Emissions ~ year + city, merge_ALL, sum)

g <- ggplot(merge_ALL, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")


ggsave("plot6.png", graphplot2)