#Specifying the downloaded filepath
datafile <- "C:/Pavel/DataScience/EDA/exdata_data_household_power_consumption/household_power_consumption.txt"

#Read the entire file
alldata <- read.csv(datafile, sep =";", na.strings = c("?"))

#Convert the Date items into date format
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

#Subsetting only for relevant dates between 2007-02-01 and 2007-02-02
data <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")

#Converting the Time and Date into one new column for future work
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format = "%Y-%m-%d %H:%M:%S")
colnames(data)[2] <- "DT"
data <- subset(data, select = - Date)

data$Global_active_power <- as.numeric(data$Global_active_power)

#Plot3
png(file = "Plot3.PNG", width = 480, height = 480)
plot(data$DT, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
points(data$DT, data$Sub_metering_1, type = "s", col = "black", pch = )
points(data$DT, data$Sub_metering_2, type = "s", col = "red")
points(data$DT, data$Sub_metering_3, type = "s", col = "blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       lwd = c(1,1,1))
dev.off()

