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

# concatnate date and time into new column

concat <- as.character(paste(pset$Date,pset$Time))

# head(concat)

# add datetime column to dataset
pset$datetime <- strptime(concat,"%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(pset$datetime, pset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
