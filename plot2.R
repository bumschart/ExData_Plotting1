# Generates png file for Exploratory Data Analysis - Course Project 1 - Plot 2
plot2 <- function() {
  # Get data
  data <- read.table('household_power_consumption.txt', 
                     header=TRUE, colClasses = 'character', sep=';')
  # Clean data
  data$dt <- paste(data$Date, data$Time)
  data$dt <- strptime(data$dt, format='%d/%m/%Y %H:%M:%S')
  mask <- (data$dt >= '2007-02-01') & (data$dt <= '2007-02-02 23:59:59')
  data <- data[mask, ]
  data[3:9] <- sapply(data[3:9], as.numeric)
  # Print plot to file (png)
  png(filename = 'plot2.png')
  plot(data$dt, data$Global_active_power, 
       type='l',
       xlab='', 
       ylab='Global Active Power (kilowatts)')
  dev.off()
}