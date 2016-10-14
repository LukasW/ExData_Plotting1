## Downloads and zips the required dataset
downloadHouseholdPowerConsumptionData <- function() {
    dir.create(file.path("./data"), showWarnings = FALSE)
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/household_power_consumption.zip")
    unzip(zipfile = "./data/household_power_consumption.zip", exdir = "./data")
    file.remove("./data/household_power_consumption.zip")
}

## Loads the relevant data frame (on 1/2/2007 and 2/2/2007)
## Implements caching behaviour: If there already exists an object call householdPowerConsumptionData this object is returned
loadHouseholdPowerConsumptionData <- function() {   
    if (!exists("householdPowerConsumptionData")) {
        allData <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", as.is = TRUE)
        subSet <- subset(allData, Date=="1/2/2007" | Date=="2/2/2007") 
        householdPowerConsumptionData <<- cbind(timestamp = as.POSIXct(paste(subSet$Date, subSet$Time), format="%d/%m/%Y %H:%M:%S"), subSet[,3:9])
    }
    householdPowerConsumptionData
}