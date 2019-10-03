## Exploratory Data Analysis Project 1, Plot 3

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Creating the initial plot and adding the subsequent lines for the other 2 sub meters
with(subdata, {
  plot(Sub_metering_1 ~ Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        lines(Sub_metering_2 ~ Datetime,col='Red')
        lines(Sub_metering_3 ~ Datetime,col='Blue') } )

  ## Creating the legend in the top right of plot
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Creating copy of output in png file form with required dimensions
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()