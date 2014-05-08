plot3 <-function(){
  
  #format for start and end dates: dd/mm/yyyy. Note: The end date is non-inclusive.
  
  startDate <-"01/02/2007"
  endDate<-"03/02/2007"
  
  #Convert start and end date to datetimes
  startDate<-strptime(startDate,"%d/%m/%Y")
  endDate<-strptime(endDate,"%d/%m/%Y")
  
  #Read in the data
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  
  #Take the data from the days defined by the start and end date
  data<-data[datetime>=startDate & datetime<endDate,]
  datetime<-datetime[datetime>=startDate & datetime<endDate]
  
  #Open the png plot
  png(file="plot3.png")
  
  #bind the datetimes to the data
  data<-cbind(data,datetime)
  
  #plot
  with(data, plot(datetime, Sub_metering_1,type="l",col="black"),xlab="",ylab="Energy sub metering")
  with(data, lines(datetime, Sub_metering_2,col="red"))
  with(data, lines(datetime, Sub_metering_3,col="blue"))
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Close the device
  dev.off()
  
}