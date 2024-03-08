ss_dataset <- read.csv("spacestations.csv")

#Calculating an object's future position in space

future_positions_dataframe <- data.frame()(
  Name = c(),
  Position = c()
)

for (row_num in 1:nrow(ssDataset))
{
  # position <- (ssDataset$MEAN_ANOMALY[row_num] + 
  # ssDataset$MEAN_MOTION[row_num]) * 30
  # position_and_satellite <- list(
  #   Name = ssDataset$OBJECT_NAME,  # nolint
  #   Position = position)
    # future_positions <- append(position_and_satellite)
}

# print(future_positions)