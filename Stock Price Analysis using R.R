install.packages(c("quantmod", "TTR"))
library(quantmod)
library(TTR)

# Get Samsung stock data from Yahoo Finance
getSymbols("005930.KS", src = "yahoo", from = "2023-01-01", to = Sys.Date())
head(`005930.KS`)

# Calculate 50-day and 200-day SMA
`005930.KS`$SMA50 <- SMA(Cl(`005930.KS`), n = 50)
`005930.KS`$SMA200 <- SMA(Cl(`005930.KS`), n = 200)

# Plot the closing price and SMAs
chartSeries(`005930.KS`, name = "Samsung Stock Price with Moving Averages", 
            TA = c(addSMA(n = 50, col = "blue"), addSMA(n = 200, col = "red")))
