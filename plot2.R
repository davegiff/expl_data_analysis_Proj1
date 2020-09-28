# import data
power<-read.csv("household_power_consumption.txt",sep=";")

# keep just relevant dates
power_lim1<-subset(power,Date=="1/2/2007")
power_lim2<-subset(power,Date=="2/2/2007")
power_lim3<-rbind(power_lim1,power_lim2)

#create numeric variables and date_time variable
power4<-power_lim3%>%mutate(GAP=as.numeric(Global_active_power),Date2=dmy(Date)+hms(Time))

# create plot
png(filename = "plot2.png",width = 480, height = 480)
plot(power4$Date2,power4$GAP,type="l",xlab="",ylab = "Global Active Power (Kilowatts)")
dev.off()
