# Reading and subsetting the data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

df$Date <- as.Date(df$Date, "%d/%m/%Y")
data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Plotting the graph
data$Global_active_power <- as.numeric(data$Global_active_power) # set from char to numeric
"Global Active Power (kilowatts)" <- data$Global_active_power
hist(`Global Active Power (kilowatts)`, 
     col = "red", 
     main = "Global Active Power")

# Copying the graph to a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()