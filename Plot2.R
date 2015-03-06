#Read in the data (check that directory is set to the one containing the data)
#Data is in a txt file, separated by semicolons, missing obs shown as "?"

hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#subset to observations containing only 1st and 2nd of February 2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Combine Date and Time in one variable DateTime
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

#Create a new variable with abbreviated weekday 
hpc_s$weekday<-hpc_s$weekday<-format(hpc_s$DateTime,"%a")

#Plot2
#Open png, name the plot
png("Plot2.png")
#define parameters for the plot: font for the label and size of label text
par(font.lab=1,cex.lab=0.75)
#plot variable Global_active_power against DateTime (Thurs, Fri)
#type defined as lines; set label for y-axis, and suppress label for x-axis
plot(hpc_s$DateTime,hpc_s$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off() #graphic device off