#Testing model performance

library(tidyverse)
library(lme4)

setwd("~/Box Sync/R Codes/MovieShiny")
original.data <- read.csv("TMDb.6000.csv")

moneymodel <- 
  lmer(sqrt(revenue) ~ 1 + Action + Adventure + Animation + Comedy + Drama +
         Family + Fantasy + History + Horror + Music + Mystery + Romance +
         Thriller + War + Western + Science.Fiction +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = original.data)

ratingsmodel <-
  lmer(vote_average ~ 1 + Action + Adventure + Animation + Comedy + Drama +
         Family + Fantasy + History + Horror + Music + Mystery + Romance +
         Thriller + War + Western + Science.Fiction +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = original.data, na.action = na.omit)


