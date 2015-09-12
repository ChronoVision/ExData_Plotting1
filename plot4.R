## read and select date 
x <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
x <- rbind(x[x$Date == "1/2/2007",], x[x$Date == "2/2/2007",])

## convert to date / time classes
x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

## set mfrow
par(mfrow=c(2,2))

## open png graphic device
png(filename = "Plot4.png",
    width = 480, 
    height = 480,
    bg="transparent")

## Plot1
plot(x$DateTime, x$Global_active_power, 
     type="l", 
     ylab="Global Active Power", 
     xlab="")

## Plot2
plot(x$DateTime, x$Voltage, 
     type="l", 
     ylab="Voltage", 
     xlab="datetime")

## Plot3
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

## Plot 4
plot(x$DateTime, x$Global_reactive_power, 
     type="l", 
     ylab="Global_reactive_power", 
     xlab="datetime")

## close graphic device
dev.off()