#Reading the data

epcdata<-read.table("household_power_consumption.txt", sep=";", skip = 1)
names(epcdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subset the data to include only from the dates 2007-02-01 and 2007-02-02
workingepcdata<-epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date=="2/2/2007"),]

#plot to PNG file
#Open PNG file device
png(filename = "plot1.png",width = 480, height = 480)

#Histograph
hist(as.numeric(as.character(workingepcdata$Global_active_power)),main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

#close the png device
dev.off()
