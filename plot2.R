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
png(file = "plot2.png", width = 480, height = 480)

# Plot chart
with(data, plot(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# Close graphics device
dev.off()
