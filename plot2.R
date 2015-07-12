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

## Making plot2
    png("plot2.png", width=480, height=480)
    plot(data$DateTime,data$Global_active_power,
         type="l",
         xlab= "",
         ylab="Global Active Power (kilowatts)")
    dev.off()

## Set local languange to original
Sys.setlocale(category = "LC_TIME", locale="")
