date_split <- function(dataframe) {
  dataframe$Date <- sapply(strsplit(as.character(dataframe$DateTime), " "), "[", 1)
  dataframe$Time <- sapply(strsplit(as.character(dataframe$DateTime), " "), "[", 2)
  return(dataframe)
}

normal_distribution <- function(dataframe)
{
  # Make a histogram
  d_binsize <- IQR(dataframe)/4
  d_mean <- mean(dataframe)
  d_sd   <- sd(dataframe)
  d_min  <- min(dataframe) - d_sd
  d_max  <- max(dataframe) + d_sd
  
  # generate normally distributed data with mean d_mean and standard deviation d_sd
  d_norm <- rnorm(10000, d_mean, sd=d_sd)
  d_min2 <- min(d_norm)
  d_max2 <- max(d_norm)
  if (d_min2 < d_min) { d_min <- d_min2 }
  if (d_max2 > d_max) { d_max <- d_max2 }
  
  # Make a histogram with normally distribution
  d_bins <- seq(d_min, d_max, d_binsize)
  
  # freq=FALSE ensures the area under the histogram = 1
  hist(dataframe, freq=FALSE, breaks=d_bins, xlab="Data", main="Distribution")
  d_hist <- hist(d_norm, plot=FALSE)
  points(d_hist$mids, d_hist$density, type="l", col="blue")
}

hour_norm <- function(dataframe) {
  time<-c(dataframe$Time[1:24])
  means<-c(1:24)
  layout(matrix(1:24, ncol = 6))
  for (x in 1:24) {
    data_h<- dataframe[which(data_1$Time== time[x]),]
    m<-mean(data_h$Vehicles)
    means[x] = means[x] - x + m
    normal_distribution(data_h$Vehicles)
  }
  return(means)
}

traffic_forecast = function(dataframe,n) {
  traffic_data <- ts(dataframe$Vehicles)
  library(forecast)
  arfimaFit <- arfima(traffic_data)
  plot(forecast(arfimaFit, h=n))
  print(accuracy(forecast( arfimaFit, h=n)))
  return(forecast( arfimaFit, h=n))
}
