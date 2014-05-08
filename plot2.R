plot2 <-function(){
  
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
  png(file="plot2.png")
  
  #plot
  plot(datetime,test$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #Close the plot
  dev.off()
  
}