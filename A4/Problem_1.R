# Problem 2

# a) Stationarity
# Characteristic equation: lambda^2 - 1.4*lambda + 0.85

lambdas <- polyroot(c(0.85, -1.4, 1))
lambdas

lambdas

# Compute the absolute value of the roots
sqrt(0.7^2 + 0.6^2)

# or using the abs function
abs(lambdas)

# Plot the autocorrelation and partial autocorrelation functions
pacf(y)
acf(y)

# b) Simulation

n <- 1000
y <- arima.sim(list(ar=c(1.4, -0.85)), n)

# c) Cycle period

## Frequency of oscillation
f <- acos(1.4/(2*sqrt(0.85)))

# Period of the cycles
P <- 2*pi/f
P
