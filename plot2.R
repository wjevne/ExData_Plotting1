library(data.table)

plot2 <- function() {
  # Read in the file and subset the appropriate rows.
  d <- fread("./household_power_consumption.txt", na.strings = "?")
  dates <- c("1/2/2007", "2/2/2007")
  d <- d[d$Date %in% dates]
  d$Datetime <- as.POSIXct(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")

  # Open png graphics device, plot graph, and close.
  png("plot2.png")
  with(d, plot(Datetime, Global_active_power, 
               type = "l",
               xlab = "",
               ylab = "Global Active Power (kilowatts)"))
  dev.off()
}