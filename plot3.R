# the "household_power_consumption.txt" data is downloaded and is set to a "data" file. 

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# just to read the specific times and adjust the type of the Date/Time columns.

finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)
finalData <- subset(finalData, select = -c(Date, Time))

# plot3

colors <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

par(mfrow = c(1, 1))
plot(finalData$SetTime, finalData$Sub_metering_1, type = "l", col = colors[1],
     xlab = "", ylab = "Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col = colors[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col = colors[3])
legend("topright", inset = 0.01, legend=labels, col = colors, lty = "solid", box.lty = 0, cex = 0.7)

# extracting plot3
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()


