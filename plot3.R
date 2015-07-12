## We suppose Data is already unzip and in the working directory
library(lubridate)
Data <- read.csv("household_power_consumption.txt", sep=";", na.strings ="?")
Data$Date <- dmy(Data$Date)
Data$Time <- hms(Data$Time)
Data$Date <- Data$Date + Data$Time
Date1 <- as.POSIXct("2007-02-01 00:00:00", tz="UTC")
Date2 <- as.POSIXct("2007-02-02 23:59:59", tz="UTC")
MyData <- Data[Data$Date >= Date1 & Data$Date <=Date2,]
MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
MyData$Wday <- wday(MyData$Date, label =TRUE)
png("plot3.png", height = 480, width = 480)
plot(MyData$Date, MyData$Sub_metering_1, type="l", ylab ="Energy sub metering", xlab ="")
lines(MyData$Date, MyData$Sub_metering_2, type ="l", col ="red")
lines(MyData$Date, MyData$Sub_metering_3, type ="l", col ="blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1, lwd =2, col =c("black", "red", "blue"))
dev.off()