## loading the package dplyr for filtering the dataframe
library(dplyr)

# Reading the dataset from the text file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE, dec=".")

## filtering data corresponding to the two dates
df <- filter(data, Date=="1/2/2007"|Date == "2/2/2007")

## write the graph to a file device
png("plot3.png", width=480, height=480)

plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0,30))
par(new=TRUE)
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Sub_metering_2),col="red", type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0,30))
par(new=TRUE)
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Sub_metering_1),col="blue", type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0,30))
legend("topright",legend = c('sub_metering_1','sub_metering_2','sub_metering_3'), col=c('black','red','blue'), lty=1)
dev.off()