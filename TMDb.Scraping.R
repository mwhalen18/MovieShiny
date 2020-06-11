#Using TMDb database
#Sorry, its not the tidiest script, but it works
library(TMDb)
library(tidyverse)
api.key <- "92c579313c7b587ac61fe782545950ae"
library(parallel)
library(lubridate)
library(lme4)
detectCores()

####################fetching movie data from APIS #########
#this is a clunky way of just generating a ton of movie ids
#They only let you pull 20 at a time so this is just a recursive code
#I had a nice 4 line loop function to do it faster but that kept crashing (too many API requests I guess)
#Best to just keep this section hidden for cleanness. 
#A clean alternative would also jsut be to generate a list of numbers and run those as the IDs
#But I prefer brute force coding...

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 1)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 2)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 3)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 4)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 5)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 6)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 7)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 8)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 9)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 10)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 11)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 12)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 13)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 14)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 15)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 16)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 17)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 18)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 19)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 20)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 21)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 22)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 23)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 24)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 25)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 26)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 27)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 28)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 29)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 30)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 31)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 32)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 33)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 34)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 35)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 36)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 37)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 38)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 39)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 40)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 41)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 42)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 43)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 44)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 45)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 46)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 47)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 48)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 49)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 50)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 51)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 52)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 53)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 54)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 55)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 56)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 57)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 58)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 59)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 60)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 61)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 62)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 63)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 64)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 65)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 66)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 67)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 68)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 69)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 70)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 71)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 72)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 73)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 74)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 75)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 76)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 77)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 78)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 79)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 80)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 81)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 82)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 83)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 84)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 85)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 86)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 87)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 88)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 89)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 90)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 91)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 92)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 93)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 94)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 95)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 96)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 97)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 98)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 99)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 100)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 101)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 102)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 103)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 104)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 105)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 106)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 107)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 108)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 109)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 110)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 111)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 112)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 113)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 114)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 115)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 116)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 117)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 118)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 119)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 120)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 121)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 122)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 123)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 124)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 125)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 126)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 127)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 128)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 129)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 130)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 131)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 132)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 133)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 134)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 135)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 136)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 137)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 138)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 139)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 140)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 141)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 142)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 143)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 144)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 145)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 146)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)


#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 147)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 148)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 149)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 150)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 151)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 152)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 153)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 154)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 155)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 156)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 157)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 158)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 159)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 160)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 161)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 162)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 163)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 164)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 165)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 166)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 167)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 168)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 169)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 170)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 171)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 172)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 173)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 174)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 175)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 176)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 177)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 200)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 178)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 179)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 180)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 181)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 182)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 183)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 184)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 185)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 186)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 187)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 188)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 189)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 190)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 191)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 192)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 193)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 194)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 195)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 196)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 197)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 198)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 199)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 201)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 202)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 203)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 204)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 205)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 206)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 207)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 208)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 209)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 210)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 211)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 212)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 213)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 214)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 215)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 216)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 217)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 218)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 219)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 220)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 221)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 222)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 223)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 224)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 225)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 226)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 227)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 228)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 229)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 230)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 231)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 232)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 233)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 234)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 235)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 236)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 237)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 238)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 239)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 240)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 241)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 242)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 243)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 244)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 245)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 246)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)


#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 247)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 248)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 249)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 250)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 251)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 252)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 253)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 254)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 255)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 256)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 257)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 258)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 259)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 260)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 261)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 262)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 263)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 264)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 265)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 266)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 267)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 268)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 269)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 270)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 271)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 272)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 273)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 274)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 275)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 276)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 277)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 300)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 278)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 279)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 280)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 281)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 282)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 283)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 284)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 285)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 286)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 287)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 288)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 289)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 290)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 291)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 292)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 293)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 294)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 295)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 296)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 297)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)

#get movie ids
test1 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 298)
view1 <- test1$results
#
test2 <- discover_movie(api_key, language = "en", sort_by = "vote_count.desc", page = 299)
view2 <- test2$results
#
row2 <- bind_rows(view1, view2, row2)
rm(test1,test2, view1, view2)



