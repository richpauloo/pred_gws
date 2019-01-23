library(forecast)

# time
t <- time(sunspots) %>% zoo::yearmon() %>% lubridate::as_date()

# data
df <- data.frame(d = as.matrix(sunspots), t = t)

# plot
library(ggplot2)
ggplot(df, aes(t, d)) + geom_line()

# summarise into annual values
dfy <- df %>% 
  mutate(year = lubridate::year(t)) %>% 
  group_by(year) %>% 
  summarise(dy = sum(d))

# create new ts object
ty <- ts(data = dfy$dy, start = c(1749, 1), end = c(1983, 1), frequency = 1)

# fit NN model
fit <- nnetar(ty)
autoplot(forecast(fit,h=30))

# forecast
fcast <- forecast(fit, PI=TRUE, h=30)
autoplot(fcast)

######################################
# try with actaul data
d <- read.csv("C:/Users/rpauloo/Desktop/pred_gws/data/response/storage_cv.csv")
d$dt <- substr(d$dt, start = 1, stop = 10)
d <- d %>% mutate(t  = lubridate::ymd(dt),
                  yr = lubridate::year(dt))

# annually averaged
dy <- d %>% group_by(yr) %>% summarise(syr = sum(s)) %>% filter(! yr %in% c(1973, 2015))

# create new ts object
gwts  <- ts(data = d$s, start = c(1973, 10), end = c(2015, 9), frequency = 12)
gwtsy <- ts(data = dy %>% filter(yr <= 2012) %>% pull(syr), 
            start = c(1974, 1), 
            end = c(2012, 1), 
            frequency = 1)

# fit NN model
fit <- nnetar(gwtsy)
autoplot(forecast(fit,h=3)) +
  geom_line(data = dy, aes(yr, syr))

# forecast
fcast <- forecast(fit, PI=TRUE, h=30)
autoplot(fcast)




