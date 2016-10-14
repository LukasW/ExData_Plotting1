if(!exists("loadHouseholdPowerConsumptionData", mode = "function"))
    source("common.R")

## Generates the GlobalActivePowerByDatePlot on the current graphical device.
generateGlobalActivePowerByDatePlot <- function(ylab) {
    hpc <- loadHouseholdPowerConsumptionData()
    plot(hpc$timestamp, hpc$Global_active_power, type="n", xlab = "", ylab = ylab)
    lines(hpc$timestamp, hpc$Global_active_power)
}

## Export the GlobalActivePowerByDatePlot as png.
exportGlobalActivePowerByDatePlot <- function() {
    png("plot2.png")
    generateGlobalActivePowerByDatePlot("Global Active Power (kilowatts)")
    dev.off()
}

exportGlobalActivePowerByDatePlot()