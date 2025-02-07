# Reading and subsetting the data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

df$Date <- as.Date(df$Date, "%d/%m/%Y")
data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Plotting the graph
## Create png file as graphic device and to set the correct size
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2), mar = c(4, 4, 2, 2)) # set the correct parameters

## Top left
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
with(data, plot(Time, Global_active_power, 
                type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",
                xaxt = "n"))
axis.POSIXct(1, at = pretty(data$Time, n=2), format = "%a")

## Bottom left
with(data, plot(data$Time, Sub_metering_1, 
                type = "l", xlab = "", ylab = "Energy sub metering",
                xaxt = "n"))
axis.POSIXct(1, at = pretty(data$Time, n=2), format = "%a")

lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,
       col = c("black", "red", "blue"))

## Top right
with(data, plot(data$Time, Voltage,
                type = "l", xlab = "datetime", ylab = "Voltage",
                xaxt = "n"))
axis.POSIXct(1, at = pretty(data$Time, n=2), format = "%a")

## Bottom right
with(data, plot(data$Time, Global_reactive_power,
                type = "l", xlab = "datetime", 
                xaxt = "n"))
axis.POSIXct(1, at = pretty(data$Time, n=2), format = "%a")

# Closing the connection to save the plot
dev.off()