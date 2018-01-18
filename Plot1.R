#### Exploratory Data Analysis ####

  ## === Week 1 === ##

### PLOT 1

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
  
  # Plot 1
  png(filename = "Plot1.png", width = 480, height = 480)
  hist(as.numeric(HPC_subset$Global_active_power), col="red",
       main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
  dev.off()

