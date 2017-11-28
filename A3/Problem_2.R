
# Assignment 3, Problem 2

# e)

y <- arima.sim(n = 1000, model = list(ar = c(0.7, -0.1)))

acf(y)
pacf(y)
