#Read the data file
full_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Filter out the necessary data
data <- full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]
#Convert date/time to the correct format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strftime(strptime(data$Time,format="%H:%M:%S"),"%H:%M:%S")
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Open the PNG device
png(file="plot3.png",width=480,height=480)
#Plot the line graph
plot(data$DateTime,data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_1,type="l")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#Close the device
dev.off()