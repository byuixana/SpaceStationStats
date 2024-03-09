# library(datasets)

# head(iris)

# summary(iris$Species) # Categorical variables
# summary(iris$Sepal.Length) #Quantitative variable
# summary(iris) #Entire data frame

print(summary(iris$Species))
print(summary(iris$Sepal.Length))
print(summary(iris))

# Create a 2x3 array
my_array <- array(1:6, dim = c(2, 3))

# Display the array
print(my_array)
