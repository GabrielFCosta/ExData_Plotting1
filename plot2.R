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

## Plotting Line Graph
plot(datetimes, power_feb2$Global_active_power,type = "l", ylab =  "Global Active Power (kilowatts)", xlab = "")

## Copies graph to .png
## Note: Day names in the x axis in Portuguese (my system´s language)
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
