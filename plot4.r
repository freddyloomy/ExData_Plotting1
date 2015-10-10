plot4<-function(){
  x<-loadPowerConData()
  png("plot4.png")
  par(mfrow=c(2,2))
  plot(x$Time,x$Global_active_power,type="l",xlab="datetime",ylab="Global_active_power")
  
  plot(x$Time,x$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  plot(x$Time,x$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
  points(x$Time,x$Sub_metering_2,col="red",type="l")
  points(x$Time,x$Sub_metering_3,col="blue",type="l")
  legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))                                                        
  
  plot(x$Time,x$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.off()
}

loadPowerConData<- function()
{
  datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
  datafile$Date<-as.Date(datafile$Date,"%d/%m/%Y")
  datafile<-datafile[datafile$Date>="2007-02-01" & datafile$Date<="2007-02-02",]
  datafile$Time<-strptime(paste(datafile$Date,datafile$Time),"%Y-%m-%d %H:%M:%S")
  datafile
}