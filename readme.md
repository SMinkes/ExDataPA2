###Exploratory Data Analysis, Course project 2
The overall goal of this analysis is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008.

####Questions:
**Plot 1:**
    Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

**Plot 2:**
    Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? 

**Plot 3:**
    Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 

**Plot 4:**
    Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

**Plot 5:**
    How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

**Plot 6:**
    Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions?

#### Script and plot
For each of the questions there is a script. It takes the data from the working directory, which can be downloaded here: [data](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip). Each script generates their own plot in the folder *plots*. 

###National Emissions Inventory    
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. For each year, the number of tons of PM2.5 emitted from a specific type of source for the entire year is recorded.    

The analysis plots are based on the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 

####Variables:
* fips: A five-digit number (represented as a string) indicating the U.S. county                  
* SCC: The name of the source as indicated by a digit string (see source code classification table)           
* Pollutant: A string indicating the pollutant           
* Emissions: Amount of PM2.5 emitted, in tons            
* type: The type of source (point, non-point, on-road, or non-road)              
* year: The year of emissions recorded    