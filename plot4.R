fileName<- ("./data/household_power_consumption.txt")
data<- read.csv.sql(fileName, sep=";", 
                    sql ='select * from file where Date in ("1/2/2007", "2/2/2007")',
                    header = TRUE, stringsAsFactors = FALSE)
date <- paste(data$Date, data$Time, sep = " ")
dateTime <- strptime(date,  "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(data$Global_active_power)
GlobalReactivePower <- as.numeric(data$Global_reactive_power)
submeter1 <- as.numeric(data$Sub_metering_1)
submeter2 <- as.numeric(data$Sub_metering_2)
submeter3 <- as.numeric(data$Sub_metering_3)
Volt <- as.numeric(data$Voltage)

png("plot4.png", width = 480, height = 480, units = "px", bg ="transparent")
par(mfrow = c(2, 2))

plot(dateTime, GlobalActivePower, type ="l", ylab = "Global Active Power", xlab ="" )

plot(dateTime, Volt , type ="l", ylab = "Voltage", xlab ="datetime" )

plot(dateTime, submeter1, type ="l", xlab ="", ylab ="Energy sub metering")
lines(dateTime, submeter2, type = "l", col ="red") 
lines(dateTime, submeter3, type ="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", lwd = 3, col = c("black", "red", "blue"))

plot(dateTime, GlobalReactivePower, type ="l", ylab = "Global_reactive_power (kilowatts)", 
     xlab ="datetime" )
dev.off()
close(file("household_power_consumption.txt"))
closeAllConnections()