##print 4 plots
##source url https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fileName <- "household_power_consumption.txt"
usage <- read.csv(fileName,na.strings = "?",sep=";", header=TRUE)

usage$Date <- as.Date(usage$Date, format = "%d/%m/%Y")
usageFeb <- subset(usage,Date == "2007-02-01"  | Date == "2007-02-02")

usageFeb$fulldate <- paste(usageFeb$Date,usageFeb$Time)
usageFeb$fulldate <- strptime(usageFeb$fulldate, format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
with(usageFeb,{
  plot(usageFeb$fulldate,usageFeb$Global_active_power,type="l",
       xlab="", ylab="Global Active Power (kilowatts)")
  plot(usageFeb$fulldate,usageFeb$Voltage,xlab="datetime",
       ylab="Voltage", type="l")
  plot(usageFeb$fulldate,usageFeb$Sub_metering_1,type="l",
       xlab="", ylab="Energy sub metering")
  lines(usageFeb$fulldate,usageFeb$Sub_metering_2,col="red")
  lines(usageFeb$fulldate,usageFeb$Sub_metering_3,col="blue")
  legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col = c("black","red","blue"),lty=1,cex=.6,bty="n")
  plot(usageFeb$fulldate, usageFeb$Global_reactive_power,xlab="datetime", 
       ylab="Global_reactive_power", type="l")
  
  }  )

dev.copy(png,file="plot4.png")
dev.off()