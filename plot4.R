## Download, read and subset the dataset.
## Note: downloaded .zip file must be unzipped before dataset can be read.
## download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power.zip")
power <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = '?')
power_feb2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Merging Dates and Times and converting to POSIXlt
dates <- power_feb2$Date
times <- power_feb2$Time
dates <-as.Date(dates,"%d/%m/%Y")
datetimes <- paste(dates,times,sep = " ")
datetimes <-strptime(datetimes,"%Y-%m-%d %H:%M:%S")

## Plotting Graphs on Windows
windows(height = 480, width = 480)
par(mfcol = c(2, 2))
## first graph
plot(datetimes, power_feb2$Global_active_power,type = "l", ylab =  "Global Active Power", xlab = "")
## second graph
plot(datetimes, power_feb2$Sub_metering_1,type = "l", ylab =  "Energy sub metering", xlab = "")
lines(datetimes, power_feb2$Sub_metering_2, col = "red")
lines(datetimes, power_feb2$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lty=1,bty = "n",cex = 0.7)
## third graph
plot(datetimes, power_feb2$Voltage,type = "l", ylab =  "Voltage", xlab = "datetime")
## fourth graph
plot(datetimes,power_feb2$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "datetime")

## Copies graph to .png
## Note: Day names in the x axis in Portuguese (my system´s language)
dev.copy(png, file = "plot4.png")
dev.off()
