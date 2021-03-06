mydf<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec=".") ##, nrows = 100)

library(dplyr)
mydf.1 <- filter(mydf, Date == "2/2/2007" | Date == "1/2/2007" )  ## dd / mm/ yy
rm(mydf)
## convert all columns into proper data types
mydf.1 <- mutate(mydf.1, Global_active_power = as.numeric(as.character(Global_active_power))
                 , Global_active_power = as.numeric(as.character(Global_active_power))
                 , Voltage = as.numeric(as.character(Voltage))
                 , DateTime = paste(Date, Time) 
                 , DateTime = as.POSIXct(as.character(DateTime), format= "%d/%m/%Y %H:%M:%S" ) 
                 , Sub_metering_1 = as.numeric(as.character(Sub_metering_1))
                 , Sub_metering_2 = as.numeric(as.character(Sub_metering_2))
                 , Global_reactive_power = as.numeric(as.character(Global_reactive_power))
                 , Global_intensity = as.numeric(as.character(Global_intensity))
)

## sort by datetime
mydf.1 <- arrange(mydf.1, DateTime)

## plot the result into png file
png(file = "plot2.png")

## ploting 

plot(mydf.1$DateTime, mydf.1$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)" , xlab = "")

## close plotting device
dev.off()

