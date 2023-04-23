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

#Plot1
png(file = "Plot1.PNG", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global active power")
dev.off()
