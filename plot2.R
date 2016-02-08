library(data.table)

all_date<-fread("household_power_consumption.txt",sep=";",select=1,header=TRUE)
idx_of_interest<-c(which(all_date$Date=="1/2/2007"),which(all_date$Date=="2/2/2007"))
firstrow<-read.table("household_power_consumption.txt",sep=";",header=TRUE, nrows=1)
cn<-colnames(firstrow)
subdata<-read.table("household_power_consumption.txt",sep=";",header=FALSE, skip=idx_of_interest[1],nrows=length(idx_of_interest))
colnames(subdata)<-cn

onetime<-strptime(paste(subdata$Date,subdata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(onetime,subdata$Global_active_power,"l",xlab="",ylab="Global active power")
dev.off()
