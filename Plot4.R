#Reading the data

epcdata<-read.table("household_power_consumption.txt", sep=";", skip = 1)
names(epcdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subset the data to include only from the dates 2007-02-01 and 2007-02-02
workingepcdata<-epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date=="2/2/2007"),]

#Converting the data and time variable to Date/Time class
#workingepcdata$Date<-as.Date(workingepcdata$Date,format="%d/%m/%Y")
#workingepcdata$Time<-strftime(workingepcdata$Time,format="%H:%M:%S")
workingepcdata$Time<-strptime(paste(workingepcdata$Date, workingepcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#plot to PNG file
#Open PNG file device
png(filename = "plot4.png",width = 480, height = 480)

#arrange four plots in 2 by 2 array 
par(mfrow=c(2,2))

#Plot 1
plot(workingepcdata$Time, as.numeric(as.character(workingepcdata$Global_active_power)), type="l", xlab="", ylab = "Global Active Power")

#Plot 2
plot(workingepcdata$Time,as.numeric(as.character(workingepcdata$Voltage)), type="l", xlab="datetime", ylab = "Voltage")

#Plot 3
plot(workingepcdata$Time, as.numeric(as.character(workingepcdata$Sub_metering_1)), type="l", xlab="", ylab = "Energy sub metering")
#add metering_2
points(workingepcdata$Time, as.numeric(as.character(workingepcdata$Sub_metering_2)), type="l", col="red")
#add metering_2
points(workingepcdata$Time, as.numeric(as.character(workingepcdata$Sub_metering_3)), type="l", col="blue")
#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot 4
plot(workingepcdata$Time,as.numeric(as.character(workingepcdata$Global_reactive_power)), type="l", xlab="datetime", ylab = "Global_reactive_power")
#close the png device
dev.off()
