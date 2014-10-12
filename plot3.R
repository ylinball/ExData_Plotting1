# Clear all variables
rm(list=ls(all=TRUE))

# Set default working directory to Samsung Data file
setwd()

# Retrieve working directory
getwd()

# read dataset
pset <- read.table("household_power_consumption.txt",header=F,sep=";",skip=66637,nrows=2880)

# Read single first line of file
## con <- file("household_power_consumption.txt")
## pcol <- readLines(con,1)

# read column names
pcol <- colnames(read.table("household_power_consumption.txt",header=T,sep=";",nrows=1))

# add column names
colnames(pset) <- pcol

##colnames(pset)
##[1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power" "Voltage"              
##[6] "Global_intensity"      "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3"        "datetime"

# concatnate date and time into new column

concat <- as.character(paste(pset$Date,pset$Time))

# head(concat)

# add datetime column to dataset
pset$datetime <- strptime(concat,"%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(pset$datetime,pset$Sub_metering_1,type="l", col="black",ylab="Energy sub metering",xlab="")
lines(pset$datetime, pset$Sub_metering_2, col="red")
lines(pset$datetime, pset$Sub_metering_3, col="blue")
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
