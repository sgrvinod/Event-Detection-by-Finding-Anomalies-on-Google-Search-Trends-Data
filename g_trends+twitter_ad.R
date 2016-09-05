setwd('C:/Blog/Gtrends')

#Get the gtrendsR and AnomalyDetection packages from github
if (!require("devtools")) install.packages("devtools")
devtools::install_github("PMassicotte/gtrendsR")
devtools::install_github("twitter/AnomalyDetection")

#Load it
library(gtrendsR)
library(AnomalyDetection)

#Get geographical codes for reference
data("countries")
data(list=countries)

#Connect your google account
gconnect(usr='sgrvinod@gmail.com', psw='________', verbose=T)

#Examples
flight_delays<-gtrends(query=c("flight delay"),
                       geo=c("US-NY"),
                       start_date='2013-02-14',
                       end_date='2014-02-14')
plot(flight_delays)
earthquake<-gtrends(query=c("earthquake"),
                    geo='NP',
                    start_date='2014-07-14',
                    end_date='2015-07-14')
plot(earthquake)
terrorism<-gtrends(query=c("terrorist attacks"),
                    geo='IN',
                    start_date='2007-12-05',
                    end_date='2008-12-05')
plot(terrorism)

#Get dataframe of trends
trends<-terrorism$trend
trends<-trends[,c(1,4)]
trends$start<-as.POSIXct(as.Date(trends$start), format="%Y-%m-%d %H:%M:%S")

#Find anomalies
anoms=AnomalyDetectionTs(trends, max_anoms=0.1, direction='pos', plot=TRUE)
#Plot anomalies detected
anoms$plot
#Dataframe of anomalies detected
anoms$anoms
