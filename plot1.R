url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "dataset.zip")
upzip("dataset.zip", exdir = "./ExData_Plotting1")
data <- read.table("./ExData_Plotting1/household_power_consumption.txt", 
                   header = T, sep = ";", na.strings = "?", skip = 66636, 
                   nrows = 2880, comment.char = "")
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reactive_power", "Voltage", "Global_intensity", 
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
png("./ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()