install.packages("ggplot2")
SCC<- readRDS("Source_Classification_Code.rds")
summary_SCC <- readRDS("summarySCC_PM25.rds")

library(ggplot2)
subsummarySCC <- summary_SCC[summary_SCC$fips=="24510", ]
TotalPerYear<-aggregate(Emissions~ year + type, subsummarySCC, sum)
clr=c("red", "green", "blue", "yellow")

graphplot<-ggplot(TotalPerYear, aes(year, Emissions, color = type))

graphplot2<- graphplot + geom_line() + xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')


ggsave("plot3.png", graphplot2) 

