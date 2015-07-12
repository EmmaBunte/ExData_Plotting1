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

## Making plot1
    png("plot1.png", width=480, height=480)
    hist(data$Global_active_power,col="red", 
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()