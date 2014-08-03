full_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data <- full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strftime(strptime(data$Time,format="%H:%M:%S"),"%H:%M:%S")
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
