# the "household_power_consumption.txt" data is downloaded and is set to a "data" file. 

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# just to read the specific times and adjust the type of the Date/Time columns.

finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)
finalData <- subset(finalData, select = -c(Date, Time))

# plot1
par(mfrow = c(1, 1))
hist(finalData$Global_active_power, col="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# extracting plot1

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
