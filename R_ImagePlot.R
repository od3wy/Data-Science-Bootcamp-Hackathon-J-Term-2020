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

# Set Working Directory
setwd("~/Jterm")

# Load Data from .csv File
PositionData <- read_csv("AnatomyPositions1.csv", col_names = TRUE)

# Load Background Image
my_image <- readPNG("Human Anatomy.png")

# Create Labels
Labels <- c("Head: 150.5","Shoulder: 180.5","Elbow: 46.5","Wrist: 30",
            "Hip: 75.5","Knee: 381.5","Ankle: 265.5","Toe: 46.5",
            "Hands/Fingers: 76.5","Hamstring: 186","Quadricep: 97","Calf: 57",
            "Tibia/Shin: 11.5","Chest: 33.5","Bicep: 8","Tricep: 3.5",
            "Forearm: 5.5","Neck: 60","Ribs: 48.5","Abdomen: 15.5")

# Plot Position Data with Anatomical Image Background
plot(NULL, xlim=c(0,313),ylim=c(0,886), type='n', main="Frequency of Injuries in the \nNational Football League by Anatomical Location")
rasterImage(my_image, 
            xleft=0, xright=313, 
            ybottom=0, ytop=886)
points(PositionData$X, PositionData$Y)
addTextLabels(
  PositionData$X,
  PositionData$Y,
  Labels,
  cex.label = 0.5,
  col.label = "black",
  col.line = "black",
  col.background = NULL,
  lty = 1,
  lwd = 1,
  border = NA,
  avoidPoints = TRUE,
  keepLabelsInside = TRUE,
  cex.pt = 3
)


