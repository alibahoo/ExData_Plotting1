source("get_consumption_data.R")

#caching mechanism for large house hold power consumption data
cacher <- cache_household_power_consumption()
DT <- get_household_power_consumption(cacher)

png("plot1.png", width = 480, height = 480)
with(DT, hist(Global_active_power, col="red", 
              xlab = "Global Active Power (kilowatts)",
              main = "Global Active Power" ))

dev.off()
