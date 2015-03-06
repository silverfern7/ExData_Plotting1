#Read in the data (check that directory is set to the one containing the data)
#Data is in a txt file, separated by semicolons, missing obs shown as "?"

hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#subset to observations containing only 1st and 2nd of February 2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Combine Date and Time in one variable DateTime
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

#Create a new variable with abbreviated weekday 
hpc_s$weekday<-hpc_s$weekday<-format(hpc_s$DateTime,"%a")

#Plot 3
#Open png, set pointsize larger than default
png("Plot3.png",pointsize = 14)
#set xpd to TRUE to deal with the clipped legend (plotting clipped to the figure region)
par(xpd=TRUE)
#Plot the Sub-metering_1, assign label to y-axis, no x-axis label 
plot(hpc_s$DateTime,hpc_s$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
#To the same plotting region add the plot of Sub_metering_2, in red line
lines(hpc_s$DateTime,hpc_s$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",col="red")
#Now add the blue line, depicting Sub_metering_3
lines(hpc_s$DateTime,hpc_s$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",col="blue")
#Legend names assigned
legend_names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Legend added to the topright corner, colours assigned, names added, font, size, solid line defined  
legend("topright", legend=legend_names,col=c('black','red', 'blue'), lty=1, cex=0.8,  text.font=1)
dev.off() #graphic device off