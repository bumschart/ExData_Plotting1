# Generates png file for Exploratory Data Analysis - Course Project 1 - Plot 3
plot3 <- function() {
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
  png(filename = 'plot3.png')
  x_range <- range(data$dt)
  y_range <- range(c(data[7:9]))
  plot(x_range, y_range,
       type='n',
       xlab='', 
       ylab='Energy sub metering')
  lines(data$dt, data$Sub_metering_1)
  lines(data$dt, data$Sub_metering_2, col='red')
  lines(data$dt, data$Sub_metering_3, col='blue')
  legend('topright', legend=colnames(data[7:9]), 
         lty=c(1, 1, 1), col=c('black', 'blue', 'red'))
  dev.off()
}