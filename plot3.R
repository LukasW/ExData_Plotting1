if(!exists("loadHouseholdPowerConsumptionData", mode = "function"))
    source("common.R")

## Generates the MeteringByDatePlot
## The bty parameter is passed to the legend function (see in the legend documation)
generateMeteringByDatePlot <- function(bty) {
    hpc <- loadHouseholdPowerConsumptionData()
    plot(hpc$timestamp, hpc$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
    lines(hpc$timestamp, hpc$Sub_metering_1)
    lines(hpc$timestamp, hpc$Sub_metering_2, col="red")
    lines(hpc$timestamp, hpc$Sub_metering_3, col="blue")
    legend("topright", 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col = c("black", "red", "blue"), 
           lty = c(1,1,1,1),
           bty = bty)
}

exportMeteringByDatePlot  <- function() {
    png("plot3.png")
    generateMeteringByDatePlot("y")
    dev.off()
}

exportMeteringByDatePlot()