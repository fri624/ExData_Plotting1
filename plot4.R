classes <- c(rep("character",2), rep("numeric",7))
file = read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=classes,na.strings = "?")

#get data for specified days
file<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]

#put date and time data into correct format and create a new column with that info
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
file$datetime <- as.POSIXct(paste(file$Date, file$Time), format="%Y-%m-%d %H:%M:%S")


#create png file with plots
png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2)) #multiple plots in a 2x2 layout

#plot for global active power v. time in upper left corner
with(file<-file[!is.na(file$Global_active_power),],plot(file$datetime,file$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)"))

#plot for voltage v. time in upper right corner
with(file<-file[!is.na(file$Voltage),],plot(file$datetime,file$Voltage,type="l",xlab="datetime",ylab="Voltage"))

#plot for sub metering v. time in lower left corner
with(file<-file[!is.na(file$Sub_metering_1),],plot(file$datetime,file$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering"))
with(file<-file[!is.na(file$Sub_metering_2),],lines(file$datetime,file$Sub_metering_2,col="red"))
with(file<-file[!is.na(file$Sub_metering_3),],lines(file$datetime,file$Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#plot for global reactive power v. time in lower right corner
with(file<-file[!is.na(file$Global_reactive_power),],plot(file$datetime,file$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power"))


dev.off()