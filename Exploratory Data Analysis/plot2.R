household <- data.table::fread(input = "exploratory_data_analysis_week1_project/household_power_consumption.txt")

household_2day_data <- household[ household$Date %in% c("1/2/2007","2/2/2007") , ]

global_active_power =  as.numeric(household_2day_data$Global_active_power)
dateTime = strptime(paste(household_2day_data$Date, household_2day_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="exploratory_data_analysis_week1_project/plot2.png", width=480, height=480)
dev.off()