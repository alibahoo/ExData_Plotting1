library(data.table)
# Data file is assumed to be in the workspace already.
dataFile <- "household_power_consumption.txt"

DT <- fread(
    paste("grep ^[12]/2/2007", dataFile),
    na.strings = c("?", "")
)

setnames(DT, colnames(fread(dataFile, nrows=0)))

DT$DateTime <- as.POSIXct(strptime(paste(DT$Date, DT$Time), format = "%d/%m/%Y %H:%M:%S"))
class(DT$DaTime)
png("plot2.png", width = 480, height = 480)
with(DT, plot( y = Global_active_power, x = DateTime, type = "l",  
              ylab = "Global Active Power (kilowatts)", xlab = NA
              ))

dev.off()
