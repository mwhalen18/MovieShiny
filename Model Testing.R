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

#create a loop that takes each movie, takes its data, plugs it into the model to get predictions, then takes the prediction and makes a new data file
#Will be a very long loop

newdata <- (data.frame
            (Director = as.factor(Director),
             actor.1 = as.factor(actor.1),
             actor.2 = as.factor(actor.2),
             actor.3 = as.factor(actor.3),
             Action = as.factor(ifelse(genre.1 == "Action", 1,
                                       ifelse(genre.2 == "Action", 1,
                                              ifelse(genre.3 == "Action", 1, 0)))),
             Adventure = as.factor(ifelse(genre.1 == "Adventure", 1,
                                          ifelse(genre.2 == "Adventure", 1,
                                                 ifelse(genre.3 == "Adventure", 1, 0)))),
             Animation = as.factor(ifelse(genre.1 == "Animation", 1,
                                          ifelse(genre.2 == "Animation", 1,
                                                 ifelse(genre.3 == "Animation", 1, 0)))),
             Comedy = as.factor(ifelse(genre.1 == "Comedy", 1,
                                       ifelse(genre.2 == "Comedy", 1,
                                              ifelse(genre.3 == "Comedy", 1, 0)))),
             Crime = as.factor(ifelse(genre.1 == "Crime", 1,
                                      ifelse(genre.2 == "Crime", 1,
                                             ifelse(genre.3 == "Crime", 1, 0)))),
             Drama = as.factor(ifelse(genre.1 == "Drama", 1,
                                      ifelse(genre.2 == "Drama", 1,
                                             ifelse(genre.3 == "Drama", 1, 0)))),
             Family = as.factor(ifelse(genre.1 == "Family", 1,
                                       ifelse(genre.2 == "Family", 1,
                                              ifelse(genre.3 == "Family", 1, 0)))),
             Fantasy = as.factor(ifelse(genre.1 == "Fantasy", 1,
                                        ifelse(genre.2 == "Fantasy", 1,
                                               ifelse(genre.3 == "Fantasy", 1, 0)))),
             History = as.factor(ifelse(genre.1 == "History", 1,
                                        ifelse(genre.2 == "History", 1,
                                               ifelse(genre.3 == "History", 1, 0)))),
             Horror = as.factor(ifelse(genre.1 == "Horror", 1,
                                       ifelse(genre.2 == "Horror", 1,
                                              ifelse(genre.3 == "Horror", 1, 0)))),
             Music = as.factor(ifelse(genre.1 == "Music", 1,
                                      ifelse(genre.2 == "Music", 1,
                                             ifelse(genre.3 == "Music", 1, 0)))),
             Mystery = as.factor(ifelse(genre.1 == "Mystery", 1,
                                        ifelse(genre.2 == "Mystery", 1,
                                               ifelse(genre.3 == "Mystery", 1, 0)))),
             Romance = as.factor(ifelse(genre.1 == "Romance", 1,
                                        ifelse(genre.2 == "Romance", 1,
                                               ifelse(genre.3 == "Romance", 1, 0)))),
             Science.Fiction = as.factor(ifelse(genre.1 == "Science Fiction", 1,
                                                ifelse(genre.2 == "Science Fiction", 1,
                                                       ifelse(genre.3 == "Science Fiction", 1, 0)))),
             Thriller = as.factor(ifelse(genre.1 == "Thriller", 1,
                                         ifelse(genre.2 == "Thriller", 1,
                                                ifelse(genre.3 == "Thriller", 1, 0)))),
             War = as.factor(ifelse(genre.1 == "War", 1,
                                    ifelse(genre.2 == "War", 1,
                                           ifelse(genre.3 == "War", 1, 0)))),
             Western = as.factor(ifelse(genre.1 == "Western", 1,
                                        ifelse(genre.2 == "Western", 1,
                                               ifelse(genre.3 == "Western", 1, 0))))
              )
            )



