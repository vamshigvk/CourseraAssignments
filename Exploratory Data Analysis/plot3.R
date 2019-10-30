household <- data.table::fread(input = "exploratory_data_analysis_week1_project/household_power_consumption.txt")
household_2day_data <- household[ household$Date %in% c("1/2/2007","2/2/2007") , ]

dateTime = strptime(paste(household_2day_data$Date, household_2day_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- as.numeric(household_2day_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(household_2day_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(household_2day_data$Sub_metering_3)

plot(dateTime, Sub_metering_1, ylim = c(0,40), xlab="", ylab="Enery sub metering",  type="l",col="black")
 
par(new=TRUE)
plot(dateTime, Sub_metering_2, ylim = c(0,40) ,  ylab="Enery sub metering", type="l",col="red")

par(new=TRUE)
plot(dateTime, Sub_metering_3 , ylim = c(0,40), ylab="Enery sub metering", type="l", col="blue")

# lines(dateTime, Sub_metering_2, type="l", col="red")
# lines(dateTime, Sub_metering_3, type="l", col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col = c("black" ,"red" ,"blue"))

dev.copy(png, file="exploratory_data_analysis_week1_project/plot3.png", width=480, height=480)
dev.off()