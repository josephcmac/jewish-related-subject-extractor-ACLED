library(tidyverse)

INPUT_DATA <- "../../../datasets/acleddata/clean/clean2.csv"

OUTPUT_DATA <- "../../../datasets/acleddata/results/top.csv" 

compute <- function(df) {
	change_names1 <- function(df) {
		names(df) <- c("event_id_cnty", "org")
		df
	}

	change_names2 <- function(df) {
		names(df) <- c("anti-Israel organization", "count")
		df
	}

	df %>% change_names1() %>%
	group_by(org) %>% 
	summarise(count = n()) %>% 
	as.data.frame %>% 
	arrange(desc(count)) %>%
	change_names2()
}

read.table(INPUT_DATA, 
		  sep=",", 
		  header=TRUE,
		  quote = "\"") %>% na.omit() %>%
	compute() %>%
	write.table(OUTPUT_DATA, row.names=FALSE)



