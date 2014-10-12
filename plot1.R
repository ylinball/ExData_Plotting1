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

png(file="plot1.png")

# plot histogram of global active power
hist(pset$Global_active_power, main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

dev.off()
