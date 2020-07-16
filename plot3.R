# Load packages
library(dplyr)

# Read data: previously downloaded and unzipped to working directory (WD)
# see repo README.md)
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   na.strings = c("?"))

# create variable to cover days required (2007-02-01 to 2007-02-02)
feb2days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# reissue date and time
xAxis <- strptime(paste(feb2days$Date, feb2days$Time, sep=" "),
                  "%d/%m/%Y %H:%M:%S")

# open png graphics device - set size to 480x480 to create plot in WD
png("plot3.png", width=480, height=480)

# create plot too match original example
with(feb2days, plot(xAxis, Sub_metering_1,
                    type = "l",
                    xlab = "",
                    ylab = "Energy sub metering"))

lines(xAxis, feb2days$Sub_metering_2, type = "l", col = "red")
lines(xAxis, feb2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))

# close graphics device
dev.off()
