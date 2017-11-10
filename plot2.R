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
png(filename="plot2.png")

# line chart of "global active power" vs time
plot(powerdata$TimeStamp, powerdata$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()