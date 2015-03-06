#Read in the data (check that directory is set to the one containing the data)
#Data is in a txt file, separated by semicolons, missing obs shown as "?"

hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#subset to observations containing only 1st and 2nd of February 2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Combine Date and Time in one variable DateTime
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

#Create a new variable with abbreviated weekday (will be req'd for subsequent graphs)
hpc_s$weekday<-hpc_s$weekday<-format(hpc_s$DateTime,"%a")

#Plot1
#open the png, assign name to the resulting png file
png("Plot1.png")
#set transparent background, define font size of labels, title, axis)
par(bg = "transparent", cex.lab=0.75, cex.main=1, cex.axis=0.75)
#Draw a histogram of Global_active_power, set colour to red, give hist a title and label
# the x-axis
hist(hpc_s$Global_active_power,col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off() #close graphics interface