#########################
setwd("~/Box Sync/Data Sets")
id.data <- read.csv("movie.id.data.csv") %>% select(-X) #this pulls in all those IDs we just generated
id.small <- id.data #keeping the name id.small from when this was still in the testing stage

n <- length(id.small$id)
flw <- list() #empty list frame to store the data frames we are about to generate
for(i in 1:n) {
  tryCatch({
    print(i)
    flw[[i]] <- movie(api.key, id = id.small$id[i], append_to_response = "credits") %>% #this calls the API for each ID in the dataset
      unlist(recursive = FALSE) #appending credits appends two data frames to our master list
    #in a perfect world we would keep all the info in these frames
    #but each movie has data frames of varying lengths which makes extracting all of the information very difficult unless you wanted to do it one-by-one
    flw[[i]]$credits.cast <- flw[[i]]$credits.cast %>% 
      select(name) %>% #here we are going into the cast dataframe and just pulling out all of the names of the actors in each movie
      mutate(name = as.character(name))
    flw[[i]]$credits.crew <- flw[[i]]$credits.crew %>% select(job,name) %>% #now we are going into the crew dataframe (this one is more complex)
      filter(job %in% c("Director", "Editor", "Screenplay", "Original Music Composer", "Novel", "Director of Photography")) %>% #just select the cool jobs
      tibble::rowid_to_column() %>% spread(job, name) %>% #just collect each job title and those associated with that title
      fill(names(.), .direction = c("updown")) %>% select(-rowid) %>% top_n(1, wt = "Director") %>% unique() #for some jobs there are multiple people, obviously. I am just choosing the top billed one to try and limit how many rows we have for each movie
    flw[[i]] <- flw[[i]] %>% unlist(recursive = TRUE) %>% t() %>% as.data.frame() #by now we have one big list of multiple one-dimensional lists which can be extracted and transposed into a single row data.frame for each movie
  }, error = function(e){}) #there are a few movies with no cast data (silent animated shorts like Piper). This just lets the loop blow past those errors
}

flwa <- flw[-c(99, 304, 505, 600, 1408, 3541)] #Yes I went through all 6000 entries and found the 6 that were causing problems
#rm(flw)
################################
#Cant run this all at once. It is too large, so I broke it up into really small components so it runs quickly

flwa1 <- flwa[1:200]
flwa1 <- bind_rows(flwa1)
flwa <- flwa[-c(1:200)]

flwa2 <- flwa[1:200]
flwa2 <- bind_rows(flwa2, flwa1)
flwa <- flwa[-c(1:200)]
rm(flwa1)

flwa3 <- flwa[1:200]
flwa3 <- bind_rows(flwa3, flwa2)
flwa <- flwa[-c(1:200)]
rm(flwa2)

flwa4 <- flwa[1:200]
flwa4 <- bind_rows(flwa4, flwa3)
flwa <- flwa[-c(1:200)]
rm(flwa3)

flwa5 <- flwa[1:200]
flwa5 <- bind_rows(flwa5, flwa4)
flwa <- flwa[-c(1:200)]
rm(flwa4)

flwa6 <- flwa[1:200]
flwa6 <- bind_rows(flwa6, flwa5)
flwa <- flwa[-c(1:200)]
rm(flwa5)

flwa7 <- flwa[1:200]
flwa7 <- bind_rows(flwa7, flwa6)
flwa <- flwa[-c(1:200)]
rm(flwa6)

flwa8 <- flwa[1:200]
flwa8 <- bind_rows(flwa8, flwa7)
flwa <- flwa[-c(1:200)]
rm(flwa7)

flwa9 <- flwa[1:200]
flwa9 <- bind_rows(flwa9, flwa8)
flwa <- flwa[-c(1:200)]
rm(flwa8)

