#Read in the data (check that directory is set to the one containing the data)
#Data is in a txt file, separated by semicolons, missing obs shown as "?"

hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#subset to observations containing only 1st and 2nd of February 2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Combine Date and Time in one variable DateTime
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

#Create a new variable with abbreviated weekday 
hpc_s$weekday<-hpc_s$weekday<-format(hpc_s$DateTime,"%a")

#Graph4
png("Plot4.png")
#set the layout to allow for 4 graphs to be drawn in 2x2 pattern 
par(mfrow=c(2,2))
#plot the top left graph, which is the same as in Plot2
plot(hpc_s$DateTime,hpc_s$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#Plot the top right graph of Voltage, define x- and y-axis
plot(hpc_s$DateTime,hpc_s$Voltage,type="l",ylab="Voltage",xlab="datetime")
#Plot the bottom right graph, which is the same as in Plot 3
plot(hpc_s$DateTime,hpc_s$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(hpc_s$DateTime,hpc_s$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",col="red")
lines(hpc_s$DateTime,hpc_s$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",col="blue")
legend_names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend=legend_names,col=c('black','red', 'blue'), lty=1, cex=0.8,  text.font=1,bty="n")
#Plot the bottom right graph of Global reactive power, set the labels
plot(hpc_s$DateTime,hpc_s$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off() #graphic device off