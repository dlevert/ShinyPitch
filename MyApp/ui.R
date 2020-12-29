# The purpose of this app is to take a mean and standard deviation and produce
# a standard distribution. It them takes a value input to predict the probability
# of this value. It also plots the results for visual reference.

# Load the required Libraries
library(shiny)
library(ggplot2)
# Setup the page
shinyUI(fluidPage(
    titlePanel("Probability Predictor"),
    h3("Predict a value from a normal distribution"),
    sidebarLayout(
# Get the required inputs
        sidebarPanel(
            numericInput("inMean", "Input the mean of your data",
                         value = 10, min = 1, max = 20000000000, step = 1),
            numericInput("inSD", "Input the standard deviation of your data",
                         value = 5, min = .01, max = 20000000, step = .01),
            numericInput("Pred", "Enter a value to predict probability", 
                         value = 7, min = .01, max = 20000000000, step = .01),
            "Enter your Mean and Standard Deviation",
            "Then pick a value within the distribution to predict",
            ),
        
        mainPanel(
# Display the results
            plotOutput("distPlot"),
# Written results
            h3(textOutput("result"))
        ))
))
