
y <- 1 + arima.sim(n = 1000, model = list(ma = c(0.8, -0.2)))

acf(y)
pacf(y)
