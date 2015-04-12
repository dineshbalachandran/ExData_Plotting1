
hdr <- read.table(file="household_power_consumption.txt", sep=";", header=FALSE, nrows=1, stringsAsFactors=FALSE)
pc <- read.table(file="household_power_consumption.txt", sep=";", header=FALSE, skip=66637, nrows=2878, na.strings="?",
                 colClasses=c("character", "character", rep("numeric", 7)))

colnames(pc) <- unlist(hdr)
pc <- within(pc, DateTime <- as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


png("plot3.png", width=480, height=480)
plot(pc$DateTime, pc$Sub_metering_1, ylab="Energy sub metering", xlab="", pch=NA_integer_)
lines(pc$DateTime, pc$Sub_metering_1, col="black")
lines(pc$DateTime, pc$Sub_metering_2, col="red")
lines(pc$DateTime, pc$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), cex=0.8)
dev.off()