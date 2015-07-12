# Read in data from file located in the working directory
ex_data <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, 
                    colClasses=c("character","character",rep("numeric",7)),na.strings = "?")

# Concatenate date and time columns
ex_data$DateTime <- paste(ex_data$Date , ex_data$Time)

# Convert DateTime column to DateTime format
ex_data$DateTime <- strptime(ex_data$DateTime , "%d/%m/%Y %H:%M:%S")

# Subset data based on date range 2007-02-01 - 2007-02-02
ex_data <- subset(ex_data, DateTime >= '2007-02-01 00:00:00' & DateTime <= '2007-02-02 23:59:59')

# Open new PNG file
png(file = "plot2.png", width = 480, height = 480, type = "cairo", bg = "transparent")

# Generate Graph
plot(ex_data$DateTime, ex_data$Global_active_power, type="l", 
        ylab = "Global Active Power (kilowatts)", xlab="")

# Output to file
dev.off()