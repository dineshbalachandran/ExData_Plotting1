
hdr <- read.table(file="household_power_consumption.txt", sep=";", header=FALSE, nrows=1, stringsAsFactors=FALSE)
pc <- read.table(file="household_power_consumption.txt", sep=";", header=FALSE, skip=66637, nrows=2878, na.strings="?",
                 colClasses=c("character", "character", rep("numeric", 7)))

colnames(pc) <- unlist(hdr)
pc <- within(pc, DateTime <- as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot2.png", width=480, height=480)
plot(pc$DateTime, pc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", pch=NA_integer_)
lines(pc$DateTime, pc$Global_active_power)
dev.off()
