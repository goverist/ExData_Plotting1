## We suppose Data is already unzip and in the working directory

library(lubridate)
Data <- read.csv("household_power_consumption.txt", sep=";", na.strings ="?")
Data$Date <- dmy(Data$Date)
Data$Time <- hms(Data$Time)
Data$Date <- Data$Date + Data$Time
Date1 <- as.POSIXct("2007-02-01 00:00:00", tz="UTC")
Date2 <- as.POSIXct("2007-02-02 23:59:59", tz="UTC")
MyData <- Data[Data$Date >= Date1 & Data$Date <=Date2,]
png("plot1.png", height = 480, width = 480)
hist(MyData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kw)")
dev.off()