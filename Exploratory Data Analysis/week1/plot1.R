household <- data.table::fread(input = "exploratory_data_analysis_week1_project/household_power_consumption.txt")
head(household)
dim(household)
household$Date = as.Date(household$Date , "%d/%m/%Y")
class(household$Date)

household_2day_data <- household[ household$Date>=as.Date("2007-02-01") , ]
household_2day_data <- household_2day_data[ household_2day_data$Date<= as.Date("2007-02-02") , ]
range(household_2day_data$Date)
dim(household_2day_data)

class(household_2day_data$Global_active_power)
household_2day_data$Global_active_power =  as.numeric(household_2day_data$Global_active_power)
class(household_2day_data$Global_active_power)

hist(household_2day_data$Global_active_power , col = "red" , main = paste("Global Active Power") , xlab = "Global Active Power(kilowatts)" )
dev.copy(png, file="exploratory_data_analysis_week1_project/plot1.png", width=480, height=480)
dev.off()
