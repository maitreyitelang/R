getwd()
setwd(".\\Weather Data")
getwd()

#Read Data
Chicago <- read.csv("Chicago-F.csv", row.names = 1)
NewYork <- read.csv("NewYork-F.csv", row.names = 1)
Houston <- read.csv("Houston-F.csv", row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names = 1)

#Checking the Data
Chicago
NewYork
Houston
SanFrancisco


#Converting the dataframes into matrices
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

is.matrix(Chicago)

#Putting all the matrices into a list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather

#Using apply()
apply(Chicago, 1, mean)
apply(Chicago, 1, max)
apply(Chicago, 1, min)


apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#Using lapply()
mynewlist <- lapply(Weather, t)
mynewlist 

#new lapply() example
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12)

#Exapmle 3
lapply(Weather, rowMeans)

#Combining lapply() with [] operator
Weather[[1]][1,1]
Weather$Chicago[1,1]

lapply(Weather, "[", 1, 1)

#For the whole first row for each of the lists in Weather
lapply(Weather, "[", 1, )

lapply(Weather, "[", , 3)

#Applying your own functions
#5th row of all the lists in Weather
lapply(Weather, function(x) x[5,])

#December column for all the rows of the lists in Weather 
lapply(Weather, function(x) x[,12])

#Difference in degree F between avg high and low 
lapply(Weather, function(z) z[1,]-z[2,])

#Temperature fluctuations 
lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))

#Using sapply

#AvgHigh_F for July
lapply(Weather, "[", 1, 7)
sapply(Weather, "[", 1, 7)

#AvgHigh_F for 4th quarter
sapply(Weather, "[", 1, c(10,11,12))
#same as above
#sapply(Weather, "[", 1, 10:12)

sapply(Weather, rowMeans)
round(sapply(Weather, rowMeans), 2) #Dev 1

#lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2)) Dev 2
#Temperature Fluctuations
sapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))

#sapply = lapply
sapply(Weather, rowMeans, simplify = FALSE)

#Nesting apply() functions
#getting Means/averages for all the rows
lapply(Weather, rowMeans)

#Getting maximums and minimums
#Getting max for each row in Chicago list
apply(Chicago, 1, max)

#Getting max for each row in all the lists
lapply(Weather, apply, 1, max)

#Another way
lapply(Weather, function(x) apply(x, 1, max))

sapply(Weather, apply, 1, max)
sapply(Weather, apply, 1, min)

#which.max() and which.min()
#Calculates which is the max in first row of list Chicago and gives us the index 7  
which.max(Chicago[1,]) 
#To get the name for the index of the named vector
names(which.max(Chicago[1,]))

#To apply to all the rows of Chicago
apply(Chicago, 1, function(x) names(which.max(x)))

#To apply to all the matrices in Weather
lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))

sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
