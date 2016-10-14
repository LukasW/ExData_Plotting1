if(!exists("loadHouseholdPowerConsumptionData", mode = "function"))
    source("common.R")

## Exports the global active power histogram as png file
exportGlobalActivePowerHistogram <- function() {
    hpc <- loadHouseholdPowerConsumptionData()
    png("plot1.png")
    hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
    dev.off()
}

exportGlobalActivePowerHistogram()