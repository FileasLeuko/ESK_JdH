####################################
### ESK panel multivariat
### first data delivery 
####################################

#############
# stand: 14.12.2015


rm(list=ls())
setwd("C:/Users/filip/Dropbox/arbeit/co2online/Analysis/R")
source("commonRfiles/R_pkgs_essence.R")
getwd()


#ESK_dateDownloaded <- date()
ESK_dateDownloaded <- "Mon Dec 14 12:00:39 2015"

ESK_panel <- as.data.table(read.csv("data/esk_daten_20151209.csv",sep=";"))


################################################
## DATE into yearmon class as new variable
ESK_panel$yearmon <- as.yearmon(date)

pdat <- pdata.frame(ESK_panel, index = c("householdId", "yearmon"))


##############
## make dataset available
save.image(file = "data/20151214_ESK_panel.RData")



################################################
## overview 

names(ESK_panel)
str(ESK_panel)
attach(ESK_panel)


################################################
## general analysis 


table(buildingType)

################################################
## make panel structure


#help("plm")

head(x)

str(pdat)


##################################################
## plm estimation

names(pdat)
pdat.test <- pdat[1:20000,]
plm.1 <- plm(consumtionExstimation ~ modernizationRoof + modernizationFront, 
             effect = c("twoways"), 
             data = pdat.test)


