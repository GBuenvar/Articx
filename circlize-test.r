
# library
library(circlize)
 
# Create data
set.seed(123)
data = data.frame(
    factor = sample(letters[1:8], 1000, replace = TRUE),
    x = rnorm(1000), 
    y = runif(1000)

    )
 
# Initialize the plot.
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )
 
# Build the regions of track #1
circos.trackPlotRegion(factors = data$factor, y=data$y , bg.col = rgb(0.1,0.1,seq(0,1,0.1),0.4) , bg.border = NA)
 
# Add a link between a point and another
circos.link("a", 0, "b", 0, h = 0.4)
 
# Add a link between a point and a zone
circos.link("e", 0, "g", c(-1,1), col = "green", lwd = 2, lty = 2, border="black" )
 
# Add a link between a zone and another
circos.link("c", c(-0.5, 0.5), "d", c(-0.5,0.5), col = "red", border = "blue", h = 0.2)


# use the concepts of the last example to create a plot that uses 
# [[0, 1, 2], [2, 0, -1], [-1, 1, 0]] as the adjacency matrix to plot, 
# plotting the 3 nodes and the edges that connect them, using links from zones to points,
# using the adjacency matrix to determine the colors of the edges (negative = red, positive = blue),
# and for the width of the edge in the source node (the node that the edge is coming from),
# use the absolute value of the edge weight.

# Path: circlize-test.r

# library
library(circlize)

# Create data
set.seed(123)
data = data.frame(
    factor = sample(letters[1:3], 1000, replace = TRUE),
    x = rnorm(1000), 
    y = runif(1000)
    )

# Initialize the plot.
par(mar = c(1, 1, 1, 1) )
circos.initialize(factors = data$factor, x = data$x )

# Build the regions of track #1
circos.trackPlotRegion(factors = data$factor, y=data$y , bg.col = rgb(0.1,0.1,seq(0,1,0.1),0.4) , bg.border = NA)

# Add a link between a point and another
circos.link("a", 0, "b", 0, h = 0.4)

# Add a link between a point and a zone
circos.link("e", 0, "g", c(-1,1), col = "green", lwd = 2, lty = 2, border="black" )

# Add a link between a zone and another

# create the adjacency matrix
adjacency_matrix = matrix(c(0, 1, 2, 2, 0, -1, -1, 1, 0), nrow = 3, ncol = 3, byrow = TRUE)

# create the colors vector
colors = c("red", "blue")

# create the widths vector
widths = c(1, 2)

# create the border vector
borders = c("black", "black")

# create the lty vector
ltys = c(1, 1)

# create the lwd vector
lwd = c(1, 1)

# create the h vector
hs = c(0.2, 0.2)

# create the lty2 vector
lty2 = c(1, 1)

# create the lwd2 vector
lwd2 = c(1, 1)

# create the h2 vector
h2 = c(0.2, 0.2)

# create the col2 vector
col2 = c("red", "blue")

# create the border2 vector
border2 = c("black", "black")

# create the lty3 vector

