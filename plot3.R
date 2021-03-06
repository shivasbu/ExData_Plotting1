###########################################
##Name :PLOT3.R
##Author :Shiva Shankar Reddy Bommireddy
##Date :07/10/2014
###########################################

##reading data into R
pro <- read.table("household_power_consumption.txt",header =TRUE, sep = ";")

##Transforming Date Column into Data format of R
pro$Date <- strptime(pro$Date, "%d/%m/%Y")

##reading dates used for analysis into variables
date1 <- strptime("2007-2-1","%Y-%m-%d")
date2 <- strptime("2007-2-2","%Y-%m-%d")

##subsetting data into different variables
str <- subset(pro,Date==date1)
str2 <- subset(pro,Date==date2)

##binding data(our required data)
data <- rbind(str,str2)

##Transforming variables into numeric and date/time
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Date <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S ")

##Plots
png('plot3.png',width = 480, height= 480)##To get .png file
plot(data$Date,data$Sub_metering_1,type = 'l',xlab="",ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off() ##Closing device
