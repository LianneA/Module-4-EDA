install.packages("dplyr")
SCC<- readRDS("Source_Classification_Code.rds")
summary_SCC <- readRDS("summarySCC_PM25.rds")

require(dplyr)

TotalPerYear<-aggregate(Emissions~ year, summary_SCC, sum)
clr=c("red", "green", "blue", "yellow")
graphplot<-barplot(height=(TotalPerYear$Emissions/1000000), 
        names.arg=TotalPerYear$year,
        xlab="YEAR", ylab=expression('total PM'[2.5]*' emission (in Millions)'),
        main=expression('Total PM'[2.5]*' emissions in year'),col=clr)
dev.copy(png,"plot1.png", width=600, height=600)
dev.off()