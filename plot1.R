## install required packages
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calcute the total sum of the PM2.5 EMissions per year
TotalEm <- ddply(NEI, .(year), numcolwise(sum))

# Open PNG device
png(filename="figures/plot1.png")

## Plot the first line
plot(TotalEm, type="l", main="Total PM2.5 emission from all sources in the USA", xlab="Year", ylab="Emission PM2.5 (tons)", xaxt="n")
axis(1, at=c(1999,2002,2005,2008), labels=c(1999,2002,2005,2008))

# Turn off PNG device
dev.off()