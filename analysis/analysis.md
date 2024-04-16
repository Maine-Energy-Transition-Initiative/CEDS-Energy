Analysis
================

``` r
library(tidyverse)
library(broom)
library(readxl)
#install.packages("rwunderground")
library(rwunderground)
```

## 1. Introduction

## 2. Data

Data presentation.

``` r
table_heating_oil_case_study <- read_excel("../data/table_heating_oil_case_study.xlsx")
```

    ## New names:
    ## • `` -> `...8`
    ## • `` -> `...9`
    ## • `` -> `...10`

``` r
table_electricity_case_study <- read_excel("../data/table_electricity_case_study.xlsx")

table_weather_2023_BHB <-
  read_excel("/cloud/project/data/BHBairport_2023.xlsx")
```

``` r
Carriage_heating_oil <- table_heating_oil_case_study |>
  filter(Building == "Carriage") |>
  mutate()

Carriage_electricity <- table_electricity_case_study |>
  filter(Building == "Carriage  House") |>
  mutate()
```

``` r
  ggplot() +
  geom_line(Carriage_heating_oil, mapping = aes(x = `Delivery Date`, y = Gallons), color = "blue") + 
  geom_line(Carriage_electricity, mapping = aes(x = Month, y = KWH), color = "red") +
  scale_y_continuous(
    name = "Gallons",
    sec.axis = sec_axis(trans = ~.*1, name="kWh"))+
  geom_vline(xintercept=as.POSIXct(as.Date("2021-08-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2021-06-01")), y=600, label="David started as the Director of Energy", angle=90) +
  geom_vline(xintercept=as.POSIXct(as.Date("2019-09-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2019-07-01")), y=400, label="Electricity Data collection sarted", angle=90)+
  theme(axis.title.y.left = element_text(colour = "blue"),axis.title.y.right = element_text(colour = "red" ))+
  labs(title = "Carriage's house energy history", subtitle = "Gallons of heating oil and kWh of electricity")

ggsave(filename = "Carriage's house energy history.png", device = "png", width = 7, height = 7)
```

``` r
Cottage_heating_oil <- table_heating_oil_case_study |>
  filter(Building == "Cottage") |>
  mutate()

Cottage_electricity <- table_electricity_case_study |>
  filter(Building == "Cotttage House") |>
  mutate()
```

``` r
  ggplot() +
  geom_line(Cottage_heating_oil, mapping = aes(x = `Delivery Date`, y = Gallons), color = "blue") + 
  geom_line(Cottage_electricity, mapping = aes(x = Month, y = KWH), color = "red") +
  scale_y_continuous(
    name = "Gallons",
    sec.axis = sec_axis(trans = ~.*1, name="kWh"))+
  geom_vline(xintercept=as.POSIXct(as.Date("2021-08-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2021-06-01")), y=1500, label="David started as the Director of Energy", angle=90) +
  geom_vline(xintercept=as.POSIXct(as.Date("2019-09-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2019-07-01")), y=1200, label="Electricity Data collection sarted", angle=90)+
  theme(axis.title.y.left = element_text(colour = "blue"),axis.title.y.right = element_text(colour = "red" ))+
  labs(title = "Cottage's house energy history", subtitle = "Gallons of heating oil and kWh of electricity")
```

    ## Warning: The `trans` argument of `sec_axis()` is deprecated as of ggplot2 3.5.0.
    ## ℹ Please use the `transform` argument instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

![](analysis_files/figure-gfm/Dual%20Plot%20for%20Cottage-1.png)<!-- -->

``` r
#ggsave(filename = "Cottage's house energy history.png", device = "png", width = 7, height = 7)
```

``` r
Witchcliff_apt_heating_oil <- table_heating_oil_case_study |>
  filter(Building == "Witchcliff Apartments") |>
  mutate()

Witchcliff_apt_electricity <- table_electricity_case_study |>
  filter(Building == "Witchcliff Appartments") |>
  mutate()
```

``` r
  ggplot() +
  geom_line(Witchcliff_apt_heating_oil, mapping = aes(x = `Delivery Date`, y = Gallons), color = "blue") + 
  geom_line(Witchcliff_apt_electricity, mapping = aes(x = Month, y = KWH), color = "red") +
  scale_y_continuous(
    name = "Gallons",
    sec.axis = sec_axis(trans = ~.*1, name="kWh"))+
  geom_vline(xintercept=as.POSIXct(as.Date("2021-08-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2021-06-01")), y=600, label="David started as the Director of Energy", angle=90) +
  geom_vline(xintercept=as.POSIXct(as.Date("2019-07-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2019-05-01")), y=500, label="Electricity Data collection sarted", angle=90)+
  theme(axis.title.y.left = element_text(colour = "blue"),axis.title.y.right = element_text(colour = "red" ))+
  labs(title = "Witchcliff Appartments energy history", subtitle = "Gallons of heating oil and kWh of electricity")
```

![](analysis_files/figure-gfm/Dual%20Plot%20for%20Witchcliff%20Appartments-1.png)<!-- -->

``` r
#ggsave(filename = "Witchcliff Appartments energy history.png", device = "png", width = 7, height = 7)
```

``` r
Carters_house_heating_oil <- table_heating_oil_case_study |>
  filter(Building == "BHF Farm House") |>
  mutate()

Carters_house_electricity <- table_electricity_case_study |>
  filter(Building == "BHF Carter House") |>
  mutate()
```

