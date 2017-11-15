# Assignment 2, Problem 1

# a) Create character vector

datesChar <- c('2017-11-09', '2017-11-10')

# b) Coerce to class Date
dates <- as.Date(datesChar, format = '%Y-%m-%d')
class(dates)

as.numeric(dates)
# c) Format dates

as.Date(as.numeric(dates[1]) - 17479, origin='1970-01-01')

datesFormatted <- format(dates, '%d %B %Y')
datesFormatted

# d) Numeric representation of dates

datesNumeric <- as.numeric(dates)

# e) 

as.Date(datesNumeric, origin = '1970-01-01')

# f)

dailySeq <- seq(as.Date('2017-11-01'), as.Date('2017-11-17'), by='day')
?seq.Date

# g)

weeklySeq <- seq(as.Date('2017-11-01'), as.Date('2017-12-23'), by='week')
weeklySeq



