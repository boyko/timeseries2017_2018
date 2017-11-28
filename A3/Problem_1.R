
n <- 1000
whiteNoise <- 2 * rnorm(n)
y <- arima.sim(n = n, 
               model = list(ar = c(-0.8)),
               innov = whiteNoise)

acf(y)
pacf(y)
