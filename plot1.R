#####Creating Plots using R Base Plotting system

energy_data <- read.delim("C://Users//ssakub//Desktop//Reference_material//R//Data-Science-Specialisation-using-R//Assignments//Exploratory_Data_Analysis//household_power_consumption.txt", sep=';', header =TRUE)

# SUbset the dataset to keep the required data for dates= 2007/2/1 and 2007/2/2 and delete the master dataset

energy_data_subset <- subset(energy_data, Date %in% c('1/2/2007', '2/2/2007'))
rm(energy_data)

#Prepare Plot 1:
hist(as.numeric(as.character(energy_data_subset$Global_active_power)), col='red', main='Global Active Power', xlab='Global Active Power (Kilowatts)',
     ylab='Frequency')
# Save the plot to a png device

dev.copy(png, file='plot1.png', height=480, width=480)
dev.off()
