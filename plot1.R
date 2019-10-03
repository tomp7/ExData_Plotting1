## Exploratory Data Analysis Project 1, Plot 1


data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subsetting 
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

## Creating the histogram of global active power by frequency
hist(subdata$Global_active_power, main="Global Active Power", 
                                  xlab="Global Active Power (kilowatts)", 
                                  ylab="Frequency", col="Red")

## Creating copy of output in png file form with required dimensions
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



