library(tseries)
library(forecast)
library(lmtest) 
library(normtest)
library(nortest)
#input data
Zt = c(235.000, 239.000, 244.090, 252.731, 264.377, 277.934,
       286.687, 295.629, 310.444, 325.112, 336.291, 344.459,
       355.399, 367.691, 384.003, 398.042, 412.969, 422.901,
       434.960, 445.853, 455.929, 465.584, 477.894, 491.408,
       507.712, 517.237, 524.349, 532.104, 538.097, 544.948,
       551.925, 557.929, 564.285, 572.164, 582.926, 595.295,
       607.028, 617.541, 622.941, 633.436, 647.371, 658.230,
       670.777, 685.457, 690.992, 693.557, 700.675, 712.710,
       726.513, 736.429, 743.203, 751.227, 764.265, 777.852,
       791.070, 805.844, 815.122, 822.905, 830.663, 839.600,
       846.962, 853.830, 860.840, 871.075, 877.792, 881.143,
       884.226, 890.208, 894.966, 901.288, 913.138, 922.511,
       930.786, 941.306, 950.305, 952.373, 960.042, 968.100,
       972.477, 977.408, 977.602, 979.505, 982.934, 985.833,
       991.350, 996.291, 1003.100, 1010.320, 1018.420, 1029.480)
t = c(1:90)
data = data.frame(t,Zt)
head(data)
tail(data)
Penjualan <- data$Zt 
ts.plot (Penjualan)
adf.test(Penjualan)
differencing <- diff(Penjualan, differences = 1)
differencing
ts.plot(differencing)
adf.test(differencing)
#differencing 2 nonmusiman
differencing2<-diff(differencing, differences = 1)
differencing2
#Plot timeseries hasil differencing 2
ts.plot(differencing2)
#Pengujian ADT differencing 2
adf.test(differencing2)
#Plot ACF dan PACF hasil differencing 2
acf(differencing2)
pacf(differencing2)
#Memodelkan data dengan menggunakan ARIMA (0,2,2)
fit1<-arima(Penjualan, order = c(0,2,2), method = "ML")
fit1
#Melakukan diagnostic checking yaitu uji kesignifikanan parameter 
coeftest(fit1)
#Pengujian residual White noise melalui L-jung Box test
Box.test(fit1$residuals, type = "Ljung")
#Pengujian residual berdistribusi normal
shapiro.test(fit1$residuals)
#Shapiro-Francia normality test
sf.test(fit1$residuals)
#Anderson-Darling normality test
ad.test(fit1$residuals)
#liliefors (Kolmogorov-Smirnov) normality test
lillie.test(fit1$residuals)
#Forecasting untuk 12 tahap ke depan
forecasting<-forecast(Penjualan, model=fit1, h=12)
forecasting
plot(forecasting, main="Plot Hasil Ramalan")