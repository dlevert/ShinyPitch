The purpose of this app is to take a mean and standard deviation and produce a standard distribution.

It them takes a value input to predict the probability of this value. 

It also plots the results for visual reference.

***
To use the file, simple enter the Mean and Standard Deviation for your data,
then slelect a value to predict from. The app will draw and return your results automatically.

***

The ui.R file:

1. Loads the required Libraries.
2. Sets up and formats the page.
3. Gets the required inputs.
4. Displays the results.
5. Writes the results in text format.

***

The server.R file:

1. Loads the required libraries.
2. Sets up the function.
3. Sets up the Output for the plot.
4. Gets the mean, standard deviation, and value to predict from ui.R.
5. Establish the 2.5% and 97.5% percentiles.
6. Sets up 'x' as 100 points between the minimum and maximum to setup the plot.
7. Sets up 'y' as the normal distribution values of 'x'.
8. Determines if the value to predict should inlude the tail of the prediction.
9. Predicts the probability.
10. Writes the text results.
11. Converts 'x' and 'y' into a data frame.
12. Generates the plot using ggplot2.