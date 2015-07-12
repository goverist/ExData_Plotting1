## We suppose Data is already unzip and in the working directory
library(lubridate)
Data <- read.csv("household_power_consumption.txt", sep=";", na.strings ="?")
Data$Date <- dmy(Data$Date)
Data$Time <- hms(Data$Time)
Data$Date <- Data$Date + Data$Time
Date1 <- as.POSIXct("2007-02-01 00:00:00", tz="UTC")
Date2 <- as.POSIXct("2007-02-02 23:59:59", tz="UTC")
MyData <- Data[Data$Date >= Date1 & Data$Date <=Date2,]
MyData$Wday <- wday(MyData$Date, label =TRUE)
MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
png("plot2.png", height = 480, width = 480)
plot(MyData$Date, MyData$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()