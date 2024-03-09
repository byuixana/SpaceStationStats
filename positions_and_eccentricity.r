
#Creates the dataset from the csv file. 
ss_dataset <- read.csv("spacestations.csv")
print(ss_dataset)
#Creates a vector for the array column names (the station names).
station_names <- c()

for (station in ss_dataset$OBJECT_NAME)
{
  station_names <- append(station_names, station)
}

#Position vector
positions <- list(
  radial_distance <- c(),
  true_anomalies <- c()
)

position_function <- function(station_names)
{

  for (name in station_names)
  {mean_motion <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == name]

    eccentricity <- ss_dataset$ECCENTRICITY[ss_dataset$OBJECT_NAME == name]

    mean_anomaly <- ss_dataset$MEAN_ANOMALY[ss_dataset$OBJECT_NAME == name]

    ascending_node <- ss_dataset$RA_OF_ASC_NODE[ss_dataset$OBJECT_NAME == name]

    e_old <- mean_anomaly #degrees/radians
    e_new <- 0

    while (abs(e_new - e_old) >= (1 * 10**-4))
    {
      #Enew=M+e⋅sin(E old)
      e_new <- e_old - (e_old - eccentricity*sin(e_old) - mean_anomaly) / (1 - eccentricity * cos(e_old))
      e_old <- e_new
    }
    eccentric_anomaly <- e_old

  # true_anomaly is ν = arctan2(sqrt(1 - e^2) * sin(E), cos(E) - e)
    true_anomaly = atan2(sqrt(1 - eccentricity^2) * sin(eccentric_anomaly), cos(eccentric_anomaly) - eccentricity)

    # a = (9.81 / mean_motion^2)^(1/3)

    periapsis <- ascending_node - true_anomaly
    # position <- a * (1 - eccentricity^2) / (1 + eccentricity * cos(true_anomaly))
    radial_distance <- 1 + eccentricity * cos(true_anomaly - periapsis) / 1 - eccentricity**2

    #Appends to vectors
    positions$radial_distances <- append(positions$radial_distances, radial_distance)
    positions$true_anomalies <- append(positions$true_anomalies, radial_distance)

  }
  return(positions)
}

positions <- position_function(station_names)
plot(positions$radial_distances, positions$true_anomalies, cex = 4)

#Shows the different eccentiricties of the stations. This is measing eccentricity
#which means that there are 6 satellites with more elliptical orbits, a few with semi-circular, one with an almost 
#completely elliptical orbit.
eccentricity <- table(ss_dataset$ECCENTRICITY)

barplot(eccentricity, col="red", xlab = "Eccentricities", ylab = "Eccentricity Frequency")


#Find the future positions of satellites

name <- ss_dataset$OBJECT_NAME[ss_dataset$OBJECT_NAME == "ISS DEB1"]
    
future_mean_motion <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == name]

future_eccentricity <- ss_dataset$ECCENTRICITY[ss_dataset$OBJECT_NAME == name]

future_mean_anomaly <- ss_dataset$MEAN_ANOMALY[ss_dataset$OBJECT_NAME == name]

future_ascending_node <- ss_dataset$RA_OF_ASC_NODE[ss_dataset$OBJECT_NAME == name]

future_e_old <- future_mean_anomaly #degrees/radians

future_e_new <- 0

a <- (9.81 / future_mean_motion^2)^(1 / 3)

while (abs(future_e_new - future_e_old) >= (1 * 10**-4))
{#Enew=M+e⋅sin(E old)
    future_e_new <- future_e_old - (future_e_old - future_eccentricity*sin(future_e_old) - future_mean_anomaly) / (1 - future_eccentricity * cos(future_e_old))
    future_e_old <- future_e_new
}
future_eccentric_anomaly <- future_e_old

time_vector <- c(5, 10, 15, 20, 25, 30)

future_positions <- c()
for (time in time_vector){
  future_position <- a * (1 - future_eccentricity * cos(future_eccentric_anomaly*(time)))
  future_positions <- append(future_positions, future_position)
}

plot(future_positions)

#Orbital period average

#How to create a dataframe
# orbital_periods_dataframe <- data.frame(names <- character())
# #Add each name to data frame
# for (name in station_names)
# {
#   # orbital_periods_dataframe[1, i] <- station_names[i]
#   # str(orbital_periods_dataframe)
#   orbital_periods_dataframe$names <- append(orbital_periods_dataframe$names, name)
# }
print(station_names)

orbital_periods_dataframe <- data.frame(names <- station_names)


orbital_periods <- c()
for (name in station_names)
{
  mean_motion <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == name]
  t <- (2 * 3.14) / mean_motion
  orbital_periods <- append(orbital_periods, t)
}

orbital_periods_dataframe <- data.frame(orbital_periods_dataframe, orbital_periods)

str(orbital_periods_dataframe)
numeric_oribtal_periods <- orbital_periods_dataframe$orbital_periods

barplot(numeric_oribtal_periods, 
names.arg = orbital_periods_dataframe$names, 
cex.axis = 0.3)

#Stacks 3 graphs on top of one another in a single column for comparison.
par(mfrow = c(4, 1))
xlim = c(0, 4)