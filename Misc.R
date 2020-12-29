# Normal distribution probability predictor
require(plotly)
require(ggplot2)
mn <- 10
sd <- 5
val <- 7

sMin <- qnorm(.025, mean = mn, sd = sd, lower.tail = TRUE)
sMax <- qnorm(.975, mean = mn, sd = sd, lower.tail = TRUE)

x <- seq(sMin, sMax, 0.1)
y <- dnorm(x, mean = mn, sd = sd)
pred <- pnorm(val, mean = mn, sd = sd, lower.tail = FALSE)
z <- as.data.frame(x)
z$y <- y

g <- ggplot(z, aes(x = x, y = y)) +
     geom_line() +
     geom_vline(data = z, mapping = aes(xintercept = val), color = "blue") +
     geom_text(data = z, mapping=aes(x = val, y = 0.015,
                                     label = paste("Probablity is ",
                                                   round(pred * 100, 2),
                                                   "%")), 
               size = 4, angle = 90, vjust = -0.4, hjust = 0) +
     theme_classic()

ggplotly(g)

plot(x, dnorm(x, mean = mn, sd = sd), type = "l",
     lwd = 2, col = "red") 
points(val, pred, pch = 18)


library(rsconnect)
rsconnect::deployApp('/Users/DenisLevert/Documents/R/R_School/ShinyPitch/MyApp')

# Shiny URL:
# https://dlevert.shinyapps.io/myapp/?_ga=2.231688790.832080716.1609268414-608553947.1609268414

# Github URL:
# https://github.com/dlevert/ShinyPitch.git

