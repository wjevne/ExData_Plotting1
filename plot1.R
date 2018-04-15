library(data.table)

plot1 <- function() {
  # Read in the file and subset the appropriate rows.
  d <- fread("./household_power_consumption.txt", na.strings = "?")
  dates <- c("1/2/2007", "2/2/2007")
  d <- d[d$Date %in% dates]
  
  # Open png graphics device, plot graph, and close.
  png("plot1.png")
  with(d, hist(Global_active_power, 
               col = "red",
               main = "Global Active Power", 
               xlab = "Global Active Power (kilowatts)"))
  dev.off()
}