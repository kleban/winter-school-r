3 + 5

12/9

## змінні та знак присвоєння (Alt + -)
area_hectares <- 1.0 

# іменування змінних
x <- 10
x1 <- 10
x_2<- 10
x.df <- 4

# конвертуємо у акри
2.47 * area_hectares

area_hectares <- 2.5
2.47 * area_hectares

area_acres <- 2.47 * area_hectares
area_acres

# коментарі

area_acres <- 50 # присвоїти 50
area_acres

!!!!!!!! Вправа

r_length <- 2.5
r_width <- 3.2
r_area <- r_length * r_width
r_area

# change the values of r_length and r_width
r_length <- 7.0
r_width <- 6.5
# the value of r_area isn't changed
r_area

--------------
  
## functions
b <- sqrt(a)
b


round(3.14159)
round(b)

args(round)

round(b, digits = 2)

?round

## Vectors and data types
## hh - household members - номери жителів
hh_members <- c(3, 7, 10, 6)
hh_members

# muddaub — саман, цегла з глини або грязі, висушена на сонці
# burnt bricks — цегла, обпалена у печі для міцності
# sunbricks — сонячна цегла або цегла, висушена на сонці — це той самий матеріал, що й саман, який сушили природним шляхом без обпалювання.

respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")
respondent_wall_type

length(hh_members)
length(respondent_wall_type) 

typeof(hh_members)
typeof(respondent_wall_type)

str(hh_members)
str(respondent_wall_type)

# extend vector
# possessions - майно
possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone") # add to the end of the vector
possessions <- c("car", possessions) # add to the beginning of the vector
possessions

## challenges

### EX 1

### EX 2
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(num_char)
class(char_logical)

### EX3 
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)

class(num_logical)
class(combined_logical)


## Subsetting vectors
respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")
respondent_wall_type[2]

respondent_wall_type[c(3, 2)]

more_respondent_wall_type <- respondent_wall_type[c(1, 2, 3, 2, 1, 3)]
more_respondent_wall_type

### Conditional subsetting

hh_members <- c(3, 7, 10, 6)
hh_members[c(TRUE, FALSE, TRUE, TRUE)]

### Оператори  порівняння
hh_members > 5
hh_members[hh_members > 5]
hh_members[hh_members < 4 | hh_members > 7]
hh_members[hh_members >= 4 & hh_members <= 7]


### Оператори відношення
possessions <- c("car", "bicycle", "radio", "television", "mobile_phone")
possessions[possessions == "car" | possessions == "bicycle"]

possessions %in% c("car", "bicycle")

### Missing data
# Кількість кімнат у будинку
rooms <- c(2, 1, 1, NA, 7)

mean(rooms)

max(rooms)

mean(rooms, na.rm = TRUE)

max(rooms, na.rm = TRUE)

is.na(rooms)
rooms[!is.na(rooms)]

# скіль є пропусків
sum(is.na(rooms))

rooms[complete.cases(rooms)]

## CHALLANGES!!!!

rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)

### EX1
median(rooms, na.rm = TRUE)

### EX2
rooms_above_2 <- rooms_no_na[rooms_no_na > 2]
length(rooms_above_2)


