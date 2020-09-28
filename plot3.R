# import data
power<-read.csv("household_power_consumption.txt",sep=";")

# keep just relevant dates
power_lim1<-subset(power,Date=="1/2/2007")
power_lim2<-subset(power,Date=="2/2/2007")
power_lim3<-rbind(power_lim1,power_lim2)

#create numeric variables and date_time variable
power4<-power_lim3%>%mutate(
        GAP=as.numeric(Global_active_power),
        SM1=as.numeric(Sub_metering_1),
        SM2=as.numeric(Sub_metering_2),
        SM3=as.numeric(Sub_metering_3),
        Date2=dmy(Date)+hms(Time))

# create plot
png(filename = "plot3.png",width = 480, height = 480)
plot(power4$Date2,power4$SM1,type="l",xlab="",ylab = "Energy sub metering")
lines(power4$Date2,power4$SM2,type="l",col="red",xlab="",ylab = "Energy sub metering")
lines(power4$Date2,power4$SM3,type="l",col="blue",xlab="",ylab = "Energy sub metering")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
