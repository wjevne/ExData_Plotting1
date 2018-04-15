library(data.table)

plot3 <- function() {
  # Read in the file and subset the appropriate rows.
  d <- fread("./household_power_consumption.txt", na.strings = "?")
  dates <- c("1/2/2007", "2/2/2007")
  d <- d[d$Date %in% dates]
  d$Datetime <- as.POSIXct(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")
  
  # Open png graphics device, plot graph, and close.
  png("plot3.png")
  with(d, plot(Datetime, Sub_metering_1, 
               type = "l", 
               xlab = "", 
               ylab = "Energy sub metering"))
  with(d, lines(Datetime, Sub_metering_2, col = "red", type = "l"))
  with(d, lines(Datetime, Sub_metering_3, col = "blue", type = "l"))
  legend("topright",
         lty = 1,
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}