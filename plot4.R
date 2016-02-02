power_consumption <- read.table("household_power_consumption.txt", 
                                header = T, sep = ";", stringsAsFactors = F)

str(power_consumption)
head(power_consumption)

for(i in 3:8){
  power_consumption[,i] <- as.numeric(power_consumption[,i])
}

power_consumption[,1] <- as.Date(power_consumption[,1], "%d/%m/%Y")


#EDA data set
eda <- subset(power_consumption, Date == "2007-02-01" |Date == "2007-02-02")
eda$datetime <- paste(eda$Date, eda$Time, sep = " ")
str(eda)

eda$datetime <- strptime(eda$datetime, "%Y-%m-%d %H:%M:%S")

#plot 4
with(eda, plot(datetime, Global_reactive_power, type = "n"))
with(eda, lines(datetime, Global_reactive_power))


#png

png(filename = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))

#1
with(eda, plot(datetime, Global_active_power, type = "n", xlab = "",
               ylab = "Global Active Power"))
with(eda, lines(datetime, Global_active_power))
#2
with(eda, plot(datetime, Voltage, type = "n"))
with(eda, lines(datetime, Voltage))

#3
with(eda, plot(datetime, Sub_metering_1, xlab = "", 
               ylab = "Engergy sub metering", type = "n"))
with(eda, lines(datetime, Sub_metering_1))
with(eda, lines(datetime, Sub_metering_2, col="red"))
with(eda, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

#4
with(eda, plot(datetime, Global_reactive_power, type = "n"))
with(eda, lines(datetime, Global_reactive_power))

dev.off()
