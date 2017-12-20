
# Load libs
library(xts)

# a) Read data
gdp <- read.csv('https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/gdp_bg_qrt_2000-2017.csv')

# b) Create time series object
timeIndex <- as.yearqtr(gdp$Index, format = '%YQ%q')
gdpSeries <- xts(gdp$GDP, order.by = timeIndex)

# c)
plot(gdpSeries)

# d)
gdpGrowth <- diff(log(gdpSeries), lag=4)

# e)

acf(gdpGrowth, na.action = na.omit)
pacf(gdpGrowth, na.action = na.omit)

fitAR0 <- arima(gdpGrowth, order = c(0, 0, 0))
fitAR0

fitAR1 <- arima(gdpGrowth, order = c(1, 0, 0))
fitAR1

fitAR2 <- arima(gdpGrowth, order = c(2, 0, 0))
fitAR2

fitAR3 <- arima(gdpGrowth, order = c(3, 0, 0))
fitAR3

fitAR4 <- arima(gdpGrowth, order = c(4, 0, 0))
fitAR4

# f)

res1 <- residuals(fitAR1)
plot(res1)

acf(res1, na.action = na.omit)

Box.test(res1, lag=12, type='Ljung', fitdf = 1)

# All of the above
tsdiag(fitAR1)

# g)
pred1step <- predict(fitAR1, 1)
pred1step
