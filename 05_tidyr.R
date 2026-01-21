## My sample
library(gapminder)

data <- gapminder

View(data)

wide_data <- data |>
  select(country, lifeExp, year) |>
  spread(year, lifeExp)

View(wide_data)


## завантажити бібліотеку tidyverse
library(tidyverse)
library(here)

interviews <- read_csv(here("data", "SAFI_clean.csv"), na = "NULL")

## перевірте дані
interviews

## попередній перегляд даних
view(interviews)

# Переформатування даних за допомогою pivot_wider() і pivot_longer()
nrow(interviews)

interviews %>% 
  select(key_ID) %>% 
  distinct() %>%
  nrow()

# структура даних відповідає правилу: 
#кожен стовпець є змінною
#кожен ряд є спостереженням
#кожне значення має свою окрему клітинку

interviews %>%
  filter(village == "Chirodzo") %>%
  select(key_ID, village, interview_date, instanceID) %>%
  sample_n(size = 10)

# Це довгий формат даних


## to LONG -> key_id repeating
interviews_items_owned <- interviews %>%
  separate_longer_delim(items_owned, delim = ";") %>%
  replace_na(list(items_owned = "no_listed_items"))
View(interviews_items_owned)

interviews_items_owned <- interviews %>%
  separate_longer_delim(items_owned, delim = ";") %>%
  replace_na(list(items_owned = "no_listed_items")) %>%
  mutate(items_owned_logical = TRUE)
View(interviews_items_owned)

interviews_items_owned <- interviews %>%
  separate_longer_delim(items_owned, delim = ";") %>%
  replace_na(list(items_owned = "no_listed_items")) %>%
  group_by(key_ID) %>%
  mutate(items_owned_logical = TRUE,
         number_items = if_else(items_owned == "no_listed_items", 0, n())) %>%
  pivot_wider(names_from = items_owned,
              values_from = items_owned_logical,
              values_fill = list(items_owned_logical = FALSE))

View(interviews_items_owned)

# bicycles by village

interviews_items_owned %>%
  filter(bicycle) %>%
  group_by(village) %>%
  count(bicycle)

interviews_items_owned %>%
  group_by(village) %>%
  summarize(mean_items = mean(number_items))



## Long to wide
interviews_long <- interviews_items_owned %>%
  pivot_longer(cols = bicycle:car,
               names_to = "items_owned",
               values_to = "items_owned_logical")
View(interviews_long)

interviews_long <- interviews_long |> 
  filter(items_owned_logical)
View(interviews_long)

## Візуалізація даних ##
interviews_plotting <- interviews %>%
  ## pivot wider by items_owned
  separate_longer_delim(items_owned, delim = ";") %>%
  replace_na(list(items_owned = "no_listed_items")) %>%
  ## Use of grouped mutate to find number of rows
  group_by(key_ID) %>% 
  mutate(items_owned_logical = TRUE,
         number_items = if_else(items_owned == "no_listed_items", 0, n())) %>% 
  pivot_wider(names_from = items_owned,
              values_from = items_owned_logical,
              values_fill = list(items_owned_logical = FALSE)) %>% 
  ## pivot wider by months_lack_food
  separate_longer_delim(months_lack_food, delim = ";") %>%
  mutate(months_lack_food_logical = TRUE,
         number_months_lack_food = if_else(months_lack_food == "none", 0, n())) %>%
  pivot_wider(names_from = months_lack_food,
              values_from = months_lack_food_logical,
              values_fill = list(months_lack_food_logical = FALSE))

View(interviews_plotting)

write_csv(interviews_plotting, file = "data_output/interviews_plotting.csv")
