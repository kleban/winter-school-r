rm(list = ls())

library(tidyverse)
library(here)

interviews <- read_csv(
  here("data", "SAFI_clean.csv"), 
  na = "NULL")

View(interviews)

interviews

class(interviews)

## Inspecting data frames
dim(interviews)
nrow(interviews)
ncol(interviews)

head(interviews)
tail(interviews)

names(interviews)

## Summary
str(interviews)
summary(interviews)
glimpse(interviews)

library(psych)
psych::describe(interviews$years_liv)

## Subsetting data frames
## first element in the first column of the tibble
interviews[1, 1]

## first element in the 6th column of the tibble 
interviews[1, 6]

## first column of the tibble (as a vector)
interviews[[1]]

## first column of the tibble
interviews[1]

## first three elements in the 7th column of the tibble
interviews[1:3, 7]

## the 3rd row of the tibble
interviews[3, ]

## equivalent to head_interviews <- head(interviews)
head_interviews <- interviews[1:6, ]

interviews[, -3]          # The whole tibble, except the first column

interviews["village"]       # Result is a tibble

interviews[, "village"]     # Result is a tibble

interviews[["village"]]     # Result is a vector

interviews$village          # Result is a vector

## CHALLENAGE
#-----------------------------
# FACTORS

respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))

levels(respondent_floor_type)

nlevels(respondent_floor_type)

respondent_floor_type <- fct_recode(respondent_floor_type, brick = "cement") 
respondent_floor_type

respondent_floor_type_ordered <- factor(respondent_floor_type, 
                                        ordered = TRUE)
respondent_floor_type_ordered # after setting as ordered factor

##Converting factors

## create a vector from the data frame column "memb_assoc"
memb_assoc <- interviews$memb_assoc

## convert it into a factor
memb_assoc <- as.factor(memb_assoc)

## let's see what it looks like
memb_assoc

plot(memb_assoc)

### with missing
## Let's recreate the vector from the data frame column "memb_assoc"
memb_assoc <- interviews$memb_assoc

## replace the missing data with "undetermined"
memb_assoc[is.na(memb_assoc)] <- "undetermined"

## convert it into a factor
memb_assoc <- as.factor(memb_assoc)

## let's see what it looks like
memb_assoc

plot(memb_assoc)

## Dates
str(interviews)
library(lubridate)

dates <- interviews$interview_date
str(dates)

interviews$day <- day(dates)
interviews$month <- month(dates)
interviews$year <- year(dates)
interviews

### mm/dd/YYYY!!!!!! wrong strange format
char_dates <- c("7/31/2012", "8/9/2014", "4/30/2016")
str(char_dates)
as_date(char_dates, format = "%m/%d/%Y")

as_date(char_dates, format = "%m/%d/%y") #Y for year

??lubridate
ymd(char_dates)
dmy(char_dates)
mdy(char_dates)

interviews$new_date <- ymd(interviews$interview_date)
interviews$new_date
