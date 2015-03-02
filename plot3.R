mydf<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec=".") ##, nrows = 100)

library(dplyr)
mydf.1 <- filter(mydf, Date == "2/2/2007" | Date == "1/2/2007" )  ## dd / mm/ yy
rm(mydf)
## convert all columns into proper data types
mydf.1 <- mutate(mydf.1, Global_active_power = as.numeric(as.character(Global_active_power)))
mydf.1 <- mutate(mydf.1, Global_active_power = as.numeric(as.character(Global_active_power)))
mydf.1 <- mutate(mydf.1, Voltage = as.numeric(as.character(Voltage)))
mydf.1 <- mutate(mydf.1, DateTime = paste(Date, Time) )
mydf.1 <- mutate(mydf.1, DateTime = as.POSIXct(as.character(DateTime), format= "%d/%m/%Y %H:%M:%S" ) ) ##not working
mydf.1 <- mutate(mydf.1, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                 Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                 Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                 Global_intensity = as.numeric(as.character(Global_intensity))
)

## sort by datetime
mydf.1 <- arrange(mydf.1, DateTime)

## plot the result into png file
png(file = "plot3.png")

## ploting 
plot(mydf.1$DateTime, mydf.1$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering" , xlab = "")
points(mydf.1$DateTime, mydf.1$Sub_metering_2, type = "l", col = "red")
points(mydf.1$DateTime, mydf.1$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), lwd= c(1,1,1),col = c("black", "red", "blue") )


## close plotting device
dev.off()

