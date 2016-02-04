# The txt file is already unzipped and within the working directory
eldat <-read.csv("household_power_consumption.txt",header = TRUE, sep = ";", dec = ".",na.strings = "?")
eldat$Date_Time <- paste(eldat$Date,eldat$Time, sep = " ")
eldat <-subset(eldat, select = -c(Date,Time))

eldat$Date_Time <- strptime(eldat$Date_Time, format = "%d/%m/%Y %H:%M:%S")

el_sub <- subset(eldat, format(Date_Time,"%Y-%m-%d") %in% c("2007-02-01","2007-02-02"))

png("plot2.png", width=480, height=480)
plot(el_sub$Date_Time, el_sub$Global_active_power , type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()