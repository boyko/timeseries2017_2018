
# Assignment 1 Problem 3

# 1)

# Install packages. Uncomment the next line and run it if you
# dplyr and ggplot2 are not installed in your R instance.
# You need to install packages only once!
# install.packages(c('dplyr', 'ggplot2'))

# Load the packages
# You need to install packages only once, but in order to use them
# you need to load them every time you start a new R session.
library(dplyr)
library(ggplot2)

# 2)

wines <- read.csv(file='https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/wine.csv')
str(wines)
wines

# 3)
wines <- within(wines, {
  Price <- exp(LogPrice)
})

# 4)

wines <- within(wines, {
  TemperatureClass <- ifelse(Temperature > mean(Temperature), 'hot', 'cold')
})

# 5)

table(wines$TemperatureClass)


# 6)

winesByTempClass <- group_by(wines, TemperatureClass)

summarise(winesByTempClass,
          mean = mean(Price),
          sd = sd(Price),
          min = min(Price),
          max = max(Price),
          median = median(Price)
          )
# 7) Boxplot, for a very readable guide on using ggplot2 see
## http://r4ds.had.co.nz/data-visualisation.html#introduction-1

ggplot(data = wines, aes(x = TemperatureClass, y = Price)) + geom_boxplot()

# 8)

fit <- lm(Price ~ TemperatureClass, data = wines)
summary(fit)

# 9)

ggplot(data = wines, aes(x = Temperature, y = Price)) + geom_point()

# 10) (Pearson) Correlation coefficient

cor(wines$Price, wines$Temperature)

# 11)

fit1 <- lm(Price ~ Temperature, data = wines)
summary(fit1)

# 12)

ggplot(data = wines, mapping = aes(x = Temperature, y = Price)) +
  geom_point() +
  geom_abline(slope=0.1879, intercept = -2.8082)

# or alternatively, using geom_smooth wich runs the same regression
# from 11) to compute the coefficients

ggplot(data = wines, mapping = aes(x = Temperature, y = Price)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
