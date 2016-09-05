# Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data

Detect newsworthy events by performing time-series anomaly detection on Google Search volumes for specific queries, as an alternative to mining news articles (with topic modeling, or similar). 

This is much easier because it doesn't involve text, is highly customizeable by query, geographical location, and time period. (News APIs usually don't accept parameters for specific time periods.) 

For accessing Google Search Trends data, I used the gtrendsR wrapper in R. Since this is univariate time series data, I chose Twitter's Seasonal Hybrid Extreme Studentized Deviates (S-H-ESD), which is based on the well-established Generalized ESD.

(Generalized ESD essentially uses deviation from the mean as the metric to find anomalies. The number of anomalies is decided by comparing the top k deviations from the mean (divided by standard deviations) to a critical value computed using the t-distributions. The problem with seasonal/time series data is it’s not normally distributed. So, S-H-ESD is essentially ESD performed on the data after seasonality is removed to make it approximately normally distributed and the median is subtracted to make it 0 centered.)

**Modeled in R**

###Examples:

####The polar vortex storm in the northeast United States in Dec 2013/Jan 2014 that grounded flights.

Google Search Volumes for 'flight delay':

![Flight Delays Trends](https://github.com/sgrvinod/Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data/blob/master/examples/flightdelaytrends.png?raw=true)

Anomalies:

![Flight Delays Anomalies](https://github.com/sgrvinod/Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data/blob/master/examples/flightdelayanomalies.png?raw=true)

####The earthquake in Nepal in April 2015.

Google Search Volumes for 'earthquake':

![Nepal Earthquake Trends](https://github.com/sgrvinod/Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data/blob/master/examples/nepalearthquaketrends.png?raw=true)

Anomalies:

![Nepal Earthquake Anomalies](https://github.com/sgrvinod/Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data/blob/master/examples/nepalearthquakeanomalies.png?raw=true)

####The 2008 terrorist attacks in Mumbai, India.

Google Search Volumes for 'terrorist attack':

![India 26/11 Trends](https://github.com/sgrvinod/Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data/blob/master/examples/india2611trends.png?raw=true)

Anomalies:

![India 26/11 Anomalies](https://github.com/sgrvinod/Event-Detection-by-Finding-Anomalies-on-Google-Search-Trends-Data/blob/master/examples/india2611anomalies.png?raw=true)




