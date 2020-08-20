
getwd()

read.csv("C://Users//dabir//Documents//R Coursera//Exloratory Data Analysis")

data <- read.table(file.choose("C://Users//dabir//Documents//R Coursera//Exloratory Data Analysis//Project-1-Exploratory-Data-Analysis"), header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = c('character', 'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

newdata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")

hist(newdata$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

png("plot1.png", width = 480, height = 480)
dev.off()
