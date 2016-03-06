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
png(file = "plot1.png", width = 480, height = 480)

# Plot chart
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()
