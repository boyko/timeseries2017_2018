
# a)
# install.packages('xts')
library(ggplot2)
library(xts)

# b) 

bitcoins <- read.csv(file = 'https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/bitcoin2017-06-01-2017-11-13.csv',
                     stringsAsFactors = FALSE)
str(bitcoins)

# c) 

btc <- xts(bitcoins$close, order.by = as.Date(bitcoins$Index))
str(btc)

# d) 
ggplot(data = btc, aes(x = Index, y = coredata(btc))) + geom_line()
plot(btc)

# e)

mean(btc['2017-06'])
mean(btc['2017-10'])

# f)

range(btc['/2017-08-31'])
range(btc['2017-09-01/'])

# g) 

weeklyBtcMean <- apply.weekly(btc, mean)
plot(weeklyBtcMean)

# h)

weeklyBtcSd <- apply.weekly(btc, sd)
plot(weeklyBtcSd)

# i)

btc_l1 <- lag(btc)

ggplot(data.frame(btc = btc, btc_l1 = btc_l1), aes(x = btc_l1, y = btc)) + 
  geom_point() + 
  ggtitle('Scatterplot of USD/BTC rates against previous day values.') +
  xlab('USD/BTC') + 
  ylab('USD/BTC t - 1')


# j)

mu <- mean(btc)
mu
gamma1 <- (1/length(btc)) * sum((btc - mu) * (btc_l1 - mu), na.rm = TRUE)
gamma0 <- (1/length(btc)) * sum((btc - mu) ^ 2)
gamma0
gamma1

rho1 <- gamma1/gamma0
rho1

# k)

# Plot the autocorrelation coefficients
acf(btc)

# Print the autocorrelation coefficients
acf(btc, plot = FALSE)

# l) Ljung–Box test for autocorrelation of up to order 10

Box.test(btc, lag = 10, type = 'Ljung')

# m)

logChange <- log(btc) - log(btc_l1)
plot(logChange)

# n)

acf(logChange, na.action = na.omit)

Box.test(logChange, lag = 10, type = 'Ljung')
