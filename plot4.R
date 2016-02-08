library(data.table)

all_date<-fread("household_power_consumption.txt",sep=";",select=1,header=TRUE)
idx_of_interest<-c(which(all_date$Date=="1/2/2007"),which(all_date$Date=="2/2/2007"))
firstrow<-read.table("household_power_consumption.txt",sep=";",header=TRUE, nrows=1)
cn<-colnames(firstrow)
subdata<-read.table("household_power_consumption.txt",sep=";",header=FALSE, skip=idx_of_interest[1],nrows=length(idx_of_interest))
colnames(subdata)<-cn

onetime<-strptime(paste(subdata$Date,subdata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(onetime,subdata$Global_active_power,xlab="",ylab="Global Active Power","l")
plot(onetime,subdata$Voltage,xlab="datetime",ylab="Voltage","l")
plot(onetime,subdata$Sub_metering_1,"l",xlab="",ylab="Energy sub metering")
lines(onetime,subdata$Sub_metering_2,col="red")
lines(onetime,subdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
plot(onetime,subdata$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power","l")
dev.off()
