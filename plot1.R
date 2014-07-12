##
## Initalizing filenames
##
filename = ".\\household_power_consumption.txt"
png_file = ".\\plot1.png"

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
with(ds1,hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)",
              main="Global Active Power"))
dev.off()
