#PLOT-4
##--------------------------------------##

Powerconsumption<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

head(Powerconsumption)

Reqpowerdata<-Powerconsumption[Powerconsumption$Date %in% c("1/2/2007","2/2/2007"),]

head(Reqpowerdata)

Powerdatatime <-strptime(paste(Reqpowerdata$Date, Reqpowerdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

head(Powerdatatime)

names(Powerdatatime)

Reqpowerdata<-cbind(Reqpowerdata,Powerdatatime)

png("plot4.png", width = 480,height = 480)
par(mfrow=c(2,2))
labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(Reqpowerdata$Powerdatatime,Reqpowerdata$Global_active_power,type="l",border = "black",xlab="",ylab="Global Active Power")
plot(Reqpowerdata$Powerdatatime,Reqpowerdata$Voltage,type="l",border = "black",xlab="datetime",ylab="Voltage")
plot(Reqpowerdata$Powerdatatime,Reqpowerdata$Sub_metering_1,type="l",border = "black",xlab="",ylab="Energy Sub Metering")
lines(Reqpowerdata$Powerdatatime,Reqpowerdata$Sub_metering_2,type="l",col = "red")
lines(Reqpowerdata$Powerdatatime,Reqpowerdata$Sub_metering_3,type="l",col = "blue")
legend("topright",bty ="n",legend=labels,col= c("black","red","blue"),lty=1)
plot(Reqpowerdata$Powerdatatime,Reqpowerdata$Global_reactive_power,type="l",border = "black",xlab="datetime",ylab="Global_reactive_power")
dev.off()