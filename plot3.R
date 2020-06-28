#####Creating Plots using R Base Plotting system

energy_data <- read.delim("C://Users//ssakub//Desktop//Reference_material//R//Data-Science-Specialisation-using-R//Assignments//Exploratory_Data_Analysis//household_power_consumption.txt", sep=';', header =TRUE)

# SUbset the dataset to keep the required data for dates= 2007/2/1 and 2007/2/2 and delete the master dataset

energy_data_subset <- subset(energy_data, Date %in% c('1/2/2007', '2/2/2007'))
rm(energy_data)

#Join the Data and Time columns to create date_time column of Date class


energy_data_subset$date_time <- strptime(paste(energy_data_subset$Date, energy_data_subset$Time), format="%d/%m/%Y %H:%M:%S")


#Prepare Plot 3:


plot(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_1)), type='n',
     col='black', xlab='', ylab='Energy sub metering')

points(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_1)), type='l',
       col='black', xlab='', ylab='')
points(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_2)), type='l',
       col='red', xlab='', ylab='')
points(energy_data_subset$date_time, as.numeric(as.character(energy_data_subset$Sub_metering_3)), type='l',
       col='blue', xlab='', ylab='')


legend("topright", lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', "Sub_metering_2", 'Sub_metering_3'))


# Save the plot to a png device

dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()
