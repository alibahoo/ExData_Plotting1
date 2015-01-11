library(data.table)
# Data file is assumed to be in the workspace already.
dataFile <- "household_power_consumption.txt"

DT <- fread(
    paste("grep ^[12]/2/2007", dataFile),
    na.strings = c("?", "")
)

setnames(DT, colnames(fread(dataFile, nrows=0)))

png("plot1.png", width = 480, height = 480)
with(DT, hist(Global_active_power, col="red", 
              xlab = "Global Active Power (kilowatts)",
              main = "Global Active Power" ))

dev.off()
