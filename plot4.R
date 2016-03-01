setwd("D:\\BI\\Coursera\\Courses\\4ExploratoryDataAnalysis\\Week1\\exdata-data-household_power_consumption")
list.files()
df <- read.table("household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?")



df$DateTime<-paste(df$Date, df$Time)    ##combine date/time
df$DateTime<-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

start <- which(df$DateTime==strptime("2007-02-01","%Y-%d-%m"))
end <- which(df$DateTime==strptime("2007-02-02","%Y-%d-%m"))
df2 <- df[start:end,]


######plot 4
png(filename = "plot4.png",width = 480,height = 480, pointsize = 12,bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png"))

par(mfcol=c(2,2))   ##2 rows & cols respectively
                    ##graphs are plotted col-wise

plot(df2$DateTime, df2$Global_active_power,type='l',ylab="Global Active Power", xlab="")

plot(df2$DateTime, df2$Sub_metering_1,type='l',ylab="Energy sub metering", xlab="")
lines(df2$DateTime,df2$Sub_metering_2,type="l",col="red")
lines(df2$DateTime,df2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"))

plot(df2$DateTime, df2$Voltage,type='l',ylab="Voltage", xlab="datetime")

plot(df2$DateTime, df2$Global_reactive_power,type='l',ylab="Global_reactive_Power", xlab="datetime")

dev.off()
