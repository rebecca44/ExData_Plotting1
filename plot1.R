# Read in data from file located in the working directory
ex_data <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, 
                    colClasses=c("character","character",rep("numeric",7)),na.strings = "?")

# Convert Date columnt to Date format
ex_data$Date <- as.Date(ex_data$Date , "%d/%m/%Y")

# Subset data based on date range 2007-02-01 - 2007-02-02
ex_data <- subset(ex_data, Date == '2007-02-01' | Date == '2007-02-02')

# Open new PNG file
png(file = "plot1.png", width = 480, height = 480)

# Generate Histogram Graph
hist(ex_data$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)",col="Red")

# Output to file
dev.off()