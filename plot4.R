# Load libraries
library(sqldf)

# Download dataset if necessary and unzip
if (!file.exists("dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "dataset.zip")
}
unzip("dataset.zip")

# Load correct date range
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

# Use PNG for graphics device
png(file = "plot4.png", width = 480, height = 480)

# Split output into two columns and two rows
par(mfcol = c(2, 2))

# Plot first chart
with(data, plot(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

# Plot second chart
with(data, plot(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(data, lines(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

# Plot third chart
with(data, plot(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

# Plot fourth chart
with(data, plot(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

# Close graphics device
dev.off()
