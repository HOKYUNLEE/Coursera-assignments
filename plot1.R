dir()
power_consumption <- read.table("household_power_consumption.txt", 
                                header = T, sep = ";", stringsAsFactors = F)
                          
str(power_consumption)
head(power_consumption)

for(i in 3:8){
  power_consumption[,i] <- as.numeric(power_consumption[,i])
}
power_consumption[,1] <- as.Date(power_consumption[,1], "%d/%m/%Y")
table(is.na(power_consumption))

#EDA data set
eda <- subset(power_consumption, Date == "2007-02-01" |Date == "2007-02-02")

#plot 1
names(power_consumption)
with(eda, hist(Global_active_power, col = "red",
               main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

#png
png(filename = "plot1.png", height = 480, width = 480)
with(eda, hist(Global_active_power, col = "red",
               main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
