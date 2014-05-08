plot4 <-function(){
  
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
  png(file="plot4.png")
  
  #bind the datetimes to the data
  data<-cbind(data,datetime)
  
  par(mfrow=c(2,2))
  with(data, {
    plot(datetime,Global_active_power,xlab="",ylab="Global Active Power",type="l")
    plot(datetime,Voltage,xlab="datetime",ylab="Voltage",type="l",col="black")
    plot(datetime, Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
    lines(datetime, Sub_metering_2,col="red")
    lines(datetime, Sub_metering_3,col="blue")
    legend("topright",box.col = "white",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(datetime,Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l",col="black")
  })

 
  
  #Close the device
  dev.off()
  
}