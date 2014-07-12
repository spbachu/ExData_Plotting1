##
## Initalizing filenames
##
filename = ".\\household_power_consumption.txt"
png_file = ".\\plot4.png"

## reading the data file
ds = read.table(filename,sep=";",header=TRUE,na.strings="?",as.is = TRUE)

## subbsetting the data to 2 days
ds1 =ds[(ds$Date == "1/2/2007" | ds$Date == "2/2/2007"),]

## adding date and time data columns to the data frame
ds1$Date1 = as.Date(ds1$Date,format="%d/%m/%Y")
dt = paste(ds1$Date,ds1$Time)
ds1$Time1 = strptime(dt, "%d/%m/%Y %H:%M:%S")

##
## Plotting the graph to PNG device
png(png_file,width=480,height=480)

par(mfrow=c(2,2))

## plot1
plot(ds1$Time1,ds1$Global_active_power,type="l",ylab="Global Active Power",xlab="")

## plot2
plot(ds1$Time1,ds1$Voltage,type="l",ylab="Voltage",xlab="datetime")

## plot3
with(ds1,plot(ds1$Time1,ds1$Sub_metering_1,type="l",ylab="Energy sub metering", xlab=""))
with(ds1,lines(ds1$Time1,ds1$Sub_metering_2,type="l",col="red"))
with(ds1,lines(ds1$Time1,ds1$Sub_metering_3,type="l",col="blue"))
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## plot4
plot(ds1$Time1,ds1$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()