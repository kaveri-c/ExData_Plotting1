## loading the package dplyr for filtering the dataframe
library(dplyr)

# Reading the dataset from the text file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE, dec=".")

## filtering data corresponding to the two dates
df <- filter(data, Date=="1/2/2007"|Date == "2/2/2007")

## write the graph to a file device
png("plot2.png", width=480, height=480)

## Date and Time columns are concatenated to strip time.Global_active_power column is converted from character class to numeric for plotting.
plot(strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(df$Global_active_power), type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()

