## loading the package dplyr for filtering the dataframe
library(dplyr)

# Reading the dataset from the text file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE, dec=".")

## filtering data corresponding to the two dates
df <- filter(data, Date=="1/2/2007"|Date == "2/2/2007")

## write the graph to a file device
png("plot4.png", width=500, height=500)

par(mfrow=c(2,2), mar=c(4,4,2,1))

## First subplot
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Global_active_power), type = "l", ylab = "Global Active Power", xlab = "")

## Second subplot
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Voltage), type = "l", ylab = "Voltage", xlab = "")

## Third subplot
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0,30))
par(new=TRUE)
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Sub_metering_2),col="red", type = "l",  ylim = c(0,30))
par(new=TRUE)
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Sub_metering_3),col="blue", type = "l", ylim = c(0,30))
legend("topright",legend = c('sub_metering_1','sub_metering_2','sub_metering_3'), col=c('black','red','blue'), lty=1)

## Fourth subplot
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Global_reactive_power),col="black", type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()