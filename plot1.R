plot1<-function(){
  png("plot1.png") 
  hist(x$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col="red")
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