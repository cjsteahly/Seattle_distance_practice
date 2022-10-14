library(tidyverse)
library(ggplot2)
library(ggmap)
#https://rspatial.org/raster/analysis/analysis.pdf

SamCrib <- c(47.617323270640355, -122.32529240665617)
GreekFst <- c(47.638647425823606, -122.30780606156642)
MeatChz <- c(47.62398158682912, -122.35028800008922)
Coffee <- c(47.61552411453005, -122.3206700623544)
Lanterns <- c(47.6820177655147, -122.34034839593374)
ArtMus <- c(47.60777527876259, -122.33902631506427)
LSD<- c(47.613521418977165, -122.33151810301626)
BeerYoga <- c(47.66455131502704, -122.36757984059503)

seattle <- rbind(SamCrib, GreekFst,MeatChz, Coffee, Lanterns, ArtMus, LSD, BeerYoga)
seattle

dis <- dist(seattle)
dis

stdf <- as.data.frame(seattle)
colnames(stdf) <- c("lat","lon")
view(stdf)

D <- as.matrix(dis)
OCT7<-round(D)

OCT7df <- as.data.frame(OCT7)
OCT7df[1]

library(raster)
gdis <- pointDistance(seattle, lonlat=TRUE)
view(gdis)

###########
library(sp)
library(leaflet)


coordinates(stdf) <- ~lon+lat
leaflet(stdf) %>% addMarkers() %>% addTiles()