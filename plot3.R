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

## Making plot3    
    png("plot3.png", width=480, height=480)
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
    dev.off()

## Set local languange to original
Sys.setlocale(category = "LC_TIME", locale="")
