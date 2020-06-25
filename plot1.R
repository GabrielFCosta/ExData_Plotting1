
## Download, read and subset the dataset.
## Note: downloaded .zip file must be unzipped before dataset can be read.
## download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power.zip")
power <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = '?')
power_feb2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Creates histogram.
hist(power_feb2$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Copies histogram to .png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
