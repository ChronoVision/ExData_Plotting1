## read and select date 
x <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
x <- rbind(x[x$Date == "1/2/2007",], x[x$Date == "2/2/2007",])

## convert to date / time classes
x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

## open png graphic device
png(filename = "Plot2.png",
    width = 480, 
    height = 480,
    bg="transparent")

## Plot
plot(x$DateTime, x$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

## close graphic device
dev.off()