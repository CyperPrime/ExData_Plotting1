#1. set working directory
setwd("C:/Users/CyperPrime/Documents/Project") #in the file path, change "\" to "/"

#2. load file to RStudio
data_raw <- read.table("household_power_consumption.txt", #name of file
                       header = TRUE,                     #the first row of the file are the names of thevariables
                       sep = ";",                         #the seperator used in the file is a semi-colon (";")
                       colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                       #set 'Date' and 'Time' entries as character class, and the rest as numeric class
                       na.strings = "?")                  #the missing values are denoted as question mark symbols ("?")

#3. define filters (days of interests)
day1 <- as.character("1/2/2007")
day2 <- as.character("2/2/2007")

#4. filter data
data_ready <- data_raw[data_raw[,1] == day1 | data_raw[,1] == day2,]
#create a new table named: data_ready
#the entries of this table are only the data corresponding to day1 (1/2/2007) and day2 (2/2/2007)

#5. create plot
x <- 1:nrow(data_ready)
P <- data_ready[,3] #Global Active Power
plot(x, P, "l", ylab ="Global Active Power (killowatts)")

#6. save plot in a png file
dev.copy(png, file = "Plot2.png") #save to a png file
dev.off()                         #close screen device
