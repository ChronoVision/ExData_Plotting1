## read and select date 
x <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
x <- rbind(x[x$Date == "1/2/2007",], x[x$Date == "2/2/2007",])

## convert to date / time classes
x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

## open png graphic device
png(filename = "Plot3.png",
    width = 480, 
    height = 480,
    bg="transparent")

## Plot
plot(x=x$DateTime, y=x$Sub_metering_1, 
     type="l", 
     ylab="Energy sub metering",
     xlab="")
points(x=x$DateTime, y=x$Sub_metering_2, 
       type="l", 
       col="red")
points(x=x$DateTime, y=x$Sub_metering_3, 
       type="l", 
       col="blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1)
       )

## close graphic device
dev.off()