install.packages("dplyr")
SCC<- readRDS("Source_Classification_Code.rds")
summary_SCC <- readRDS("summarySCC_PM25.rds")

require(dplyr)
subsummarySCC <- summary_SCC[summary_SCC$fips=="24510", ]
TotalPerYear<-aggregate(Emissions~ year, subsummarySCC, sum)
clr=c("red", "green", "blue", "yellow")
graphplot<-barplot(height=(TotalPerYear$Emissions), 
                   names.arg=TotalPerYear$year,
                   xlab="YEAR", ylab=expression('total PM'[2.5]*' emission (ton)'),
                   main=expression('Baltimore City Total PM'[2.5]*' emissions in year'),col=clr)
dev.copy(png,"plot2.png", width=600, height=600)
dev.off()