flwa10 <- flwa[1:200]
flwa10 <- bind_rows(flwa10, flwa9)
flwa <- flwa[-c(1:200)]
rm(flwa9)

flwa11 <- flwa[1:200]
flwa11 <- bind_rows(flwa11, flwa10)
flwa <- flwa[-c(1:200)]
rm(flwa10)

flwa12 <- flwa[1:200]
flwa12 <- bind_rows(flwa12, flwa11)
flwa <- flwa[-c(1:200)]
rm(flwa11)

flwa13 <- flwa[1:200]
flwa13 <- bind_rows(flwa13, flwa12)
flwa <- flwa[-c(1:200)]
rm(flwa12)

flwa14 <- flwa[1:200]
flwa14 <- bind_rows(flwa14, flwa13)
flwa <- flwa[-c(1:200)]
rm(flwa13)

flwa15 <- flwa[1:200]
flwa15 <- bind_rows(flwa15, flwa14)
flwa <- flwa[-c(1:200)]
rm(flwa14)

flwa16 <- flwa[1:200]
flwa16 <- bind_rows(flwa16, flwa15)
flwa <- flwa[-c(1:200)]
rm(flwa15)

flwa17 <- flwa[1:200]
flwa17 <- bind_rows(flwa17, flwa16)
flwa <- flwa[-c(1:200)]
rm(flwa16)

flwa18 <- flwa[1:200]
flwa18 <- bind_rows(flwa18, flwa17)
flwa <- flwa[-c(1:200)]
rm(flwa17)

flwa19 <- flwa[1:200]
flwa19 <- bind_rows(flwa19, flwa18)
flwa <- flwa[-c(1:200)]
rm(flwa18)

flwa20 <- flwa[1:200]
flwa20 <- bind_rows(flwa20, flwa19)
flwa <- flwa[-c(1:200)]
rm(flwa19)

flwa21 <- flwa[1:200]
flwa21 <- bind_rows(flwa21, flwa20)
flwa <- flwa[-c(1:200)]
rm(flwa20)

flwa22 <- flwa[1:200]
flwa22 <- bind_rows(flwa22, flwa21)
flwa <- flwa[-c(1:200)]
rm(flwa21)

flwa23 <- flwa[1:200]
flwa23 <- bind_rows(flwa23, flwa22)
flwa <- flwa[-c(1:200)]
rm(flwa22)

flwa24 <- flwa[1:200]
flwa24 <- bind_rows(flwa24, flwa23)
flwa <- flwa[-c(1:200)]
rm(flwa23)

flwa25 <- flwa[1:200]
flwa25 <- bind_rows(flwa25, flwa24)
flwa <- flwa[-c(1:200)]
rm(flwa24)

flwa26 <- flwa[1:200]
flwa26 <- bind_rows(flwa26, flwa25)
flwa <- flwa[-c(1:200)]
rm(flwa25)

flwa27 <- flwa[1:200]
flwa27 <- bind_rows(flwa27, flwa26)
flwa <- flwa[-c(1:200)]
rm(flwa26)

flwa28 <- flwa[1:200]
flwa28 <- bind_rows(flwa28, flwa27)
flwa <- flwa[-c(1:200)]
rm(flwa27)

flwa29 <- flwa[1:200]
flwa29 <- bind_rows(flwa29, flwa28)
flwa <- flwa[-c(1:200)]
rm(flwa28)

flwa30 <- flwa[1:194]
flwa30 <- bind_rows(flwa30, flwa29)
rm(flwa29)
###########Export CSV#####################################
write.csv(flwa30, "full.movie.scrape.data.csv")




##########Read in full scraped data set##############################

move <- read.csv("full.movie.scrape.data.csv")


