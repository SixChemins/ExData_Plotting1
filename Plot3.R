#### Exploratory Data Analysis ####

  ## === Week 1 === ##

### PLOT 3

  ##Get data 
  setwd("D:/COURSERA/Data Science __ R/04 - Exploratory Data Analysis")
  library(data.table)
  download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", 
              destfile = "Week_1/zip-H_P_C.zip", mode="wb")
  unzip(zipfile="Week_1/zip-H_P_C.zip",exdir="Week_1")

  ## Load data
  data_HPC <- data.table::fread("Week_1/household_power_consumption.txt")
  data_HPC <- as.data.frame(data_HPC)

  # Subset data based on Date value list ("1/2/2007","2/2/2007")
  HPC_subset <- data_HPC[data_HPC$Date %in% c("1/2/2007","2/2/2007"), ]
  HPC_subset$Date_Time <-strptime(paste(HPC_subset$Date, HPC_subset$Time, 
                                      sep = " "), format="%d/%m/%Y %H:%M:%S")
  # Plot 3
  png(filename = "Plot3.png", width = 480, height = 480)
  plot(HPC_subset$Date_Time, as.numeric(HPC_subset$Sub_metering_1), type="l",
     ylab = "Energy sub metering", xlab = "")
  lines(HPC_subset$Date_Time, as.numeric(HPC_subset$Sub_metering_2), col="red", type="l")
  lines(HPC_subset$Date_Time, as.numeric(HPC_subset$Sub_metering_3), col="blue", type="l")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1, col = c("black", "red", "blue"))


  dev.off()


