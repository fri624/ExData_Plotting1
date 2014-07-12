classes <- c(rep("character",2), rep("numeric",7))
file = read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=classes,na.strings = "?")

#get data for specified days
file<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
file <- file[!is.na(file$Global_active_power),]

#put date and time data into correct format and create a new column with that info
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
file$datetime <- as.POSIXct(paste(file$Date, file$Time), format="%Y-%m-%d %H:%M:%S")

#create png file with plot
png(filename="plot2.png",width=480,height=480,units="px")
plot(file$datetime,file$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()