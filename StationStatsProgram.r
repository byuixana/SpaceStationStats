

#They will be given the option to pull up a graph of the stations positions

#Users can select a specific station, or a group of stations, and get the future positions of that satellite 
#will be in. 

#What kind of graph should I use to represent future distance? I want the name and the day to be shown. Scatterplot would probably be best.

#Checks how much an object occurs in a dataset. 
ss_dataset <- read.csv("spacestations.csv")

target_object <- "ISS (ZARYA)"

mean_motion <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == target_object]

eccentricity <- ss_dataset$ECCENTRICITY[ss_dataset$OBJECT_NAME == target_object]

mean_anomaly <- ss_dataset$MEAN_ANOMALY[ss_dataset$OBJECT_NAME == target_object]

cat("Mean motion:", mean_motion,"Eccentricity", 
eccentricity,
"Mean Anomaly: ", mean_anomaly)
# print(mean_motion)
# print(eccentricity)
# print(mean_anomaly)

a = (9.81 / mean_motion^2)^(1/3)
# print(a)

e_old =181.819 #degrees/radians
e_new = 0
#M = eccentric_anomaly - eccentricity * sin(eccentric_anomaly)
while (abs(e_new-e_old) >= (1 * 10**-4))
{
  #Enew=M+e⋅sin(E old)
    # e_new = mean_anomaly - eccentricity * (sin(e_old)) / (1 - eccentricity*cos(e_old))
    #  e_new = e_old - (e_old - eccentricity * sin(e_old) - mean_anomaly) / (1 - eccentricity * cos(e_old))
    e_new = e_old - (e_old - eccentricity*sin(e_old) - mean_anomaly) / (1 - eccentricity * cos(e_old))
    e_old = e_new
    print(e_old)
}
eccentric_anomaly <- e_old

# occurrences <- table(ss_dataset$OBJECT_NAME)[target_object]

# print(occurrences)

#Formulas provided by ChatGPT:

#Semi-major axis equation:
#a is the axis
#a = (GM / mean_motion^2)^(1/3)
#GM = 9.81 #meters per second squared
#M is the ssDataset$MEAN_ANOMALY

#Eccentric Anomaly
#Kepler's equation: 
#while (e_new < 1*10**-4)
#e_new = e_old - (e_old) - (eccentricity-sin(e_old) - mean_anomaly) / 1 - eccentricty*cos(e_old)
#e_old = e_new
# true_anomaly is ν = arctan2(sqrt(1 - e^2) * sin(E), cos(E) - e)
#position = a * (1 - e^2) / (1 + e * cos(ν))

target_object <- "ISS (ZARYA)"

mean_motion <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == target_object]

eccentricity <- ss_dataset$ECCENTRICITY[ss_dataset$OBJECT_NAME == target_object]

mean_anomaly <- ss_dataset$MEAN_ANOMALY[ss_dataset$OBJECT_NAME == target_object]
#Create a vector for future days
days_vector <- c(5, 10, 15, 20, 25, 30)

future_positions <- list()

#Create a for loop to iterate through the days vector.
for (value in days_vector)
{
    position <- (mean_motion + mean_anomaly) * value
    future_positions <- append(future_positions, position)
}

print(future_positions)

plot(
x = days_vector,
y = future_positions,
cex = 10)





