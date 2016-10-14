if(!exists("loadHouseholdPowerConsumptionData", mode = "function"))
    source("common.R")

if(!exists("generateGlobalActivePowerByDatePlot", mode = "function"))
    source("plot2.R")

if(!exists("generateMeteringByDatePlot", mode = "function"))
    source("plot3.R")

## Generate the VoltageByDatePlot.
generateVoltageByDatePlot <-function() {
    hpc <- loadHouseholdPowerConsumptionData()
    plot(hpc$timestamp, hpc$Voltage, type="n", xlab = "datetime", ylab = "Voltage")
    lines(hpc$timestamp, hpc$Voltage)
    
}

## Generate the GlobalReactivePowerByDatePlot
generateGlobalReactivePowerByDatePlot <-function() {
    hpc <- loadHouseholdPowerConsumptionData()
    plot(hpc$timestamp, hpc$Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power")
    lines(hpc$timestamp, hpc$Global_reactive_power)
    
}

## Generate the overview plot and exports it as png
exportOverviewPlot <- function() {
    png("plot4.png")
    par(mfrow=c(2,2))
    generateGlobalActivePowerByDatePlot("Global Active Power")
    generateVoltageByDatePlot()
    generateMeteringByDatePlot("n")
    generateGlobalReactivePowerByDatePlot()
    dev.off()
}

exportOverviewPlot()
