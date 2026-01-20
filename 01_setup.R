if(!("installr" %in% installed.packages())) {
  install.packages("installr")
}

# Ctrl+Enter

installr::updateR(TRUE)

# create folders
dir.create("data")
dir.create("data_output")
dir.create("fig_output")

# dataset
# https://github.com/datacarpentry/r-socialsci/blob/main/episodes/data/SAFI_clean.csv

# download datase
download.file("https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv","data/SAFI_clean.csv", mode = "wb")

## install packages
install.packages ("tidyverse")
install.packages ("here")