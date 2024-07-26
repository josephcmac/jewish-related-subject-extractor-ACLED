library(tidyverse)

FILENAME <- "clean0.csv"

words <- "Palestine|Israel|Gaza|Rafah|Jew|Zio"

filter_data <- function(df) {
	(
	unlist(with(df, map(notes, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(actor1, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(actor2, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(assoc_actor_1, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(assoc_actor_2, function(x) grepl(words, x, ignore.case=T))))
	) %>% 
	  df[.,] 
}

read.csv(paste0("../../../datasets/acleddata/clean/", FILENAME)) %>%
    	select(event_id_cnty, actor1, actor2,assoc_actor_1, assoc_actor_2, notes) %>%
    	filter_data %>% 
    	select(event_id_cnty, notes) %>%
    	write.csv("../../../datasets/acleddata/clean/clean1.csv", row.names=FALSE)


