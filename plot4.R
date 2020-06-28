#####Creating Plots using R Base Plotting system

energy_data <- read.delim("q1.txt", sep=';', header =TRUE)

# SUbset the dataset to keep the required data for dates= 2007/2/1 and 2007/2/2 and delete the master dataset

energy_data_subset <- subset(energy_data, Date %in% c('1/2/2007', '2/2/2007'))
rm(energy_data)

#Join the Data and Time columns to create date_time column of Date class


energy_data_subset$date_time <- strptime(paste(energy_data_subset$Date, energy_data_subset$Time), format="%d/%m/%Y %H:%M:%S")


#Prepare Plot 4:
#Setting the parameter for multiple plots

par(mfrow=c(2,2))


# Sub Plot 1
plot(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Global_active_power)), type='l',
     col='black', xlab='', ylab='Global Active Power')

#Sub Plot 2
plot(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Voltage)), type='l',
     col='black', xlab='datetime', ylab='Voltage')

#Sub Plot 3
plot(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_1)), type='n',
     col='black', xlab='', ylab='Energy sub metering')

points(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_1)), type='l',
       col='black', xlab='', ylab='')
points(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_2)), type='l',
       col='red', xlab='', ylab='')
points(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_3)), type='l',
       col='blue', xlab='', ylab='')


legend("topright", lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', "Sub_metering_2", 'Sub_metering_3'),bty='n')

#Sub Plot 4
plot(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Global_reactive_power)), type='l',
     col='black', xlab='datetime', ylab='Global_reactive_power')


# Save the plot to a png device

dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()

