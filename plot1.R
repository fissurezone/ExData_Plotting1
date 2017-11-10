# Read dataset lines 66637 to 69516 for data of days 01/02/2007 - 02/02/2007
header <- read.table("household_power_consumption.txt", nrows=1, header=F,
                     sep=';', stringsAsFactors=F)
powerdata <- read.table("household_power_consumption.txt", sep=";",
                        na.strings=c("?", ""), skip=66636, nrows=2880)
colnames(powerdata) <- header

# Start png graphic device
png(filename="plot1.png")

# histogram of "global active power"
hist(powerdata$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")
dev.off()