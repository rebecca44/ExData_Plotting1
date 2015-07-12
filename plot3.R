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
png(file = "plot3.png", width = 480, height = 480)

# Generate Graph
plot(ex_data$DateTime, ex_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(ex_data$DateTime, ex_data$Sub_metering_2, col="Red")
lines(ex_data$DateTime, ex_data$Sub_metering_3, col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("Black","Red","Blue"))

# Close off output to file
dev.off()