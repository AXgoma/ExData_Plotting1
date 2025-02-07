# Reading and subsetting the data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

df$Date <- as.Date(df$Date, "%d/%m/%Y")
data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Plotting the graph
## Start from Sub metering 1
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
with(data, plot(data$Time, Sub_metering_1, 
                type = "l", xlab = "", ylab = "Energy sub metering",
                xaxt = "n"))
axis.POSIXct(1, at = pretty(data$Time, n=2), format = "%a")

## Add Sub metering 2 and 3
lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")

## Add the legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,
       col = c("black", "red", "blue"))

# Copying the graph to a png file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()