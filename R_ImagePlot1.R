# Data Science Bootcamp: Hackathon
# Author: Olivia DuCharme
# Date: January 14th, 2021

# Load Necessary Libraries
library(tidyverse)
install.packages("png")
library(png)
install.packages("devtools")
library("devtools")
install_github("JosephCrispell/basicPlotteR")
library(basicPlotteR)
install.packages("ggplot2")
library(ggplot2)
install.packages("plotly")
library(plotly) 

# Set Working Directory
setwd("~/Jterm")

# Load Data from .csv File
PositionData <- read_csv("AnatomyPositions1.csv", col_names = TRUE)

# Load Background Image
my_image <- readPNG("Human Anatomy.png")

# Plot Position Data with Anatomical Image Background

background_image <- function(rasterImage){
  annotation_raster(rasterImage, 
            xmin=0, xmax=313, 
            ymin=0, ymax=886)
}
p <- ggplot(PositionData, aes(PositionData$X, PositionData$Y,name = PositionData$Incidence)) + background_image(my_image) + geom_point() + xlim(0,313) + ylim(0,886)
ggplotly(p + 
           ggtitle("Frequency of Injuries in the \nNational Football League by Anatomical Location") +
           theme(panel.grid.major=element_blank(),
                 panel.grid.minor=element_blank()) 
)

