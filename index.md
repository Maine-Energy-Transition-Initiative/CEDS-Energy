---
date: "2022-09-07 T00:00:00Z"
external_link: ""
image:
  caption: 
  focal_point: Smart
links:
- icon: twitter
  icon_pack: fab
  name: Follow
  url: 
slides: 
summary: 
tags:
- Energy Efficiency Monitoring
- Environmental Science
title: Developing a Comprehensive Monitoring Program for Community-wide Energy Efficiency Upgrades
publishDate: "2022-04-25T00:00:00Z"
url_code: ""
url_slides: ""
url_video: ""
---


## Project Background

## Project Outputs

1: Website

This website serves as the project hub for information surrounding the government grant, the community energy center, what the project is trying to accomplish, how it will accomplish it and what that accomplishment looks like. This website is for potential and current participants to get updated, accurate information regaring home energy audits, government rebates and other related information.


3: Arduino Air Quality Dashboard

Some of the homes participating in the project will have wifi enabled Arduino air quality monitors installed in them, so one of the goals of this project was to develop a way to analyze the data from the monitors to assess the impacts of energy upgrades. The monitors output a readout every 20 minutes that includes temperature, relative humidity, PM10 and PM2.5 concentrations, nitrogen oxide index, and volatile organic compound index.

<figure>
    <img src="/img/monitor_schema.png"
         alt="Simple diagram of Arduino monitor">
    <figcaption>Schematic of Arduino monitor.</figcaption>
</figure>

Using a third party R package called rduinoiot, developed by Flavio Leccese, we were able to link the Arduino API to R in order to pull the data into a dataframe. Using this, we will develop an RShiny web app dashboard to easily navigate and summarize the data. In the future, we would like to implement a database in order to analyze the data over longer timescales and improve app response speed, and potentially implement the ability for the owners of homes with monitors installed to log in and view the data from their, and only their, monitor.    

<figure>
    <img src="/img/arduino_graph_ex.png"
         alt="Example Arduino monitor graph">
    <figcaption>Figure 3. Example Arduino ouput graph with lines representing safe pollutant levels, currently at placeholder values.</figcaption>
</figure>

## Team

Mabon Young - COA '26

Adler Garner - COA '26

## Data

Access the project on [github](https://github.com/LaurieLBaker/CEDS-Energy).

## Resources

## Acknowledgements

Thanks to: 
David Gibson and Nicole Grohoski, the director of energy and energy project manager at COA
Laurie Baker, CEDS Instructor
Nicolo Mega, Arduino monitor designer and producer
Flavio Leccese, rduinoiot developer