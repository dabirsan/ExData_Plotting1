
getwd()

read.csv("C://Users//dabir//Documents//R Coursera//Exloratory Data Analysis")
data <- read.table(file.choose("C://Users//dabir//Documents//R Coursera//Exloratory Data Analysis//Project-1-Exploratory-Data-Analysis"), header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = c('character', 'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)


with(t, {
  plot(Global_active_power~dateTime, type= "l",
       ylab="Global Active Power (kilowatts)", xlab="")
  })


dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
