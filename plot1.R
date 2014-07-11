classes <- c(rep("character",2), rep("numeric",7))
file = read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=classes,na.strings = "?")

#get data for specified days
file<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]

png(filename="plot1.png",width=480,height=480,units="px") #creates png file, sets size
hist(file$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power") #creates histogram to put in the png file
dev.off()
