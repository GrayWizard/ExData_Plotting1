#Read the data file
full_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Filter out the necessary data
data <- full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]
#Convert date/time to the correct format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strftime(strptime(data$Time,format="%H:%M:%S"),"%H:%M:%S")
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Open the PNG device
png(file="plot4.png",width=480,height=480)
#Set up the 2x2 plot space
par(mfrow=c(2,2))
#Plot the line graph (top-left)
plot(data$DateTime,data$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(data$DateTime,data$Global_active_power,type="l")
#Plot the line graph (top-right)
plot(data$DateTime,data$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(data$DateTime,data$Voltage,type="l")
#Plot the line graph (bottom-left)
plot(data$DateTime,data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_1,type="l")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
#Plot the line graph (bottom-right)
plot(data$DateTime,data$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(data$DateTime,data$Global_reactive_power,type="l")
#Close the device
dev.off()