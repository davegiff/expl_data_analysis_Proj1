# import data
power<-read.csv("household_power_consumption.txt",sep=";")

# keep just relevant dates
power_lim1<-subset(power,Date=="1/2/2007")
power_lim2<-subset(power,Date=="2/2/2007")
power_lim3<-rbind(power_lim1,power_lim2)

Date2<-dmy(power_lim3$Date)
power4<-power_lim3%>%mutate(Date2=dmy(Date))