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

## subset the word motor from the short names in the SCC dataset, subset only the onroad/nonroad vehicles, subset the 
motor <- subset(SCC,grepl("Motor", Short.Name, ignore.case=TRUE))
motor <- subset(motor,grepl("onroad", Data.Category, ignore.case=TRUE))
motor_emissions <- subset(NEI, NEI$SCC %in% motor$SCC)

## subset Baltimore and Los Angelos
BaltimoreMotor <- subset(motor_emissions, fips == "24510")
LAMotor <- subset(motor_emissions, fips == "06037")

## Totals for Baltimore and LA per year, combine it in one dataset
TotalMotorBalt <- ddply(BaltimoreMotor, .(year), numcolwise(sum))
TotalMotorBalt$City <- "Baltimore"
TotalMotorLA <- ddply(LAMotor, .(year), numcolwise(sum))
TotalMotorLA$City <- "Los Angeles"
combo <- rbind(TotalMotorBalt, TotalMotorLA)

# Open PNG device
png(filename="figures/plot6.png")

## plot the graph
ggplot(combo, aes(year, Emissions)) + geom_line() +facet_wrap(~ City, nrow = 1, ncol = 2) + labs(list(title = "Total PM2.5 emission (motor vehicle related sources).", y = "Emission PM2.5 (tons)", x = "Year")) + scale_x_continuous(breaks=c(1999,2002,2005,2008))

# Turn off PNG device
dev.off()