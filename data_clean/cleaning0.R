library(tidyverse)

FILENAME <- "USA_Canada_2020_2024_Jul12.csv"
COUNTRY <- "United States"

words <- "Palestine|Israel|Gaza|Rafah|Jew|Zio"

read.csv(paste0("../../../datasets/acleddata/raw/", FILENAME)) %>%
	filter(country == COUNTRY) %>%
    	write.csv("../../../datasets/acleddata/clean/clean0.csv", row.names=FALSE)


