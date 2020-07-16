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

# open png graphics device - set size to 480x480 to create plot in WD
png("plot1.png", width=480, height=480)

# create plot too match original example
with(feb2days, hist(Global_active_power,
                    col = "red",
                    main = "Global Active Power",
                    xlab = "Global Active Power (kilowatts)"))

# close graphics device
dev.off()
