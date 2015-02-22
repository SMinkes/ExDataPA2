## install required packages
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Open PNG device
png(filename="figures/plot2.png")

## Create the subset for Baltimore
Baltimore <- subset(NEI, fips == "24510")
TotalBalt <- ddply(Baltimore, .(year), numcolwise(sum))

## Plot the Emissions for Baltimore 
plot(TotalBalt, type="l", main="Total PM2.5 emission for Baltimore", xlab="Year", ylab="Emission PM2.5 (tons)", xaxt="n")
axis(1, at=c(1999,2002,2005,2008), labels=c(1999,2002,2005,2008))

# Turn off PNG device
dev.off()