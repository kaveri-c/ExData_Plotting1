## loading the package dplyr for filtering the dataframe
library(dplyr)

# Reading the dataset from the text file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE, dec=".")

## filtering data corresponding to the two dates
df <- filter(data, Date=="1/2/2007"|Date == "2/2/2007")

## write the graph to a file device
png("plot1.png", width=480, height=480)
hist(as.numeric(df[,3]), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()
 