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

#plot 2
with(eda, plot(datetime, Global_active_power, type = "n", xlab = "",
               ylab = "Global Active Power (kilowatts)"))
with(eda, lines(datetime, Global_active_power))

#png
png(filename = "plot2.png", height = 480, width = 480)
with(eda, plot(datetime, Global_active_power, type = "n", xlab = "",
               ylab = "Global Active Power (kilowatts)"))
with(eda, lines(datetime, Global_active_power))
dev.off()
