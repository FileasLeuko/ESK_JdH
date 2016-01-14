####################################
### Multivariate Analyse 
### Hemon Friedrich Ebert Straﬂe 161 Bremen
### Wind, Temp, Sonne Einfluss auf Verbrauch
####################################

#############
# stand: 17.12.2015


rm(list=ls())
setwd("C:/Users/filip/Dropbox/arbeit/co2online/Analysis/R")
source("commonRfiles/R_pkgs_essence.R")
getwd()

Hemon <- as.data.table(read.csv2("MFH Hemon Bremen/Erdgas-Meter-Regression.csv",sep=";"))
str(Hemon)

reg1 <- ?lm(data = Hemon, formula = MWh ~ Temp + Sun + Wind + Deklination)

summary.lm(reg1)

anova(reg1)
