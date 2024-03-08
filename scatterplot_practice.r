library(datasets)

head(mtcars)


#Show the variables separately
hist(mtcars$wt)
hist(mtcars$mpg)

# plot(mtcars$wt, mtcars$mpg)

#Add options to the graph

plot(mtcars$wt, mtcars$mpg,
pch = 18, #makes the dots solid
cex = 3, #determines the size of the dots
col = "#cc0000", #sets the folor
main = "MPG as a Function of Weight of Cars", #name of the graph
xlab = "Weight (in 1000 pounds)", #the weight is the independant variable
ylab = "MPG") #The MPG is determined by the weight

