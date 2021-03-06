###########################################
##Name :PLOT1.R
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
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##Plots
png('plot1.png',width = 480, height = 480) ##To get .png file
hist(data$Global_active_power,col= "red",xlab = "Global Active Power (Kilowatts)"
     ,main = "Global Active Power")
dev.off()##Closing device
