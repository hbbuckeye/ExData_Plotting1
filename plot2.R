fileName<- ("./data/household_power_consumption.txt")
data<- read.csv.sql(fileName, sep=";", 
                    sql ='select * from file where Date in ("1/2/2007", "2/2/2007")',
                    header = TRUE, stringsAsFactors = FALSE)
date <- paste(data$Date, data$Time, sep = " ")
dateTime <- strptime(date,  "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width = 480, height = 480, units = "px", bg ="transparent")
plot(dateTime, GlobalActivePower, type ="l", ylab = "Global Active Power (kilowatts)", xlab ="" )
dev.off()
close(file("household_power_consumption.txt"))
closeAllConnections()