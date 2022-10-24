# Arima-Non-Musiman

Metode Autoregressive Integrated Moving Average (ARIMA) yang biasa disebut dengan metode Box-Jenkins merupakan metode yang dikembangkan oleh George Box dan Gwilym Jenkins pada tahun 1970. ARIMA adalah model Autoregressive Moving Average (ARMA) yang tidak stasioner. Penggunaan metode ARIMA dalam peramalan jangka pendek sangat tepat dan akurat. Sedangkan untuk peramalan jangka panjang ketepatan peramalannya kurang baik. Biasanya nilai peramalan akan cenderung konstan untuk periode yang cukup panjang.

Berikut ini adalah data deret waktu tentang besarnya “penjualan dari suatu produk tertentu” yang diamati setiap minggu selama 90 minggu pengamatan (data dibaca dari kiri ke kanan)

![image](https://user-images.githubusercontent.com/116244436/197442751-60cb660a-c2f2-418b-a8c1-e9513e6d00e3.png)

a. Dengan menggunakan program R tentukan model ARIMA terbaik untuk data tersebut! Lampirkan hasil komputer yang diperoleh untuk kesesuaian modelnya! 

b. Berdasarkan hasil tersebut, tuliskan secara lengkap model ARIMA Box-Jenkins untuk data penjualan tersebut! 

c. Ujilah apakah taksiran parameter model yang diperoleh tersebut signifikan berbeda dari nol dengan tingkat keyakinan 95%! Apa kesimpulan anda? 

d. Lakukan pemeriksaan diagnostik (diagnostic checking) untuk menguji apakah sisa sudah memenuhi syarat cukup (residual white noise)! Jelaskan kesimpulan anda! 

e. Carilah nilai sisa untuk data pada t = 3 atau ( Z3 –  Z ̂3)! 

f. Carilah nilai ramalan untuk Z ̂91(90), Z ̂92(90) dan Z ̂93 (90), yaitu nilai ramalan untuk Z91, Z92, dan Z93 yang dibuat berdasarkan pengamatan pada waktu t = 90!

#Input Data 

1.	Langkah awal adalah input data di R dengan data terurut sesuai waktu dan memanjang ke bawah.

![image](https://user-images.githubusercontent.com/116244436/197442958-c557b43a-8c23-4bd5-95ad-949fc27623e4.png)

2.  Memeriksa apakah data sudah terbaca di R dengan menuliskan script “data”, lalu run. Untuk melihat sebagian data awal dapat digunakan perintah “head(data) sebagai berikut:

![image](https://user-images.githubusercontent.com/116244436/197443115-5f098107-5858-4438-a08c-07c291a1208b.png)

#Tahap Identifikasi

Langkah pertama yang dilakukan dalam pemodelan deret waktu adalah tahap identifikasi. Pada tahap identifikasi ini, hal yang dilakukan adalah memeriksa kestasioneran data baik dalam mean maupun dalam variansi. Kestasioneran data dalam rata-rata dapat diperiksa melalui plot time series secara visual atau melalui uji Augmented Dickey-Fuller. Karena data terdiri dari dua variable yaitu t sebagai variable waktu dan Zt sebagai data deret waktu penjualan, maka untuk kemudahan, Anda dapat melabel data$Zt dengan nama penjualan:

![image](https://user-images.githubusercontent.com/116244436/197443228-c2050ff2-3a13-4e16-8e92-d49c89f19ef5.png)

1.	Pengujian kestasioneran data melalui “Augmented Dickey-Fuller Test” dengan perintah:

![image](https://user-images.githubusercontent.com/116244436/197443297-89349549-4f44-4dec-930c-349824acdb77.png)

Dari hasil pengujian “Augmented Dickey-Fuller Test” diperoleh nilai p-value = 0,9627 yang berari bahwa dipotesis H0 gagal ditolak, alternative hypothesis: stasionary ditolak. Ini berarti bahwa data tersebut belum stasioner dalam rata-rata.

2.  Differencing

![image](https://user-images.githubusercontent.com/116244436/197443381-238416e1-423e-47d1-9f8d-28b7d3b5e701.png)

3.	Plot timeseries hasil differencing

![image](https://user-images.githubusercontent.com/116244436/197443438-d07d5fd9-7000-4774-a5bb-19877e3d7331.png)

Berdasarkan plot timeseries hasil differencing dapat disimpulkan bahwa data masih belum stasioner dalam rata-rata, sehingga perlu dilakukan proses differencing lagi.

![image](https://user-images.githubusercontent.com/116244436/197443482-40cea678-20f4-4a72-977d-d221bb0735b2.png)

Dari hasil pengujian “Augmented Dickey-Fuller Test” diperoleh nilai p-value = 0,06285 yang berari bahwa hipotesis H0 gagal ditolak. Ini berarti bahwa data tersebut belum stasioner dalam  rata-rata. Oleh karena itu, dapat dilakukan differencing lagi dengan melakukan differncing 1 dari hasil differencing sebagai berikut:

![image](https://user-images.githubusercontent.com/116244436/197443528-86423f36-cbb2-43a7-b365-f65a75867776.png)

4.	Plot timeseries hasil differencing 2

![image](https://user-images.githubusercontent.com/116244436/197443571-bf7fe064-718d-49a9-9a64-44a517a3fd4b.png)

5.	Pengujian ADT 

![image](https://user-images.githubusercontent.com/116244436/197443618-073def9e-5914-42cd-9242-51b1e975a456.png)

Dari hasil pengujian “Augmented Dickey-Fuller Test” diperoleh nilai p-value = 0,01 yang berari bahwa hipotesis H0 ditolak. Ini berarti bahwa data tersebut sudah stasioner dalam rata-rata.

6.	Plot ACF dan PACF hasil differencing 2

![image](https://user-images.githubusercontent.com/116244436/197443708-ac8923d4-707f-4d3d-9aef-44361749f487.png)

Berdasarkan plot ACF dan plot PACF tersebut, dapat dilihat bahwa plot ACF nya terpotong setelah lag 2 (cut off after lag 2), dan plot PACF nya turun secara eksponensial (dies down). Berdasarkan teori yang telah dibahas, model dugaan sementara untuk data tersebut adalah ARIMA (0, 2, 2).

7.  Memodelkan data dengan menggunakan ARIMA (0,2,2) melalui perintah sebagai berikut:

![image](https://user-images.githubusercontent.com/116244436/197443813-9598f82f-c1dc-47f8-85b0-63a6c8f89953.png)

8.  Melakukan diagnostic checking yaitu uji kesignifikanan parameter sebagai berikut:

![image](https://user-images.githubusercontent.com/116244436/197443888-8fac5bca-c2ef-4443-965b-69242f6d2932.png)

Berdasarkan hasil R, taksiran parameter model MA(1) dan MA(2) adalah signifikan berbeda dari nol. Hal ini dapat dilihat pada nilai Pr (>|z|) =0.007253 <  = 0,05, dan Pr (>|z|) =2.8e-06 <  = 0,05.

9.  Pengujian residual White noise melalui L-jung Box test

![image](https://user-images.githubusercontent.com/116244436/197444002-f458f4fd-a763-4247-a841-b1d04585ea1e.png)

10.	Pengujian residual berdistribusi normal
Pengujian apakah residual berdistribusi normal atau tidak dapat dilakukan melalui beberapa cara yaitu: uji Shapiro-Wilk, uji Shapiro-Francia, uji Anderson-Darling, atau uji Lilliefors (Kolmogorov-Smirnov). Program R dan hasilnya diberikan sebagai berikut:

![image](https://user-images.githubusercontent.com/116244436/197444108-2b377eca-870e-4bdc-8482-54265e8bb54c.png)

Berdasarkan hasil output pengujian normalitas diperoleh nilai p-value >  = 0,05 yang berarti bahwa gagal tolak H0. Jadi dapat disimpulkan bahwa residual memenuhi asumsi distribusi normal.

11.	Forecasting untuk 12 tahap ke depan

![image](https://user-images.githubusercontent.com/116244436/197444206-c479d3de-838b-4c42-bce4-caaa550dec01.png)

Jadi hasil ramalan untuk  Z ̂91(90) adalah 1038.305 , Z ̂92(90) adalah 1045.160  dan Z ̂93 (90) adalah 1052.015.

a. Dengan menggunakan program R tentukan model ARIMA terbaik untuk data tersebut! Lampirkan hasil komputer yang diperoleh untuk kesesuaian modelnya! 

Dari hasil diatas didapatkan bahwa model ARIMA terbaik adalah ARIMA (0,2,2)

b. Berdasarkan hasil tersebut, tuliskan secara lengkap model ARIMA Box-Jenkins untuk data penjualan tersebut! 

![image](https://user-images.githubusercontent.com/116244436/197444281-f17dfeff-5476-4de6-a292-a2a160ce900d.png)

Dari hasil diatas, kita mendapatkan ma1 = -0.2801 dan ma2 = -0.5001. sehingga modelnya:

Zt = at – (-0.2801)at-1 - (-0.5001)at-2 

Dengan model differencing yaitu:

(1-B2)Zt =  (-0.2801B) + (-0.5001B2)at

c. Ujilah apakah taksiran parameter model yang diperoleh tersebut signifikan berbeda dari nol dengan tingkat keyakinan 95%! Apa kesimpulan anda? 

Taksiran parameter model MA(2) tersebut signifikan berbeda dari nol dengan tingkat 95%. Hal ini dapat dilihat pada nilai z hitung atau nilai-p. Untuk parameter MA(1) yaitu, nilai z = -2.6850 dengan nilai Pr (>|z|) =0.007253, parameter MA(2) yaitu nilai z = -4.6786 dengan nilai Pr (>|z|) =2.8e-06.  Hal ini dapat dilihat pada nilai Pr (>|z|) =0.007253 <  = 0,05, dan Pr (>|z|) =2.8e-06 <  = 0,05.

d. Lakukan pemeriksaan diagnostik (diagnostic checking) untuk menguji apakah sisa sudah memenuhi syarat cukup (residual white noise)! Jelaskan kesimpulan anda! 

Sisa sudah memenuhi syarat cukup (residual white noise). Hail ini dapat dilihat dari hasil output pengujian residual Ljung Box diperoleh p-value = 0,3926 >  = 0,05 yang berarti bahwa gagal tolak H0. Jadi dapat disimpulkan bahwa residual white noise.

e. Carilah nilai sisa untuk data pada t = 3 atau ( Z3 –  Z ̂3)! 

Nilai sisa untuk data pada t = 3 atau ( Z3 –  Z ̂3) yaitu:
MSE = 1/N ∑_(t=3)^N▒a ̂^2 t
Dengan a ̂^2t = taksiran sisa pada permalan  
a ̂^2 = ( Z3 –  Z ̂3) (3)
N = Banyaknya sisa (12)
Jadi 
MSE = 1/12 .3
MSE = 0.25 

f. Carilah nilai ramalan untuk Z ̂91(90), Z ̂92(90) dan Z ̂93 (90), yaitu nilai ramalan untuk Z91, Z92, dan Z93 yang dibuat berdasarkan pengamatan pada waktu t = 90!

Forecasting untuk 12 tahap ke depan

![image](https://user-images.githubusercontent.com/116244436/197444445-3a75421d-97f4-485c-af06-bb4609c4f851.png)

Jadi hasil ramalan untuk  Z ̂91(90) adalah 1038.305 , Z ̂92(90) adalah 1045.160  dan Z ̂93 (90) adalah 1052.015.
