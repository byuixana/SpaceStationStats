ss_dataset <- read.csv("spacestations.csv")

#Create a list of satellites with their eccentricity, their 

#Shows the different eccentiricties of the stations. This is measing eccentricity
#which means that there are 6 satellites with more elliptical orbits, a few with semi-circular, one with an almost 
#completely elliptical orbit.
eccentricity <- table(ss_dataset$ECCENTRICITY)

barplot(eccentricity, col="red", xlab = "Eccentricities", ylab = "Eccentricity Frequency")

#Stacks 3 graphs on top of one another in a single column for comparison.
par(mfrow = c(4, 1))
xlim = c(0, 3)

mean_motion_1 <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == "ISS (NAUKA)"]

mean_motion_2 <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == "ISS (ZARYA)"]

mean_motions <- c(mean_motion_1, mean_motion_2)
labels <- c("ISS NAUKA", "ISS ZARYA")
barplot(mean_motions, names.arg = labels)

target_object <- "ISS (ZARYA)"

mean_motion <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == target_object]

eccentricity <- ss_dataset$ECCENTRICITY[ss_dataset$OBJECT_NAME == target_object]

mean_anomaly <- ss_dataset$MEAN_ANOMALY[ss_dataset$OBJECT_NAME == target_object]

cat("Mean motion:", mean_motion,"Eccentricity", 
eccentricity,
"Mean Anomaly: ", mean_anomaly)

a = (9.81 / mean_motion^2)^(1/3)

e_old =181.819 #degrees/radians
e_new = 0

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
