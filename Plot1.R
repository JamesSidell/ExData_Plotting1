###############Exploratory Data Analysis###############

#Project One Construct Plot 1
setwd("C:\\Users\\James\\Dropbox\\DataScience\\ExploratoryDataAnalysis\\FirstProject")
raw <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
#powerData <- read.csv("SampleData.txt", header = TRUE, sep = ";")

library(plyr)
#We only want the dates Feb 1, 2007 through Feb 2 2007
# looks like the day is first with these data, and without leading zeros
raw <- subset(raw, Date == "1/2/2007" | Date == "2/2/2007")
powerData <- raw
#rm(raw)

#should use as.Date() to convert date column
#shoudl use strptime() to convert time column
#should clean the data of any missing values coded with "?", but it doesn't appear there are any

#"Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" 

#Clean up a little bit
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Global_active_power <- as.numeric(levels(powerData$Global_active_power))[powerData$Global_active_power]
powerData$Global_reactive_power <- as.numeric(levels(powerData$Global_reactive_power))[powerData$Global_reactive_power]
powerData$Voltage <- as.numeric(levels(powerData$Voltage))[powerData$Voltage]
powerData$Global_intensity <- as.numeric(levels(powerData$Global_intensity))[powerData$Global_intensity]
powerData$Sub_metering_1 <- as.numeric(levels(powerData$Sub_metering_1))[powerData$Sub_metering_1]
powerData$Sub_metering_2 <- as.numeric(levels(powerData$Sub_metering_2))[powerData$Sub_metering_2]
powerData$Sub_metering_3 <- as.numeric(levels(powerData$Sub_metering_3))[powerData$Sub_metering_3]

powerData <- mutate(powerData, DateTime = paste(powerData$Date,powerData$Time, sep = " "))
powerData$DateTime <- strptime(powerData$DateTime, format = "%Y-%m-%d %H:%M:%S")
#Don't know what the time zone is, but that' doesn't matter's not really relevant for just taking a quick look at the data



#Plot 1

png(file = "plot1.png")
hist(powerData$Global_active_power, col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()