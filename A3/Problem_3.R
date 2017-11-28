library(xts)
# Assignment 3, Problem 1

# d) Simulation 

n <- 1000
u <- rnorm(n)
mut <- 2 + 3 * (1:n)

y <- mut + 20 * u

timeIdx <- seq(as.Date('2017-11-01'), by = 'day', length.out = n)
yts <- xts(y, order.by = timeIdx)

# e)

## Plot the time series

plot(yts)

## Plot the autocorrelation function

acf(yts)

## Plot the partial autocorrelation function

pacf(yts)

# f)

ytsDiff <- diff(yts)

# g)

## Plot the series
plot(ytsDiff)

## Plot the autocorrelation function

acf(ytsDiff, na.action = na.omit)


## Plot the partial autocorrelaiton function

pacf(ytsDiff, na.action = na.omit)

