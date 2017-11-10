# Download and unzip dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "household_power_consumption.zip", mode="wb")
unzip("household_power_consumption.zip")

# Read dataset lines 66637 to 69516 for data of days 01/02/2007 - 02/02/2007
header <- read.table("household_power_consumption.txt", nrows=1, header=F,
                     sep=';', stringsAsFactors=F)
powerdata <- read.table("household_power_consumption.txt", sep=";",
                        na.strings=c("?", ""), skip=66636, nrows=2880)
colnames(powerdata) <- header
powerdata$TimeStamp <- strptime(paste(powerdata$Date, powerdata$Time),
                                "%d/%m/%Y %H:%M:%S", tz="GMT")

# Start png graphic device
png(filename="plot4.png")
par(mfrow=c(2,2))

plot(powerdata$TimeStamp, powerdata$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

plot(powerdata$TimeStamp, powerdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# line charts of "sub metering"(s) vs time
plot(powerdata$TimeStamp, powerdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerdata$TimeStamp, powerdata$Sub_metering_2, type="l", col="red")
lines(powerdata$TimeStamp, powerdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=colnames(powerdata)[7:9], col=c("black", "red", "blue"), lty=rep(1, 3))

plot(powerdata$TimeStamp, powerdata$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()