``` r
  ggplot() +
  geom_line(Carters_house_heating_oil, mapping = aes(x = `Delivery Date`, y = Gallons), color = "blue") + 
  geom_line(Carters_house_electricity, mapping = aes(x = Month, y = KWH), color = "red") +
  scale_y_continuous(
    name = "Gallons",
    sec.axis = sec_axis(trans = ~.*1, name="kWh"))+
  geom_vline(xintercept=as.POSIXct(as.Date("2021-08-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2021-06-01")), y=900, label="David started as the Director of Energy", angle=90) +
  geom_vline(xintercept=as.POSIXct(as.Date("2019-07-01")),
                linetype=3, colour="black") +
   annotate("text", x=as.POSIXct(as.Date("2019-05-01")), y=500, label="Electricity Data collection sarted", angle=90)+
  theme(axis.title.y.left = element_text(colour = "blue"),axis.title.y.right = element_text(colour = "red" ))+
  labs(title = "Carter's house energy history", subtitle = "Gallons of heating oil and kWh of electricity")
```

![](analysis_files/figure-gfm/Dual%20Plot%20for%20Carters%20house-1.png)<!-- -->

``` r
#ggsave(filename = "Carter's house energy history.png", device = "png", width = 7, height = 7)
```

``` r
table_weather_2023_BHB <- table_weather_2023_BHB |>
  mutate(Heating_Degree_Day = case_when(`Avg Temperature (°C)` <= 18 ~ TRUE, `Avg Temperature (°C)` > 18 ~ FALSE))
```

``` r
ggplot() +
  geom_line(table_weather_2023_BHB, mapping = aes(x = `Date`, y = `Avg Temperature (°C)`))
```

![](analysis_files/figure-gfm/BHB%20Temperature%202023-1.png)<!-- -->

``` r
Humidity_ambient |>
  ggplot()+
  geom_line(aes(x = time, y = value))
```

``` r
Temperature_ambient |>
  ggplot()+
  geom_line(aes(x = time, y = value))
```

``` r
vocIndex |>
  ggplot()+
  geom_line(aes(x = time, y = value))
```

``` r
massConcentrationPm2p5 |>
  ggplot()+
  geom_line(aes(x = time, y = value))
```

``` r
url <- 'https://www.wunderground.com/dashboard/pws/KMECRANB5/table/2023-01-29/2023-01-29/monthly'
weather <- read_html(url) |>
  html_nodes("div.tabel-wrapper.ng-star-inserted")|>
  html_table()
```

``` r
history(set_location(zip_code = 04609), date = 20240321) #testided with multiplelocation calls (stationID, Town Name etc.)
```

``` r
#Found in Stackoverflow but cant figure the (i) part. https://stackoverflow.com/questions/58342525/how-to-extract-data-from-weather-underground-wunderground-into-csv-files

start_date <- as.POSIXct("2019-09-01",tz="est")
end_date <-  as.POSIXct(Sys.Date(),tz="est")

dates <- seq.POSIXt(start_date,end_date,by="day")

my_dates<-as.integer(unlist(strsplit(as.character(dates),"-")))

my_dates<-array(my_dates,dim=c(3,length(my_dates)/3))

my_dates<-as.data.frame(t(my_dates), )

colnames(my_dates)<-c("year","month","day")

station <- "KMECRANB5"

myurl <- vector()
myfile <- vector()

for(i in 1:nrow(my_dates)) {
  i = 1
  myurl[i] <- paste("https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=",station,"&day=",my_dates$day[i],"&month=",my_dates$month[i],"&year=",my_dates$year[i],"&graphspan=day&format=1", sep = "") #I think the website changed so there is no URL that has just history it's now incorporated in dashboard. Can't see history table only by individual day,week, month.
  folder <- "data"
  myfile[i] <- paste("CranberryWeather",i,".csv", sep = "")
  download.file(url = myurl[i], file.path(folder, myfile[i], fsep = "\\" ))
}
```

``` r
# Cranberry2023 <- read_excel("../data/KMECRANB5-2023-Weather.xlsx")

Cranberry2023Clean <- Cranberry2023 %>%
  mutate(High_Temp = as.numeric(gsub(" °F", "", High_Temp))) %>%
  mutate(Avg_Temp = as.numeric(gsub(" °F", "", Avg_Temp))) %>%
  mutate(Low_Temp = as.numeric(gsub(" °F", "", Low_Temp))) %>%
  mutate(High_DP = as.numeric(gsub(" °F", "", High_DP))) %>%
  mutate(Avg_DP = as.numeric(gsub(" °F", "", Avg_DP))) %>%
  mutate(Low_DP = as.numeric(gsub(" °F", "", Low_DP))) %>%
  mutate(High_Humid = as.numeric(gsub(" %", "", High_Humid))) %>%
  mutate(Avg_Humid = as.numeric(gsub(" %", "", Avg_Humid))) %>%
  mutate(Low_Humid = as.numeric(gsub(" %", "", Low_Humid))) %>%
  mutate(High_Speed = as.numeric(gsub(" mph", "", High_Speed))) %>%
  mutate(Avg_Speed = as.numeric(gsub(" mph", "", Avg_Speed))) %>%
  mutate(Low_Speed = as.numeric(gsub(" mph", "", Low_Speed))) %>%
  mutate(High_Pressure = as.numeric(gsub(" in", "", High_Pressure))) %>%
  mutate(Low_Pressure = as.numeric(gsub(" in", "", Low_Pressure))) %>%
  mutate(Precip_Accum = as.numeric(gsub(" in", "", Precip_Accum))) 
```

## 3. Data analysis plan
