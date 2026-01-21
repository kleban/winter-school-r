## load the tidyverse
library(tidyverse)
library(here)

interviews <- read_csv(here("data", "SAFI_clean.csv"), na = "NULL")

## inspect the data
interviews

## preview the data
# view(interviews)

##  Selecting columns and filtering rows

# to select columns throughout the dataframe
select(interviews, village, no_membrs, months_lack_food)
# to do the same thing with subsetting
interviews[c("village","no_membrs","months_lack_food")]
# to select a series of connected columns
select(interviews, village:respondent_wall_type)

# filters observations where village name is "Chirodzo"
filter(interviews, village == "Chirodzo")

# filters observations with "and" operator (comma)
# output dataframe satisfies ALL specified conditions
filter(interviews, village == "Chirodzo",
       rooms > 1,
       no_meals > 2)

# filters observations with "&" logical operator
# output dataframe satisfies ALL specified conditions
filter(interviews, village == "Chirodzo" &
         rooms > 1 &
         no_meals > 2)

# filters observations with "|" logical operator
# output dataframe satisfies AT LEAST ONE of the specified conditions
filter(interviews, village == "Chirodzo" | village == "Ruaca")
filter(interviews, village %in% c("Chirodzo", "Ruaca"))

## Slide pipe

## stage by stage
interviews2 <- filter(interviews, village == "Chirodzo")
interviews_ch <- select(interviews2, village:respondent_wall_type)

## all in one
interviews_ch <- select(filter(interviews, village == "Chirodzo"),
                        village:respondent_wall_type)
interviews_ch


# the following example is run using magrittr pipe but the output will be same with the native pipe
interviews %>%
  filter(village == "Chirodzo") %>%
  select(village:respondent_wall_type)

## CHALLANGE

interviews %>%
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)

## mutate

### people per room
interviews %>%
  mutate(people_per_room = no_membrs / rooms)

### people per room who give info about associationa / only not NA
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  mutate(people_per_room = no_membrs / rooms)


## Summarize

interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs))

#interviews %>%
 # group_by(village, memb_assoc) %>%
 # summarize(mean_no_membrs = mean(no_membrs)) %>%
 # ungroup()

## exclude memb_assoc NA
interviews %>%
  filter(!is.na(memb_assoc)) %>% ## new
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs)) 

# add min members
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) ## new

# sort by min_members
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
  arrange(min_membrs)

# sort desc

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
  arrange(desc(min_membrs))

## Counting

interviews %>%
  count(village)

interviews %>%
  count(village, sort = TRUE)

# CHALLANGES
## 1
interviews %>%
  count(no_meals)

## 2 - check answer only
interviews %>%
  group_by(village) %>%
  summarize(
    mean_no_membrs = mean(no_membrs),
    min_no_membrs = min(no_membrs),
    max_no_membrs = max(no_membrs),
    n = n()
  )

## 3 - check answer only
library(lubridate) # load lubridate if not already loaded
interviews %>%
  mutate(month = month(interview_date),
         day = day(interview_date),
         year = year(interview_date)) %>%
  group_by(year, month) %>%
  summarize(max_no_membrs = max(no_membrs))

## -------