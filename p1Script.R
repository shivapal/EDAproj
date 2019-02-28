# Problem 1
sales1 <- c(12,14,16,29,30,45,19,20,16,19,34,20)
sales2 <- rpois(12,34) #for the most part, values seem to stay between 20 and 40

par(bg="cornsilk") #used to set plot parameters, in this case background

#plots the sales1 data as a line graph, allowing multiple such lines
plot(sales1, col="blue", type="o",ylim=c(0,100),xlab="Month",ylab="Sales")

title(main="Sales by Month")

#plot the line for sales2, using empty squares for data points, using dashed lines, and coloring it red
lines(sales2,type="o",pch=22,lty=2,col="red")

#grid aligns with tick marks on the axis
grid(nx=NA,ny=NULL)

#inset sets distance from margin of the plot
legend("topright",inset=.05,c("Sales1","Sales2"),fill=c("blue","red",horiz=TRUE))

#Problem 2

#choose a file from the file explorer, extracting variable names from the file
sales <- read.table(file.choose(), header=T)
sales

#plot a histogram using the sales data, with title "Sales Data"
barplot(as.matrix(sales), main= "Sales Data", ylab= "Total", beside=T, col=rainbow(5))

#Discussion- the data appears to be similar, except the minimum and maximum are both higher in Sales2

#Problem 3

#use the sales data from problem 2 to make a boxplot, displaying the median, and first and third quartiles
fn <- boxplot(sales,col=c("orange","green"))$stats

#make some text, with x value 1.45, at the position of the median of Sales2, pasting in the median value, with no justification, setting text size to .7 
text(1.45, fn[3,2], paste("Median=", fn[3,2]), adj=0, cex=.7)

text(.45, fn[3,1], paste("Median=", fn[3,1]), adj=0, cex=.7)
grid(nx=NA, ny=NULL)

#Problem 4
fb1 <- read.csv(file.choose())
aapl1 <- read.csv(file.choose())

par(bg="cornsilk")

#plot the "Adj Close" column of aapl1 dataset
plot(aapl1$Adj.Close, col="blue", type="o", ylim=c(150,200), xlab="Days", ylab="Price")

lines(fb1$Adj.Close, type="o", pch=22,lty=2, col="red")

legend("topright", inset=.05, c("Apple", "Facebook"), fill=c("blue", "red"),  horiz=T)

hist(aapl1$Adj.Close, col=rainbow(8))

#Problem 5
data()
attach(BOD)#dataset lists time as independent variable, and Biochemical Oxygen Demand as dependent variable. Unclear what units/system is used.
head(BOD) #hard to see what is going on without a graph, just seems like 
summary(BOD)
detach(BOD)

library(help=datasets)
library(datasets)
head(Loblolly) #Datset tracking growth of Loblolly pine, interpretation is easier in this dataset but again height and age units are not specified
plot(Loblolly) #it seems that these set of graphs attempt to relate height, age, and seed (size?) to each other, using an intersting matrix presentation.

#http://vincentarelbundock.github.io/Rdatasets/datasets.html
#This site has many datasets, described by the type of data and representation of that data, and available in both txt and csv

#Problem 6

#install packages
install.packages("ggmap")
install.packages("ggplot2")
install.packages("maptools")
install.packages("maps")

#load the packages
library("ggmap")
library("maptools")
library(maps)

register_google(key = 'AIzaSyAzCWRarLpXhmd9Dx05XgXsdZetHXCVAog')

visited <- c("SFO", "Chennai", "London", "Melbourne", "Lima,Peru", "Johannesbury, SA")
ll.visited <- geocode(visited)

#keep the visited longitude and latitudes in lists
visit.x <- ll.visited$lon
visit.y <- ll.visited$lat

#make a world map, making red dollar signs where visited
map("world", fill=TRUE, col="white", bg="lightblue", ylim=c(-60, 90), mar=c(0,0,0,0))
points(visit.x,visit.y, col="red", pch=36)

library("ggmap")
library("maptools")
library(maps)
register_google(key = 'AIzaSyAzCWRarLpXhmd9Dx05XgXsdZetHXCVAog')

visited <- c("SFO", "New York", "Buffalo", "Dallas, TX")
ll.visited <- geocode(visited)
visit.x <- ll.visited$lon
visit.y <- ll.visited$lat

#make state map of USA, coloring all 50 states different colors
map("state", fill=TRUE, col=rainbow(50), bg="lightblue", mar=c(0,0,0,0))
points(visit.x,visit.y, col="yellow", pch=36)

#http://statacumen.com/teach/SC1/SC1_16_Maps.pdf
#This resource seems like a pretty good reference if you wanted to make fancy maps

#Problem 7
attach(mtcars)
head(mtcars)

#plot the 1,3,4,5 and 6 columns against each other
plot(mtcars[c(1,3,4,5,6)], main="MTCARS Data")

#same as previous graph just don't plot the "drat" column against the other variables
plot(mtcars[c(1,3,4,6)], main="MTCARS Data")

#color data points differentkly
plot(mtcars[c(1,3,4,5,6)], col=rainbow(5), main="MTCARS Data")


#Problem 8

#updated graphics for plots
library(ggplot2)

#plot out the mpg and disp variables of the mtcars dataset, using points to specify values
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()

browseVignettes()

#Checked out a vignette for ggplot2, here are some of the polygon manipulations I found

#make a data frame, with components named shape, x and y
shapes <- data.frame(
  shape = c(0:19, 22, 21, 24, 23, 20),
  x = 0:24 %/% 5, #vals start from 0, increment every 5 entries
  y = -(0:24 %% 5) #vals are from 0 to 24, each modded by 5
)

#make a plot using the shapes data frame, supplying x and y vals
ggplot(shapes, aes(x, y)) + 
  #assigns shapes to each shape element
  geom_point(aes(shape = shape), size = 5, fill = "red") +
  #label each shape with their numerical descriptor, moving the text to the right of the shape
  geom_text(aes(label = shape), hjust = 0, nudge_x = 0.15) +
  scale_shape_identity() +
  #makes x margine a little bigger to accomadate rightmost label
  expand_limits(x = 4.1) +
  #first argument means there is no axis labels, breaks=NULL removes gridlines
  scale_x_continuous(NULL, breaks = NULL) + 
  scale_y_continuous(NULL, breaks = NULL)