## Exploratory Data Analysis Project 1, Plot 4

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## mfrow specifying layout of 2 rows and 2 columns of plots
## mar spcifying margin dimensions
## oma specifying outside margin dimensions 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
  
  ## Top Left plot
  plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ## Top Right plot
  plot(Voltage~Datetime, type="l", xlab="", ylab="Voltage (volt)")
  
  ## Bottom Left plot with the red and blue sub meter line additions 
  plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
    ## Creating the legend in the top right of the Bottom left plot
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Bottom Right plot
  plot(Global_reactive_power~Datetime, type="l", xlab="", ylab="Global Rective Power (kilowatts)")
  
})

## Creating copy of output in png file form with required dimensions
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()