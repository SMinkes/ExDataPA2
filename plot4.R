## install required packages
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## select only the coal and combustion rows from SCC
coal <- grepl("(Comb.*Coal)|(Coal.*Comb)",SCC[,3])
sub <- subset(SCC, coal)

## subset this from the NEI dataset
coalcomb <- subset(NEI, NEI$SCC %in% sub$SCC)

## Calcute the total sum of the Coal Combustion related EMissions per year
Totalcoalcomb <- ddply(coalcomb, .(year), numcolwise(sum))

# Open PNG device
png(filename="figures/plot4.png")

## plot the graph
plot(Totalcoalcomb, type="l", main="Total PM2.5 emission (Coal Combustion related) in the USA", xlab="Year", ylab="Emission PM2.5 (tons)",xaxt="n")
axis(1, at=c(1999,2002,2005,2008), labels=c(1999,2002,2005,2008))

# Turn off PNG device
dev.off()