################ DATA CLEANING ##########
#After careful tinkering, this should extract all the relevant information and make it workable
movies.scraped.and.bound <- move %>% select("budget", 
                                              genre.1 = genres.name1,
                                                      genre.2 = genres.name2,
                                                      genre.3 = genres.name3,
                                                      id,
                                                      original_language,
                                                      popularity,
                                                      production_companies.name1,
                                                      production_companies.name2,
                                                      production_companies.name3,
                                                      production_companies.name,
                                                      production_countries.name,
                                                      release_date,
                                                      revenue,
                                                      runtime,
                                                      spoken_languages.name,
                                                      status,
                                                      title,
                                                      vote_average,
                                                      vote_count,
                                                      actorX = credits.cast.name,
                                                      actor1 = credits.cast.name1,
                                                      actor2 = credits.cast.name2,
                                                      actor3 = credits.cast.name3,
                                                      actor4 = credits.cast.name4,
                                                      actor5 = credits.cast.name5,
                                                      #actor6 = credits.cast.name6,
                                                      #actor7 = credits.cast.name7,
                                                      #actor8 = credits.cast.name8,
                                                      #actor9 = credits.cast.name9,
                                                      #actor10 = credits.cast.name10,
                                                      Director = credits.crew.Director1,
                                                      Director2 = credits.crew.Director2,
                                                      DirectorX = credits.crew.Director,
                                                      DirectorXX = credits.crew.Director,
                                                      DirectorXXX = credits.crew.Director,
                                                      Editor = credits.crew.Editor1,
                                                      EditorX = credits.crew.Editor,
                                                      DP1 = 'credits.crew.Director.of.Photography1',
                                                      DP2 = 'credits.crew.Director.of.Photography2',
                                                      DP3 = 'credits.crew.Director.of.Photography3',
                                                      DPX = 'credits.crew.Director.of.Photography',
                                                      Composer = 'credits.crew.Original.Music.Composer1',
                                                      Screenwriter1 = credits.crew.Screenplay1,
                                                      Screenwriter2 = credits.crew.Screenplay2,
                                                      Screenwriter3 = credits.crew.Screenplay3,
                                                      ScreenwriterX = credits.crew.Screenplay,
                                                      ScreenwriterXX = credits.crew.Screenplay,
                                                      spoken_language = spoken_languages.name1,
                                                      Director3 = credits.crew.Director3,
                                                      ComposerX = 'credits.crew.Original.Music.Composer',
                                                      genreX = genres.name) %>%
  mutate(genre.1 = as.character(genre.1),
         genre.2 = as.character(genre.2),
         genre.3 = as.character(genre.3),
         genreX = as.character(genreX),
         genre.1 = ifelse(is.na(genre.1), genreX, genre.1),
         original_language.nameX = as.character(original_language),
         spoken_languages.name = as.character(spoken_languages.name),
         spoken_language = as.character(spoken_language),
         language = ifelse(is.na(spoken_languages.name), spoken_language, spoken_languages.name),
         production_companies.nameX = as.character(production_companies.name),
         production_companies.name1 = as.character(production_companies.name1),
         production_companies.name2 = as.character(production_companies.name2),
         production_companies.name3 = as.character(production_companies.name3),
         production_companies.name1 = ifelse(is.na(production_companies.name1), production_companies.nameX, production_companies.name1),
         release_date = ymd(release_date),
         release_year = year(release_date),
         status = as.character(status),
         actorX = as.character(actorX),
         actor1 = as.character(actor1),
         actor2 = as.character(actor2),
         actor3 = as.character(actor3),
         actor4 = as.character(actor4),
         actor5 = as.character(actor5),
         #actor6 = as.character(actor6),
         #actor7 = as.character(actor7),
         #actor8 = as.character(actor8),
         #actor9 = as.character(actor9),
         #actor10 = as.character(actor10),
         actor1 = ifelse(is.na(actor1), actorX, actor1),
         Director = as.character(Director),
         Director2 = as.character(Director2),
         Director3 = as.character(Director3),
         DirectorX = as.character(Director2),
         DirectorXX = as.character(DirectorXX),
         Director = ifelse(is.na(Director), DirectorX, Director),
         Director = ifelse(is.na(Director), DirectorXX, Director),
         Director = ifelse(is.na(Director), DirectorXXX, Director),
         Editor = as.character(Editor),
         EditorX = as.character(EditorX),
         Editor = ifelse(is.na(Editor), EditorX, Editor),
         DP1 = as.character(DP1),
         DP2 = as.character(DP2),
         DP3 = as.character(DP3),
         DPX = as.character(DPX),
         DP = ifelse(is.na(DP1), DPX, DP1),
         Composer = as.character(Composer),
         ComposerX = as.character(ComposerX),
         Composer = ifelse(is.na(Composer), ComposerX, Composer),
         Screenwriter1 = as.character(Screenwriter1),
         Screenwriter2 = as.character(Screenwriter2),
         Screenwriter3 = as.character(Screenwriter3),
         ScreenwriterX = as.character(ScreenwriterX),
         ScreenwriterXX = as.character(ScreenwriterXX),
         Screenwriter = ifelse(is.na(Screenwriter1), ScreenwriterX, Screenwriter1),
         popularity = as.character(popularity),
         popularity = as.numeric(popularity),
         revenue = as.character(revenue),
         revenue = as.numeric(revenue),
         runtime = as.character(runtime),
         runtime = as.numeric(runtime),
         vote_average = as.character(vote_average),
         vote_average = as.numeric(vote_average),
         vote_count = as.character(vote_count),
         vote_count = as.numeric(vote_count),
         budget = as.character(budget),
         budget = as.numeric(budget)) %>%
  select(-genreX, -actorX, production_companies.nameX, -production_companies.name, -Director3, -DirectorX, -DirectorXX, -DirectorXXX, -spoken_languages.name, -spoken_language, -EditorX, - DPX, -ComposerX, -ScreenwriterX, -DP2, -DP3, -Screenwriter3, -ScreenwriterXX, -production_companies.nameX, -DP1, -Screenwriter1, -Director2, -production_companies.name2, -production_companies.name3, -original_language, -production_countries.name, -status, Screenwriter2)




