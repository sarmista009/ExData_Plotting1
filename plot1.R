#PLOT-1
##--------------------------------------##

Powerconsumption<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

head(Powerconsumption)

Reqpowerdata<-Powerconsumption[Powerconsumption$Date %in% c("1/2/2007","2/2/2007"),]

head(Reqpowerdata)

Powerdatatime <-strptime(paste(Reqpowerdata$Date, Reqpowerdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

head(Powerdatatime)

names(Powerdatatime)

Reqpowerdata<-cbind(Reqpowerdata,Powerdatatime)

png("plot1.png", width = 480,height = 480)

hist(Reqpowerdata$Global_active_power,col = "red",border = "black",main= "Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()


