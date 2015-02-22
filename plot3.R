## install required packages
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Create the subset for Baltimore
Baltimore <- subset(NEI, fips == "24510")

## Emission values separated for Baltimore
TotalBaltSep <- ddply(Baltimore, .(year, type), numcolwise(sum))

# Open PNG device
png(filename="figures/plot3.png")

## create the plot with ggplot
ggplot(TotalBaltSep, aes(year, Emissions)) + geom_line() +facet_wrap(~ type, nrow = 2, ncol = 2) + scale_x_continuous(breaks=c(1999,2002,2005,2008)) + labs(list(title = "Total PM2.5 emission for Baltimore City (MD) by type.", y = "Emission PM2.5 (tons)", x = "Year"))

# Turn off PNG device
dev.off()