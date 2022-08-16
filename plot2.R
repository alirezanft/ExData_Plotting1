# the "household_power_consumption.txt" data is downloaded and is set to a "data" file. 

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# just to read the specific times and adjust the type of the Date/Time columns.

finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)
finalData <- subset(finalData, select = -c(Date, Time))

# plot2
par(mfrow = c(1, 1))
plot(finalData$SetTime, finalData$Global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# extracting plot2

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()