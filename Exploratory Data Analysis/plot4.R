household <- data.table::fread(input = "exploratory_data_analysis_week1_project/household_power_consumption.txt")
household_2day_data <- household[ household$Date %in% c("1/2/2007","2/2/2007") , ]

par(mfrow = c(2,2))
dateTime = strptime(paste(household_2day_data$Date, household_2day_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

plot(dateTime, household_2day_data$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

plot(dateTime, household_2day_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateTime, household_2day_data$Sub_metering_1, type = "l", xlab = "datetime", ylab ="Energy sub metering")
lines(dateTime, household_2day_data$Sub_metering_2, type="l", col="red")
lines(dateTime, household_2day_data$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col = c("black" ,"red" ,"blue"))


plot(dateTime, household_2day_data$Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power")

dev.copy(png, file="exploratory_data_analysis_week1_project/plot4.png", width=480, height=480)
dev.off()