
# Problem 1
# y_t = 1 + 1.5 y_{t-1} – 0.56x_{t-2} + u_t


#a)

# The Characteristic equations is lambda^2 - 1.5 lambda + 0.56 = 0

# Solving the equation "manually"
discr <- 1.5^2 - 4*0.56
lambda1 <- (1.5 + sqrt(discr))/2
lambda2 <- (1.5 - sqrt(discr))/2

lambda1
lambda2

# Solving the equation using polyroot
# polyroot expects the coefficients in _increasing_ order!
polyroot(c(0.56, -1.5, 1))

# b)
n <- 1000
y <- 1 + arima.sim(model = list(ar = c(1.5, -0.56)), n = n)

# c)

acf(y)
pacf(y)

# d)

fitAR1 <- arima(y, order = c(1, 0, 0))
fitAR1

# f)
resAR1 <- residuals(fitAR1)

# g)
tsdiag(fitAR1)

# h)
Box.test(resAR1, lag = 10, type='Ljung', fitdf = 1)

# i)
fitAR2 <- arima(y, order = c(2, 0, 0))
fitAR2

tsdiag(fitAR2)

resAR2 <- residuals(fitAR2)

Box.test(resAR2, lag = 10, type='Ljung', fitdf = 2)