############ EXPORT FINAL DATA SET####



TMDb6000 <- movies.scraped.and.bound


#I want to clean this more to make it fit with the other format
TMDb6000 <- TMDb6000 %>% rename(ProdCompany.1 = production_companies.name1,
                                actor.1 = actor1,
                                actor.2 = actor2,
                                actor.3 = actor3,
                                actor.4 = actor4,
                                actor.5 = actor5) %>%
  mutate(genre.1 = ifelse(is.na(genre.1), "NULL", genre.1),
         genre.2 = ifelse(is.na(genre.2), "NULL", genre.2),
         genre.3 = ifelse(is.na(genre.3), "NULL", genre.3),
         actor.1 = ifelse(is.na(actor.1), "NULL", actor.1),
         actor.2 = ifelse(is.na(actor.2), "NULL", actor.2),
         actor.3 = ifelse(is.na(actor.3), "NULL", actor.3)) %>%
  mutate(Earnings = as.numeric(revenue),
         Director = as.factor(Director),
         actor.1 = as.factor(actor.1),
         actor2 = as.factor(actor.2),
         actor.3 = as.factor(actor.3),
         genre.1 = as.factor(genre.1),
         genre.2 = as.factor(genre.2),
         genre.3 = as.factor(genre.3))

moneymodel <- 
  lmer(revenue ~ 1 + genre.1 + genre.2 + genre.3 +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = TMDb6000, na.action = na.omit)

newdata <- data.frame(genre.1 = "Action",
                      genre.2 = "Adventure",
                      genre.3 = "Science Fiction",
                      Director = "Christopher Nolan",
                      actor.1 = "Chris Pratt",
                      actor.2 = "Brad Pitt",
                      actor.3 = "Mark Ruffalo")

predict(moneymodel, newdata)

setwd("~/Box Sync/R Codes/MovieShiny")
write.csv(TMDb6000, "TMDb.6000.csv") #In Todd voice from Bojack: "Hooray!"





