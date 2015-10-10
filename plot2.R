plot2<- function(){
  x<-loadPowerConData()
  png("plot2.png")
  plot(x$Time,x$Global_active_power,xlab="datetime",ylab="Global Active Power (kilowatts)",type="l")
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