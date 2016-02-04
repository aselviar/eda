# The txt file is already unzipped and within the working directory
eldat <-read.csv("household_power_consumption.txt",header = TRUE, sep = ";", dec = ".",na.strings = "?")
eldat$Date_Time <- paste(eldat$Date,eldat$Time, sep = " ")
eldat <-subset(eldat, select = -c(Date,Time))

eldat$Date_Time <- strptime(eldat$Date_Time, format = "%d/%m/%Y %H:%M:%S")

el_sub <- subset(eldat, format(Date_Time,"%Y-%m-%d") %in% c("2007-02-01","2007-02-02"))

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
#top left
plot(el_sub$Date_Time, el_sub$Global_active_power , type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#bottom left
plot(el_sub$Date_Time, el_sub$Sub_metering_1 , type = "l", ylab = "Energy sub metering", xlab = "")
lines(el_sub$Date_Time, el_sub$Sub_metering_2 , col = "red")
lines(el_sub$Date_Time, el_sub$Sub_metering_3 , col = "blue")
legend("topright",col = c("black","red","blue"),lty = c(1,1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#top right
plot(el_sub$Date_Time, el_sub$Voltage , type = "l", ylab = "Voltage", xlab = "datetime")
#bottom right
plot(el_sub$Date_Time, el_sub$Global_reactive_power , type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

