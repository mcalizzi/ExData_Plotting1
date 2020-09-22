##Energy submetering plot
##source url https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fileName <- "household_power_consumption.txt"
usage <- read.csv(fileName,na.strings = "?",sep=";", header=TRUE)

usage$Date <- as.Date(usage$Date, format = "%d/%m/%Y")
usageFeb <- subset(usage,Date == "2007-02-01"  | Date == "2007-02-02")

usageFeb$fulldate <- paste(usageFeb$Date,usageFeb$Time)
usageFeb$fulldate <- strptime(usageFeb$fulldate, format="%Y-%m-%d %H:%M:%S")

plot(usageFeb$fulldate,usageFeb$Sub_metering_1,type="l",
     xlab="", ylab="Energy sub metering")
lines(usageFeb$fulldate,usageFeb$Sub_metering_2,col="red")
lines(usageFeb$fulldate,usageFeb$Sub_metering_3,col="blue")
legend(x="topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col = c("black","red","blue"))


dev.copy(png,file="plot3.png")
dev.off()