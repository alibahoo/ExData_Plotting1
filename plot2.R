source("get_consumption_data.R")

#caching mechanism for large house hold power consumption data
cacher <- cache_household_power_consumption()
DT <- get_household_power_consumption(cacher)

png("plot2.png", width = 480, height = 480)
with(DT, plot( y = Global_active_power, x = DateTime, type = "l",  
              ylab = "Global Active Power (kilowatts)", xlab = NA
              ))

dev.off()
