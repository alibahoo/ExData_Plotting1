source("get_consumption_data.R")

# caching mechanism for large house hold power consumption data
# comment the line below after running once 
#cacher <- cache_household_power_consumption()
DT <- get_household_power_consumption(cacher)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4.3,5,2,2))
with(DT, plot( y = Global_active_power, x = DateTime, type = "l",  
               ylab = "Global Active Power (kilowatts)", xlab = NA
))

with(DT, plot( y = Voltage, x = DateTime, type = "l"))

with(DT, plot( y = Sub_metering_1, x = DateTime, type = "l",  
              ylab = "Energy sub metering", xlab = NA
              ))
with(DT, lines(x = DateTime, y = Sub_metering_2, col = "red"))
with(DT, lines(x = DateTime, y = Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty = c(1,1,1))

with(DT, plot( y = Global_reactive_power, x = DateTime, type = "l"))

dev.off()
