ss_dataset <- read.csv("spacestations.csv")
library(stringr)
#Create a list of satellites with their eccentricity, their 

#Shows the different eccentiricties of the stations. This is measing eccentricity
#which means that there are 6 satellites with more elliptical orbits, a few with semi-circular, one with an almost 
#completely elliptical orbit.
eccentricity <- table(ss_dataset$ECCENTRICITY)

barplot(eccentricity, col="red", xlab = "Eccentricities", ylab = "Eccentricity Frequency")


#Finds the mean_motions of the each, or how fast the average station goes around in an orbit.
#my_array <- array(c(values_set1, values_set2), dim = c(2, 3))

inclinations <- table(ss_dataset$INCLINATION)

hist(inclinations, col="red", xlab = "Inclinations", ylab = "Frequency of Inclination")

orbital_period_list = list(names = c(),
orbital_period = c())

#Times satellites were launched

object_epochs <- ss_dataset$EPOCH

object_ids <- ss_dataset$OBJECT_ID

for (i in seq_len(object_ids))
{
    print(id)
    id_string <- str_split(object_ids[i], "-")
    print(id_string)
}

#Stacks 3 graphs on top of one another in a single column for comparison.
par(mfrow = c(4, 1))
xlim = c(0, 3)

# mean_motion_1 <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == "ISS (NAUKA)"]

# mean_motion_2 <- ss_dataset$MEAN_MOTION[ss_dataset$OBJECT_NAME == "ISS (ZARYA)"]

# mean_motions <- c(mean_motion_1, mean_motion_2)
# labels <- c("ISS NAUKA", "ISS ZARYA")
# barplot(mean_motions, names.arg = labels)
