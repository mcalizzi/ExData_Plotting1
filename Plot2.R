##Global Active power line plot
##source url https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fileName <- "household_power_consumption.txt"
usage <- read.csv(fileName,na.strings = "?",sep=";", header=TRUE)

usage$Date <- as.Date(usage$Date, format = "%d/%m/%Y")
usageFeb <- subset(usage,Date == "2007-02-01"  | Date == "2007-02-02")

usageFeb$fulldate <- paste(usageFeb$Date,usageFeb$Time)
usageFeb$fulldate <- strptime(usageFeb$fulldate, format="%Y-%m-%d %H:%M:%S")

plot(usageFeb$fulldat,usageFeb$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()