classes <- c(rep("character",2), rep("numeric",7))
file = read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=classes,na.strings = "?")

#get data for specified days
file<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
file <- file[!is.na(file$Global_active_power),]

#create png file with histogram
png(filename="plot1.png",width=480,height=480,units="px")
hist(file$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()