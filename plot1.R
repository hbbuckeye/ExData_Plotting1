fileName<- ("./data/household_power_consumption.txt")
data<- read.csv.sql(fileName, sep=";", 
                    sql ='select * from file where Date in ("1/2/2007", "2/2/2007")',
                    header = TRUE, stringsAsFactors = FALSE)

GlobalActivePower <- data[,"Global_active_power"]

png("plot1.png", width = 480, height = 480, units = "px", bg ="transparent")

hist(GlobalActivePower, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()