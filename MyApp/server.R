# The server side will evaluate the inputs, setup the parameters,
# graph the normal distribution. It will then predict the probability and
# draw a vertical line, then return the text along with it.

# Load the reuired libraries
library(shiny)
library(ggplot2)

# Setup the function
shinyServer(function(input, output) {
# Output for the plot
    output$distPlot <- renderPlot({
    # get the Mean
        m <- input$inMean
    # get the SD
        s <- input$inSD
    # get the value to predict
        val <- input$Pred
    # Establish the 2.5% percentile
        sMin <- qnorm(.025, mean = m, sd = s, lower.tail = TRUE)
    # Establish the 97.5% percentile
        sMax <- qnorm(.975, mean = m, sd = s, lower.tail = TRUE)
    # Setup x as 100 points between the minimum and maximum to setup the plot
        x <- seq(sMin, sMax, (sMax- sMin)/100)
    # Setup y as the normal distribution values of x
        y <- dnorm(x, mean = m, sd = s)
    # Establish if the predicted value is before of after the mean and set the tail
        tail <- ifelse(val<m,TRUE, FALSE)
    # Predict the probability of the input value
        pred <- pnorm(val, mean = m, sd = s, lower.tail = tail)
    # Store a text result of the prediction
        output$result <- renderText(paste("The probability of a", val, "is",
                               round(pred*100,2), "%"))
    # Store x and y in a dataframe
        z <- as.data.frame(x)
        z$y <- y
    # Draw the plot
        ggplot(z, aes(x = x, y = y)) +
            geom_line() +
            geom_vline(data = z, mapping = aes(xintercept = val), color = "blue") +
            geom_text(data = z, mapping=aes(x = val, y = 0,
                                            label = paste(round(pred * 100, 2),
                                                          "%")), 
                      size = 4, angle = 90, vjust = -0.4, hjust = 0) +
            theme_classic()
    })

})
