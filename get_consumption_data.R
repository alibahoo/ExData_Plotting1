library(data.table)
# Data file is assumed to be in the workspace already.
dataFile <- "household_power_consumption.txt"

#Caching structure for household_power_consumption data table 
#between dates 2007-02-01 and 2007-02-02

cache_household_power_consumption <- function(datafile = dataFile) {
    x <<- NULL
    
    set <- function(y) {
        x <<- y
    }
    get <- function() x
    cache <- function()
    {
        DT <- fread(
            paste("grep ^[12]/2/2007", dataFile),
            na.strings = c("?", "")
        )
        
        setnames(DT, colnames(fread(dataFile, nrows=0)))
        
        DT$DateTime <- as.POSIXct(strptime(paste(DT$Date, DT$Time), format = "%d/%m/%Y %H:%M:%S"))
        return(DT)
    }
    
    list(set = set, get = get,
         cache = cache)
}


## Get or cache house hold power consumption data table

get_household_power_consumption <- function(x, ...) {
    DT <- x$get()
    if(!is.null(DT)) {
        message("getting cached data")
        return(DT)
    }
    DT <- x$cache()
    x$set(DT)
    DT
}