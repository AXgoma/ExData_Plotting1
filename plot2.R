# Reading and subsetting the data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

df$Date <- as.Date(df$Date, "%d/%m/%Y")
data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Plotting the graph
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
with(data, plot(Time, Global_active_power, 
                type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",
                xaxt = "n")) # creates empty x axis labels to be added later

# Adding the correct x axis labels (weekdays)
axis.POSIXct(1, at = pretty(data$Time, n=2), format = "%a")

# Copying the graph to a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()