setwd("D:\\BI\\Coursera\\Courses\\4ExploratoryDataAnalysis\\Week1\\exdata-data-household_power_consumption")
list.files()
df <- read.table("household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?")



df$DateTime<-paste(df$Date, df$Time)    ##combine date/time
df$DateTime<-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

start <- which(df$DateTime==strptime("2007-02-01","%Y-%d-%m"))
end <- which(df$DateTime==strptime("2007-02-02","%Y-%d-%m"))
df2 <- df[start:end,]


######plot 2
png(filename = "plot2.png",width = 480,height = 480, pointsize = 12,bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png"))

plot(df2$DateTime, df2$Global_active_power,type='l',ylab="Global Active Power (Kilowatts)", xlab="")

dev.off()
