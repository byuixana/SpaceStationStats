# #Data organization on the CSV file
# "OBJECT_NAME,OBJECT_ID,EPOCH,MEAN_MOTION,
# ECCENTRICITY,INCLINATION,RA_OF_ASC_NODE,ARG_OF_PERICENTER,MEAN_ANOMALY,
# EPHEMERIS_TYPE,CLASSIFICATION_TYPE,NORAD_CAT_ID,ELEMENT_SET_NO,REV_AT_EPOCH,BSTAR,
# MEAN_MOTION_DOT,MEAN_MOTION_DDOT"

ssDataset <- read.csv("spacestations.csv")

# print(ssDataset)

# change_over_time <- table(ssDataset$MEAN_MOTION_DOT)

# hist(change_over_time, type = "l", col="blue", xlab = "x axis", ylab = "y axis")

# epochs <- table(ssDataset$EPOCH)

# hist(epochs, type = "l", col="green", xlab = "x axis", ylab = "y axis")

# eccentricity <- table(ssDataset$ECCENTRICITY)

# #Shows the different eccentiricties of the stations. This is measing eccentricity
# #which means that there are 6 satellites with more elliptical orbits, a few with semi-circular, one with an almost 
# #completely elliptical orbit.
# barplot(eccentricity, type = "l", col="red", xlab = "x axis", ylab = "y axis")

# #Stacks 3 graphs on top of one another in a single column for comparison.
# # par(mfrow = c(3, 1))
# # xlim = c(0, 3),

#Checks how much an object occurs in a dataset, in the case ISS DEB. 
# target_object <- "ISS DEB"

# occurrences <- table(ssDataset$OBJECT_NAME)[target_object]

# print(occurrences)

#Pulls the data from the ISS DEB space stations and compares their eccentiricites.

"
Energy Requirements:
The eccentricity of an orbit affects the energy requirements for a satellite.
Satellites in more eccentric orbits experience varying levels of gravitational force as they move through their orbit, requiring more energy for propulsion and control.
Comparing eccentricities can give insights into the energy needs and constraints of different satellite missions.
The stations with higher eccentricities cost teh US, Russia, Japan, and Europe a LOT more money. 
This is also me practicing multi-line comments in R :).
"
# print(ssDataset$ECCENTRICITY[ssDataset$OBJECT_NAME == "ISS DEB"])
# barplot(
# height = ssDataset$ECCENTRICITY[ssDataset$OBJECT_NAME == "ISS DEB"], 
# names.arg = ssDataset$OBJECT_NAME[ssDataset$OBJECT_NAME == "ISS DEB"],
# main = "Eccentricity of ISS DEB satellites",
# col = "red")

#How to use summary

# print(summary(ssDataset$epochs))

# print(summary(ssDataset$ECCENTRICITY))

# barplot(
#     height = ssDataset$ECCENTRICITY,
#     names.arg = ssDataset$OBJECT_NAME,
#     main = "Eccentricity of All Satellites",
#     col = "blue"
# )

# print(summary(ssDataset))

#How do I summarize the data for each satellite (or get the average of it)?

# print(ssDataset$ECCENTRICITY)

#Calculating an object's future position in space
#row in seq_len(nrow(ssDataset))
future_positions <- c()

