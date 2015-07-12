## Loading data into R
file <- "household_power_consumption.txt"
alldata <- read.table(file,
                      header = TRUE,
                      sep = ";",
                      colClasses = c("character", "character", rep("numeric",7)),
                      na = "?")

## Subsetting data to only get the two days we are interested in
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007", ]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Set local languange to english
Sys.setlocale(category = "LC_TIME", locale="English") 

## Making plot4
    png("plot4.png", width=480, height=480)
    par(mfcol = c(2, 2))
    # Top left plot
        plot(data$DateTime,data$Global_active_power,
             type="l",
             xlab= "",
             ylab="Global Active Power (kilowatts)")
        # Buttom left plot
        plot(data$DateTime, data$Sub_metering_1, 
             type="l",
             xlab="",
             ylab="Energy sub metering", 
             col = "black")
        lines(data$DateTime, data$Sub_metering_2, col = "red")
        lines(data$DateTime, data$Sub_metering_3, col = "blue")
        legend("topright",
               lty=1,
               col = c("black", "red","blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # Top right plot
        plot(data$DateTime,data$Voltage,
             type="l",
             xlab= "datetime",
             ylab="Voltage")
    # Buttom right plot
        plot(data$DateTime,data$Global_reactive_power,
             type="l",
             xlab= "datetime")

    dev.off()


## Set local languange to original
Sys.setlocale(category = "LC_TIME", locale="")
