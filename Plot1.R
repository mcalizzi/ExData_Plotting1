##Glocal Active Power Histogram
##source url https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

fileName <- "household_power_consumption.txt"
usage <- read.csv(fileName,na.strings = "?",sep=";", header=TRUE)

usage$Date <- as.Date(usage$Date, format = "%d/%m/%Y")

usageFeb <- subset(usage,Date == "2007-02-01"  | Date == "2007-02-02")

hist(usageFeb$Global_active_power,xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()