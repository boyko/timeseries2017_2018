library(xts)
library(urca)

#####################################################
## Simulation of random walks, spurious regression ##
#####################################################

# Set the seed for the random numbers generator
# to ensure reproducibility of the results

set.seed(123)

# Set series length
n <- 1000

# Generate n (independent) draws from the standard normal distribution
# for the first random walk
xNorm <- rnorm(n)

# Do the same for the second random walk
yNorm <- rnorm(n)

x <- cumsum(xNorm)
y <- cumsum(yNorm)

# Construct an xts object and plot the data

timeIndex <- seq(as.Date('1980-01-01'), by="day", length.out = n)
timeSeries <- xts(cbind(x, y), order.by = timeIndex)
plot(timeSeries)


summary(lm(y ~ x))


#################################
# Dickey Fuller unit root tests #
#################################


# Dickey-Fuller test applied to the first random walk
summary(ur.df(x, selectlags = "Fixed", lags = 0))


# Dickey-Fuller test applied to a stationary AR(1) proccess
stationaryAR1 <- arima.sim(n = n, model = list(ar = c(0.5)))
plot(stationaryAR1)

summary(ur.df(stationaryAR1, selectlags = "Fixed", lags = 0, type="none"))

# Dickey-Fuller test applied to a trend-stationary series with a linear trend

trendStationary <- 1:n + stationaryAR1

summary(ur.df(trendStationary, selectlags = "Fixed", lags = 0, type="none"))
summary(ur.df(trendStationary, selectlags = "Fixed", lags = 0, type="trend"))


# Problem 2
dat <- read.csv("https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/LakeHuron.csv")

timeIndex <- seq(as.Date('1875-01-01'), as.Date("1972-01-01"), by="year")
timeIndex

timeSeries <- xts(dat$x, order.by = timeIndex)

plot(timeSeries)

summary(ur.df(timeSeries, type="drift"))
