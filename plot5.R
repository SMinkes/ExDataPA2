## install required packages
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset the word motor from the short names in the SCC dataset
## subset only the onroad/nonroad vehicles
## subset this selection from the NEI dataset 
motor <- subset(SCC,grepl("Motor", Short.Name, ignore.case=TRUE))
motor <- subset(motor,grepl("onroad", Data.Category, ignore.case=TRUE))
motor_emissions <- subset(NEI, NEI$SCC %in% motor$SCC)

## subset Baltimore
BaltimoreMotor <- subset(motor_emissions, fips == "24510")

## Totals for Baltimore per year
TotalMotorBalt <- ddply(BaltimoreMotor, .(year), numcolwise(sum))

# Open PNG device
png(filename="figures/plot5.png")

## plot the graph
plot(TotalMotorBalt, type="l", main="Total PM2.5 emission (Motor vehicle related) in Baltimore", xlab="Year",ylab="Emission PM2.5 (tons)", xaxt="n")
axis(1, at=c(1999,2002,2005,2008), labels=c(1999,2002,2005,2008))

# Turn off PNG device
dev.off()