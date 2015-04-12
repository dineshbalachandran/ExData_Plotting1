
hdr <- read.table(file="household_power_consumption.txt", sep=";", header=FALSE, nrows=1, stringsAsFactors=FALSE)
pc <- read.table(file="household_power_consumption.txt", sep=";", header=FALSE, skip=66637, nrows=2878, na.strings="?",
                 colClasses=c("character", "character", rep("numeric", 7)))

colnames(pc) <- unlist(hdr)
pc <- within(pc, DateTime <- as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot1.png", width=480, height=480)
hist(pc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()