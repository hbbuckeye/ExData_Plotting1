fileName<- ("./data/household_power_consumption.txt")
library(sqldf)
data<- read.csv.sql(fileName, sep=";", 
                    sql ='select * from file where Date in ("1/2/2007", "2/2/2007")',
                    header = TRUE, stringsAsFactors = FALSE)
date <- paste(data$Date, data$Time, sep = " ")
dateTime <- strptime(date,  "%d/%m/%Y %H:%M:%S")
submeter1 <- as.numeric(data$Sub_metering_1)
submeter2 <- as.numeric(data$Sub_metering_2)
submeter3 <- as.numeric(data$Sub_metering_3)
png("plot3.png", width = 480, height = 480, units = "px", bg ="transparent")

plot(dateTime, submeter1, type ="l", xlab ="", ylab ="Energy sub metering")
lines(dateTime, submeter2, type = "l", col ="red") 
lines(dateTime, submeter3, type ="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border ="black",
       lwd = 3, col = c("black", "red", "blue"))
dev.off()
close(file("household_power_consumption.txt"))
closeAllConnections()