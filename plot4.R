library(data.table)

plot4 <- function() {
  # Read in the file and subset the appropriate rows.
  d <- fread("./household_power_consumption.txt", na.strings = "?")
  dates <- c("1/2/2007", "2/2/2007")
  d <- d[d$Date %in% dates]
  d$Datetime <- as.POSIXct(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")
  
  # Open png graphics device, plot graph, and close.
  png("plot4.png")
  par(mfrow = c(2, 2))
  with(d, {
    plot(Datetime, Global_active_power, 
         type = "l", 
         xlab = "", 
         ylab = "Global Active Power")
    plot(Datetime, Voltage, 
         type = "l", 
         xlab = "datetime", 
         ylab = "Voltage")
    plot(Datetime, Sub_metering_1, 
         type = "l",
         xlab = "", 
         ylab = "Energy sub metering")
    lines(Datetime, Sub_metering_2, 
          col = "red", 
          type = "l")
    lines(Datetime, Sub_metering_3, 
          col = "blue", 
          type = "l")
    legend("topright", 
           lty = 1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Datetime, Global_reactive_power, 
         type = "l", 
         xlab = "datetime", 
         ylab = "Global_rective_power")
  })
  dev.off()
}